// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.

local config = {
	smokeColor = Color(63, 127, 0),
	smokeAlpha = 110,
	maskItem = "gasmask",
	smokeSpawnerDistance = 100 -- distance between the smoke emitters on the box line
}

local PLUGIN = PLUGIN
PLUGIN.name = "Toxic Gas"
PLUGIN.author = "liquid"
PLUGIN.description = "Adds configurable toxic gas and gas-mask item."
PLUGIN.positions = PLUGIN.positions or {}
PLUGIN.smokeStacks = PLUGIN.smokeStacks or {}

ix.option.Add("renderToxicGas", ix.type.bool, true, {
	category = "Toxic Gas"
})

ix.option.Add("toxicGasTransparency", ix.type.number, 255, {
	category = "Toxic Gas",
	min = 100,
	max = 255
})

function PLUGIN:LoadData()
	PLUGIN.positions = self:GetData()
	self:UpdateWorldData()
end

function PLUGIN:SaveData()
	self:SetData(PLUGIN.positions)
	self:UpdateWorldData()
end

function PLUGIN:UpdateWorldData()
	SetNetVar("toxicGasPositions", PLUGIN.positions)
end

function PLUGIN:IsEquippingGasmask(ply)
	local character = ply:GetCharacter()
	if not character then return false end
	local inventory = character:GetInventory()

	for _, item in pairs(inventory:GetItems()) do
		if item.uniqueID == config.maskItem and item:GetData("equip", false) == true and item:GetData("airfilter", false) == true then return true end
		if item.uniqueID == "hazmat2" and item:GetData("equip", false) == true then return true end
	end

	return false
end

local function GetBoxLine(min, max)
	local deltaX = math.abs(min.x - max.x)
	local deltaY = math.abs(min.y - max.y)
	local lineStart, lineEnd

	if deltaX < deltaY then
		lineStart = Vector(min.x + (max.x - min.x) / 2, min.y, min.z)
		lineEnd = Vector(min.x + (max.x - min.x) / 2, min.y + (max.y - min.y), min.z)
	else
		lineStart = Vector(min.x, min.y + (max.y - min.y) / 2, min.z)
		lineEnd = Vector(min.x + (max.x - min.x), min.y + (max.y - min.y) / 2, min.z)
	end

	return lineStart, lineEnd
end

if SERVER then
    util.AddNetworkString("ixToxicGasPVS")

	timer.Create("ixToxicGasPVS", 1, 0, function()
		for _, ply in ipairs(player.GetAll()) do
			local pos = ply:EyePos()
			if not ply:Alive() then continue end
			local canBreathe = false
			local character = ply:GetCharacter()

			if ply:IsDispatch() then
				canBreathe = true
			end

			if ply:IsCombine() then
				canBreathe = true
			end

			if ply:Team() == FACTION_VORT then
				canBreathe = true
			end

			if ply:Team() == FACTION_FREEVORT then
				canBreathe = true
			end

			if ply:Team() == FACTION_CIC then
				canBreathe = true
			end
			
			if not canBreathe then
				canBreathe = PLUGIN:IsEquippingGasmask(ply)
			end

			local noFlag = false

			if ply:IsAdmin() and (ply:GetMoveType() == MOVETYPE_NOCLIP or ply:Team() == FACTION_STAFF) then
				canBreathe = true
				noFlag = true
			end

			if ply:Team() == FACTION_EVENT then
				canBreathe = true
				noFlag = true
			end

			if (ply.inToxicGas == true and ply:GetLocalVar("stm") > 25 and not canBreathe) then
				ply:SetLocalVar("stm", character:GetData("stamina", 100) / 4)
			end

			if (ply.inToxicGas == true and ply:GetLocalVar("stm") < 15 and not canBreathe) then
				ply:SetLocalVar("stm", 1)
			end

			if ply:IsUserGroup("moderator") and (ply:GetMoveType() == MOVETYPE_NOCLIP or ply:Team() == FACTION_STAFF) then
				canBreathe = true
				noFlag = true
			end

			local pvsDirty = false

			for gasBoxIdx, gasBox in pairs(PLUGIN.positions) do
				local center = (gasBox.min + gasBox.max) / 2
				local lineStart, lineEnd = GetBoxLine(gasBox.min, gasBox.max)
				ply.gasPVS = ply.gasPVS or {}
				local oldPVS = ply.gasPVS[gasBoxIdx]
				local pvs = ply:TestPVS(center)

				if not pvs then
					pvs = ply:TestPVS(lineStart)
				end

				if not pvs then
					pvs = ply:TestPVS(lineEnd)
				end

				ply.gasPVS[gasBoxIdx] = pvs

				if oldPVS ~= pvs then
					pvsDirty = true
				end

				if pos:WithinAABox(gasBox.min, gasBox.max) then
					if not noFlag then
						ply.inToxicGas = true
					end

					if not canBreathe then
						ply.nextGasDamage = ply.nextGasDamage or CurTime()

						if CurTime() >= ply.nextGasDamage then
							ply.nextGasDamage = CurTime() + 0.75
							local d = DamageInfo()
							d:SetDamage(20)
							d:SetAttacker(ply)
							d:SetDamageType(DMG_DISSOLVE)
							ply:TakeDamageInfo(d)
							ix.util.Notify("You are choking. You need a gas mask.", ply)
						end
					end

					break
				else
					ply.inToxicGas = nil
				end
			end

			if pvsDirty then
                net.Start("ixToxicGasPVS")
                net.WriteTable(ply.gasPVS)
                net.Send(ply)
			end
		end
	end)
end

