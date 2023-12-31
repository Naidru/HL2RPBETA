local PLUGIN = PLUGIN


AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Rebel shoddy bypassed Lock"
ENT.Category = "HL2 RP"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.PhysgunDisable = true
ENT.bNoPersist = true
ENT.key = "rebelcard"
ENT.lockedColor = Color(255, 50, 0, 255) -- The key that is required to open the door. This is the item's Unique ID.
-- See read me for creating new locks and keys
ENT.spawnClassName = "ix_rbllock"

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Locked")
	self:NetworkVar("Bool", 1, "DisplayError")

	if (SERVER) then
		self:NetworkVarNotify("Locked", self.OnLockChanged)
	end
end

if (SERVER) then
	function ENT:GetLockPosition(door, normal)
		local index = door:LookupBone("handle")
		local position = door:GetPos()
		normal = normal or door:GetForward():Angle()

		if (index and index >= 1) then
			position = door:GetBonePosition(index)
		end

		position = position + normal:Forward() * 7.2 + normal:Up() * 10 + normal:Right() * 2

		normal:RotateAroundAxis(normal:Up(), 90)
		normal:RotateAroundAxis(normal:Forward(), 180)
		normal:RotateAroundAxis(normal:Right(), 180)

		return position, normal
	end

	function ENT:SetDoor(door, position, angles)
		if (!IsValid(door) or !door:IsDoor()) then
			return
		end

		local doorPartner = door:GetDoorPartner()

		self.door = door
		self.door:DeleteOnRemove(self)
		door.ixLock = self

		if (IsValid(doorPartner)) then
			self.doorPartner = doorPartner
			self.doorPartner:DeleteOnRemove(self)
			doorPartner.ixLock = self
		end

		self:SetPos(position)
		self:SetAngles(angles)
		self:SetParent(door)
	end

	function ENT:SpawnFunction(client, trace)
		local door = trace.Entity

		if (!IsValid(door) or !door:IsDoor() or IsValid(door.ixLock)) then
			return client:NotifyLocalized("dNotValid")
		end

		local normal = client:GetEyeTrace().HitNormal:Angle()
		local position, angles = self:GetLockPosition(door, normal)

		local entity = ents.Create(self.spawnClassName)
		entity:SetPos(trace.HitPos)
		entity:Spawn()
		entity:Activate()
		entity:SetDoor(door, position, angles)

		PLUGIN:SaveCombineLocks()
		return entity
	end

	function ENT:Initialize()
		self:SetModel("models/willardnetworks/props_combine/wn_rebel_lock.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		self:SetUseType(SIMPLE_USE)

		self.nextUseTime = 0
	end

	function ENT:OnRemove()
		if (IsValid(self)) then
			self:SetParent(nil)
		end

		if (IsValid(self.door)) then
			self.door:Fire("unlock")
			self.door.ixLock = nil
		end

		if (IsValid(self.doorPartner)) then
			self.doorPartner:Fire("unlock")
			self.doorPartner.ixLock = nil
		end

		if (!ix.shuttingDown) then
			PLUGIN:SaveCombineLocks()
		end
	end

	function ENT:OnLockChanged(name, bWasLocked, bLocked)
		if (!IsValid(self.door)) then
			return
		end

		if (bLocked) then
			self:EmitSound("npc/roller/code2.wav")
			self.door:Fire("lock")
			self.door:Fire("close")

			if (IsValid(self.doorPartner)) then
				self.doorPartner:Fire("lock")
				self.doorPartner:Fire("close")
			end
		else
			self:EmitSound("npc/roller/remote_yes.wav")
			self.door:Fire("unlock")

			if (IsValid(self.doorPartner)) then
				self.doorPartner:Fire("unlock")
			end
		end
	end

	function ENT:DisplayError()
		self:EmitSound("npc/roller/mine/rmine_tossed1.wav")
		self:SetDisplayError(true)

		timer.Simple(1.2, function()
			if (IsValid(self)) then
				self:SetDisplayError(false)
			end
		end)
	end

	function ENT:Toggle(client)
		local Check = ( ( client:GetCharacter():GetInventory():HasItem(self.key) ) && ( client:Team() == FACTION_CITIZEN ) ) -- or ( client:Team() == FACTION_MPF ) ) -- if there is a rebel faction at a later date
		if (self.nextUseTime > CurTime()) then
			return
		end
		
		if ( !Check ) then
			self:DisplayError()
			self.nextUseTime = CurTime() + 2

			return
		end

		self:SetLocked(!self:GetLocked())
		self.nextUseTime = CurTime() + 2
		PLUGIN:SaveCombineLocks()
	end

	function ENT:Use(client)
		self:Toggle(client)
	end
else
	local glowMaterial = ix.util.GetMaterial("sprites/glow04_noz")
	local color_green = Color(0, 255, 0, 255)
	local color_locked = Color(255, 255, 0, 255)
	local color_red = Color(255, 50, 50, 255)

	function ENT:Draw()
		self:DrawModel()

		local color = color_green

		if (self:GetDisplayError()) then
			color = color_red
		elseif (self:GetLocked()) then
			color = self.lockedColor
		end

		local position = self:GetPos() + self:GetUp() * -8.7 + self:GetForward() * -3.4 + self:GetRight() * -7
		local dlight = DynamicLight(self:EntIndex())

		if (dlight) then
			dlight.pos = self:GetPos() + self:GetUp() * -8.7 + self:GetForward() * -3.4 + self:GetRight() * -7.5
			dlight.r = color.r
			dlight.g = color.g
			dlight.b = color.b
			dlight.brightness = ix.config.Get("LockBrightness", 0.5)
			dlight.Decay = 1000
			dlight.Size = ix.config.Get("LockRadius", 128)
			dlight.DieTime = CurTime() + 1
		end

		render.SetMaterial(glowMaterial)
		render.DrawSprite(position, 10, 10, color)
	end
end