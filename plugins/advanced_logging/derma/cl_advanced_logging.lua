local PANEL = {}

function PANEL:Init()
	if IsValid(ix.gui.advlog) then
		ix.gui.advlog:Remove()
	end

	ix.gui.advlog = self

	self:SetSize(ScrH() * .8, ScrH() * .6)
	self:Center()
	self:MakePopup()
	self:SetTitle("Advanced Logging")
    self:SetFontInternal("ixSmallFont")
    self:SetSizable(true)

	self.sheet = self:Add("DPropertySheet")
	self.sheet:Dock(FILL)

	self.allLogs = self.sheet:Add("DPanel")

    self.allLogs.refresh = self.allLogs:Add("DButton")
    self.allLogs.refresh:Dock(TOP)
    self.allLogs.refresh:SetText("Refresh")
    self.allLogs.refresh:SetIcon("icon16/database_refresh.png")
    self.allLogs.refresh.DoClick = function()
        self:PullLogs()
    end
    
    local typeEvent = function(search, keyCode)
        if keyCode == KEY_ENTER then
            self:PullLogs()
        end
    end
    local inputEvent = function(self, char)
        if char == '`' or char == '~' then return true end
    end

    self.allLogs.player = self.allLogs:Add("DTextEntry")
    self.allLogs.player:SetPlaceholderText("Player")
    self.allLogs.player:Dock(TOP)
    self.allLogs.player.OnKeyCodeTyped = typeEvent
    self.allLogs.player.AllowInput = inputEvent

    self.allLogs.item = self.allLogs:Add("DTextEntry")
    self.allLogs.item:SetPlaceholderText("Item")
    self.allLogs.item:Dock(TOP)
    self.allLogs.item.OnKeyCodeTyped = typeEvent
    self.allLogs.item.AllowInput = inputEvent

    self.allLogs.character = self.allLogs:Add("DTextEntry")
    self.allLogs.character:SetPlaceholderText("Character")
    self.allLogs.character:Dock(TOP)
    self.allLogs.character.OnKeyCodeTyped = typeEvent
    self.allLogs.character.AllowInput = inputEvent

    self.allLogs.clear = self.allLogs:Add("DButton")
    self.allLogs.clear:SetText("Clear")
    self.allLogs.clear:Dock(TOP)
    self.allLogs.clear.DoClick = function()
        self.allLogs.player:SetText("")
        self.allLogs.item:SetText("")
        self.allLogs.character:SetText("")
        self:PullLogs()
    end
    
    self.allLogs.search = self.allLogs:Add("DTextEntry")
    self.allLogs.search:Dock(TOP)
    self.allLogs.search:SetPlaceholderText("Search")
    self.allLogs.search.OnKeyCodeTyped = function(search, keyCode)
        if keyCode == KEY_ENTER then
            self:PullLogs()
        end
    end
    self.allLogs.search.AllowInput = function(self, char)
        if char == '`' or char == '~' then return true end
    end
    self.allLogs.search:RequestFocus()
    
    self.allLogs.list = self.allLogs:Add("DListView")
    self.allLogs.list:Dock(FILL)
    self.allLogs.list:SetMultiSelect(false)

    self.allLogs.list.Paint = function(_, w, h)
        surface.SetDrawColor(50, 50, 50)
        surface.DrawRect(0, 0, w, h)
    end

    self.allLogs.list:AddColumn("Time")
    self.allLogs.list:AddColumn("Type")
    self.allLogs.list:AddColumn("Player")
    self.allLogs.list:AddColumn("Log"):SetFixedWidth(ScrH() * .45)

    for _, v in ipairs(self.allLogs.list.Columns) do
        v.Paint = function(_, w, h)
            surface.SetDrawColor(25, 25, 25)
            surface.DrawRect(0, 0, w, h)
        end
    end

    self.allLogs.list.OnRowRightClick = function(_, lineID, line)
        timer.Simple(0, function()
            local m = DermaMenu()
            m.Paint = function(_, w, h)
                surface.SetDrawColor(25, 25, 25)
                surface.DrawRect(0, 0, w, h)
            end

            local log = line.log

            if log.steamid and IsValid(player.GetBySteamID64(log.steamid)) then
                local ply = player.GetBySteamID64(log.steamid)

                m:AddOption("Goto Player", function()
                    RunConsoleCommand("ulx", "goto", ply:Name())
                end):SetIcon("icon16/arrow_right.png")

                m:AddOption("Bring Player", function()
                    RunConsoleCommand("ulx", "bring", ply:Name())
                end):SetIcon("icon16/arrow_left.png")
            end

            if log.log_x then
                m:AddOption("Goto Incident Location", function()
                    RunConsoleCommand("ix", "GotoPos", log.log_x, log.log_y, log.log_z)
                end):SetIcon("icon16/arrow_right.png")
            end

            if log.item_id and log.item_id != "NULL" then
                m:AddOption("Take Item", function()
                    RunConsoleCommand("ix", "ItemBring", log.item_id)
                end):SetIcon("icon16/brick.png")

                m:AddOption("Delete Item", function()
                    RunConsoleCommand("ix", "ItemDelete", log.item_id)
                end):SetIcon("icon16/delete.png")
            end

            -- move these to the bottom

            if log.steamid then
                local ply = player.GetBySteamID64(log.steamid)

                m:AddOption("View Player Logs", function()
                    self.allLogs.player:SetText(log.steamid)
                    self:PullLogs()
                end):SetIcon("icon16/magnifier.png")
            end

            if log.item_id and log.item_id != "NULL" then
                m:AddOption("View Item Logs", function()
                    self.allLogs.item:SetText(log.item_id)
                    self:PullLogs()
                end):SetIcon("icon16/magnifier.png")
            end

            if log.character_id and log.character_id != "NULL" then
                m:AddOption("View Character Logs", function()
                    self.allLogs.character:SetText(log.character_id)
                    self:PullLogs()
                end):SetIcon("icon16/magnifier.png")
            end

            m:AddOption("Copy Log", function()
                SetClipboardText((os.date("[%x %X] ", log.log_time) or "[N/A] ") .. log.log_string)
            end):SetIcon("icon16/paste_plain.png")
            
            m:Open()
            m:RequestFocus()
        end)
    end

	self.sheet:AddSheet("All Logs", self.allLogs, "icon16/brick.png")

    self.logCount = self:Add("DLabel")
    self.logCount:SetTextColor(Color(255, 255, 255))
    self.logCount:Dock(BOTTOM)
    self.logCount:SetText("")

    self.logLimit = self:Add("DNumberWang")
    self.logLimit:Dock(BOTTOM)
    self.logLimit:SetValue(ix.plugin.Get("advanced_logging").limit or 500)
    self.logLimit:SetText(tostring(ix.plugin.Get("advanced_logging").limit or 500))
    self.logLimit.OnValueChanged = function(limit, keyCode)
        ix.plugin.Get("advanced_logging").limit = limit:GetValue()
        self:PullLogs()
    end

	self:PullLogs()
