
local PLUGIN = PLUGIN

PLUGIN.name = "Radio Chatbox"
PLUGIN.author = "faust"
PLUGIN.description = "Creates another chatbox above the regular one for radio chatter only."

ix.config.Add("enableRadioChatbox", true, "Whether or not to show radio messages in their own chatbox.", nil, {
	category = "Extended Radio"
})

if (CLIENT) then

	function PLUGIN:ChatboxPositionChanged(x, y, width, height)
		if (IsValid(self.rpanel)) then
			local w,h = ix.gui.chat:GetDefaultSize()
			local border = 16
			local magic = (643-459-border)
			local magicHeight = 155
			self.rpanel:SetSize(w, magicHeight)
			self.rpanel:SetPos(x, y - magic) --+ border - h)
		end
	end
	
	function PLUGIN:CreateRadiochat()
		if (IsValid(self.rpanel)) then
			self.rpanel:Remove()
		end
		
		self.rpanel = vgui.Create("radioChatbox")
		self.rpanel:SetupPosition(util.JSONToTable(ix.option.Get("chatPosition", "")))
		
		--hook.Run("ChatboxCreated")
	end
	function PLUGIN:InitPostEntity()
		self:CreateRadiochat()
		--hook.Run("ChatboxPositionChanged",x,y,width,height)
	end
	
		-- luacheck: globals chat
	chat.ixAddText = chat.ixAddText or chat.AddText

	function chat.AddText(...)
		local chat_class = CHAT_CLASS
		local radiocheck = false
		
		if (chat_class != nil) then
			if (ix.config.Get("enableRadioChatbox") == false) then
				radiocheck = false
			elseif ((chat_class.uniqueID == "radio") or (chat_class.uniqueID == "radio_yell") or (chat_class.uniqueID == "radio_whisper")) then
				radiocheck = true
			end
		end

		
		if (IsValid(ix.gui.chat) and !radiocheck) then
		
			ix.gui.chat:AddMessage(...)
			
		elseif (IsValid(PLUGIN.rpanel) and radiocheck) then
		
			PLUGIN.rpanel:AddMessage(...)
			
		end

		-- log chat message to console
		local text = {}

		for _, v in ipairs({...}) do
			if (istable(v) or isstring(v)) then
				text[#text + 1] = v
			elseif (isentity(v) and v:IsPlayer()) then
				text[#text + 1] = team.GetColor(v:Team())
				text[#text + 1] = v:Name()
			elseif (type(v) != "IMaterial") then
				text[#text + 1] = tostring(v)
			end
		end

		text[#text + 1] = "\n"
		MsgC(unpack(text))
	end
	
else
	util.AddNetworkString("ixChatMessage")

	net.Receive("ixChatMessage", function(length, client)
		local text = net.ReadString()

		if ((client.ixNextChat or 0) < CurTime() and isstring(text) and text:find("%S")) then
			hook.Run("PlayerSay", client, text)
			client.ixNextChat = CurTime() + 0.5
		end
	end)
end