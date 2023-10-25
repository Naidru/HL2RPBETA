ITEM.name = "Doorbust Charge"
ITEM.model = "models/props_c17/consolebox05a.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 215
ITEM.description = "A powerful explosive that can be used to breach even fortified doors."

-- You can use hunger table? i guess? 
ITEM.functions = ITEM.functions or {}
ITEM.functions.throw = {
	name = "Charge",
	tip = "useTip",
	icon = "icon16/brick.png",
	OnRun = function(item)
		local client = item.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*96
			data.filter = client
		local trace = util.TraceLine(data)
		local target = trace.Entity
		
		if (IsValid(client)) then
			local char = client:GetCharacter()
			local class = char:GetClass()
			local classData = ix.class.list[class]
			
			--[[if (!class) then
				client:NotifyLocalized("notLaw")
				
				return false
			end]]
		end
		
		local auth = hook.Run("CanUseDoorbust", client, target)
		
		if (auth == false) then
			return false
		end

		if (IsValid(target) and (target:IsDoor() or target.fadeActivate)) then
			local ent = ents.Create("ix_dcharge")
			local angles = trace.HitNormal:Angle()
			local axis = Angle(angles[1], angles[2], angles[3])
			angles:RotateAroundAxis(axis:Right(), 90)
			ent:SetParent(target)
			ent:SetPos(trace.HitPos + trace.HitNormal * 3)
			ent:SetAngles(angles)
			ent:Spawn()
			ent:Activate()
			ent:ManipulateBoneScale(0, Vector(1, 1, 1)*.5)

			return true
		end

		return false
	end,
}