end

function PANEL:PullLogs()
    net.Start("ixLoggingPull")
    net.WriteInt(self.logLimit:GetValue() or 500, 32)

    local filter = {}

    if self.allLogs.search:GetText():gsub("%s+", "") != "" then
        filter["search"] = self.allLogs.search:GetText()
    end

    if self.allLogs.player:GetText():gsub("%s+", "") != "" then
        filter["player"] = self.allLogs.player:GetText()
    end

    if self.allLogs.item:GetText():gsub("%s+", "") != "" then
        filter["item"] = self.allLogs.item:GetText()
    end

    if self.allLogs.character:GetText():gsub("%s+", "") != "" then
        filter["character"] = self.allLogs.character:GetText()
    end 

    net.WriteTable(filter or {})
    net.SendToServer()
end

function PANEL:AppendLog(log)
    if log.data then
        log.dataParsed = util.JSONToTable(log.data)
    end

    local line = self.allLogs.list:AddLine(
        os.date("[%x %X]", log.log_time) or "N/A", 
        log.log_type or "N/A", 
        log.steam_name or "N/A", 
        log.log_string or "N/A"
    )
    line.log = log

    for k, v in ipairs(line.Columns) do
        local col = Color(217,231,203)
        local font = "ixLogs"
        if k == 1 then
            col = Color(200, 200, 200)
        end
        if k == 2 then
            col = Color(187,231,245)
            font = "ixLogsBold"
        end
        if k == 3 then
            col = Color(245, 249, 174)
            font = "ixLogsBold"
        end
        v:SetTextColor(col)
        v:SetFont(font)
    end
    
end

vgui.Register("ixAdvancedLogging", PANEL, "DFrame")

net.Receive("ixLoggingReceive", function()
    if !IsValid(ix.gui.advlog) then return end

    local size = net.ReadInt(32)
    local data = net.ReadData(size)
    local logs = util.JSONToTable(util.Decompress(data)) or {}

    ix.gui.advlog.allLogs.list:Clear()

    for _, v in ipairs(logs) do
        ix.gui.advlog:AppendLog(v)
    end

    ix.gui.advlog.logCount:SetText("Viewing " .. #logs .. " logs.")
end)