if CLIENT then
	-- toggles showing toxic gas boxes when in noclip/observer
	CreateConVar("ix_toxicgas_observer", "0", FCVAR_ARCHIVE)

	local function IsInRange(min, max, scale)
		local localPos = LocalPlayer():GetPos()
		local distance = min:Distance(max)
		if localPos:Distance(min + ((max - min) / 2)) <= distance * scale then return true end

		return false
	end

	function PLUGIN:GetPixVisHandle()
		self.pixVisCount = self.pixVisCount + 1

		if not self.pixVisHandles[self.pixVisCount] then
			self.pixVisHandles[self.pixVisCount] = util.GetPixelVisibleHandle()
		end

		return self.pixVisHandles[self.pixVisCount]
	end

	function PLUGIN:IsBoxVisible(min, max, threshold)
		local pixVis = self:GetPixVisHandle()

		if not threshold then
			threshold = 0
		end

		local startBox, endBox = GetBoxLine(min, max)
		local height = math.abs(max.z - min.z)

		for i = 0, startBox:Distance(endBox) / height do
			local normal = (endBox - startBox):GetNormalized()
			local spherePos = startBox + Vector(0, 0, (max.z - min.z) / 2) + normal * height / 2
			local sphereLineDist = math.min(i * height, startBox:Distance(endBox) - height)
			spherePos = spherePos + normal * sphereLineDist
			local visibility = util.PixelVisible(spherePos, 1, pixVis)
			if visibility > threshold then return true end
		end

		return false
	end

	function PLUGIN:PostDrawTranslucentRenderables()
		local observerCvar = GetConVar("ix_toxicgas_observer")
		if not LocalPlayer():IsAdmin() or LocalPlayer():GetMoveType() ~= MOVETYPE_NOCLIP or not observerCvar or not observerCvar:GetBool() then return end
		local toxicGasPositions = GetNetVar("toxicGasPositions", {})
		local gasPVS = self.gasPVS or {}

		for gasBoxIdx, gasBox in pairs(toxicGasPositions) do
			local min, max = gasBox.min, gasBox.max
			if not IsInRange(min, max, 5) then continue end
			render.DrawWireframeBox(min, Angle(), Vector(0, 0, 0), max - min, gasPVS[gasBoxIdx] and Color(142, 222, 131) or Color(255, 0, 0), false)
			local startSmoke, endSmoke = GetBoxLine(min, max)
			render.DrawLine(startSmoke, endSmoke, Color(0, 255, 0), false)
		end
	end

	function PLUGIN:Tick()
		if not ix.option.Get("renderToxicGas", true) then return end
		local gasPVS = self.gasPVS or {}
		self.nextRunTime = self.nextRunTime or 0
		if self.nextRunTime > CurTime() then return end
		self.nextRunTime = CurTime() + .1
		local toxicGasPositions = GetNetVar("toxicGasPositions", {})

		for gasBoxIdx, gasBox in pairs(toxicGasPositions) do
			local min, max = gasBox.min, gasBox.max
			if not gasPVS[gasBoxIdx] then continue end
			
			local pos = min 
			local emitter = ParticleEmitter(pos)
			emitter:SetBBox(min, max)

			for i = 1, 1 do
				local partPos = Vector(math.random(min.x, max.x), math.random(min.y, max.y), min.z + (math.random((max.z - min.z) * .1, (max.z - min.z) * .7)))
				local part = emitter:Add("particle/particle_smokegrenade.vmt", partPos)

				if (part) then
					part:SetDieTime(8)
					part:SetColor(63, 127, 0)
					part:SetStartAlpha(0)
					part:SetEndAlpha(ix.option.Get("toxicGasTransparency", 255))
					part:SetStartSize(200)
					part:SetEndSize(0)
					part:SetCollide(true)
					part:SetGravity(Vector(0, 0, 0)) 
					part:SetVelocity(VectorRand() * .25)
				end
			end

			emitter:Finish()
		end
	end
    
    net.Receive("ixToxicGasPVS", function()
        PLUGIN.gasPVS = net.ReadTable()
    end)
end

ix.command.Add("AddToxicGas", {
	description = "Adds a toxic gas box from where you're standing and where you're looking at.",
	adminOnly = true,
	OnRun = function(self, client)
		local pos = client:GetPos()
		local tr = client:GetEyeTrace()
		if !client:SteamID64("76561198066770648") then client:NotifyLocalized("notAllowed") return end
		if not tr then return end
		local hitPos = tr.HitPos

		table.insert(PLUGIN.positions, {
			min = pos,
			max = hitPos
		})

		PLUGIN:SaveData()

		return "Added toxic gas."
	end
})

ix.command.Add("RemoveToxicGas", {
	description = "Removes the closest toxic gas point relative to you.",
	adminOnly = true,
	OnRun = function(self, client)
		local closestDistance = -1
		local closestIndex = -1
		if !client:SteamID64("76561198066770648") then client:NotifyLocalized("notAllowed") return end

		for idx, gasBox in pairs(PLUGIN.positions) do
			local min, max = gasBox.min, gasBox.max
			local center = min + ((max - min) / 2)
			local distance = client:GetPos():Distance(center)

			if closestDistance == -1 or distance < closestDistance then
				closestDistance = distance
				closestIndex = idx
			end
		end

		if closestIndex ~= -1 then
			table.remove(PLUGIN.positions, closestIndex)

			if PLUGIN.smokeStacks[closestIndex] then
				for k, v in pairs(PLUGIN.smokeStacks[closestIndex].stacks) do
					v:Remove()
				end

				table.remove(PLUGIN.smokeStacks, closestIndex)
			end

			PLUGIN:SaveData()

			return "Removed 1 toxic gas box."
		else
			return "Could not find any toxic gas to remove!"
		end
	end
})