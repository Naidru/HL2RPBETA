AddCSLuaFile()
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Token Machine"
ENT.Category = "Ration Production"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.bNoPersist = true

function ENT:PostEntityPaste(ply, ent, tab)
    ent:Remove()
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 1, "ProductionStart")
    self:NetworkVar("Int", 2, "ProductionEnd")
    self:NetworkVar("Int", 3, "SoundLoop")
end

function ENT:Initialize()
    if (CLIENT) then return end
    self:SetUseType(SIMPLE_USE)
    self:SetModel("models/props_wasteland/controlroom_monitor001a.mdl")
    self:SetMaterial("models/combine_dropship/combine_dropship01")
    self:PhysicsInit(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if (phys and phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Think()
    if (CLIENT) then return end

    if (self:GetProductionEnd() > 0 and CurTime() >= self:GetProductionEnd()) then
        self:StopLoopingSound(self:GetSoundLoop())

       
        local entityPosition = self:GetPos()
        local endPosition = entityPosition + (self:GetUp() * 128) + (self:GetForward() * 24)

        local traceLine = util.TraceLine({
            endpos = endPosition,
            filter = self,
            start = entityPosition,
            mask = MASK_NPCWORLDSTATIC
        })
    
        local dropPos = self:GetPos() + self:GetUp() * 24 + self:GetForward() * 13 + self:GetRight() * 0

        local effectData = EffectData()
            effectData:SetOrigin(dropPos)
            effectData:SetScale(2)
            util.Effect("StunstickImpact", effectData)

        ix.item.Spawn("ration_plastic", dropPos)

        self:EmitSound("buttons/lever6.wav", 75, math.random(80, 90))   

        self:SetProductionStart(0)
        self:SetProductionEnd(0)
    end
end

function ENT:Touch(ent)
    if (SERVER) then
        if (ent:GetClass() == "ix_item" and ent:GetItemID() == "ration_token" and self:GetProductionEnd() == 0 and not ent.proccessed) then
            ent.proccessed = true
            ent:EmitSound("npc/barnacle/barnacle_gulp" .. math.random(1, 2) .. ".wav")
            self:SetProductionStart(CurTime())
            self:SetProductionEnd(CurTime() + ix.config.Get("plasticProduceTime"))
            self:SetSoundLoop(self:StartLoopingSound("ambient/machines/machine_whine1.wav"))
            local effectData = EffectData()
                effectData:SetOrigin(self:GetPos())
                effectData:SetScale(2)
            util.Effect("StunstickImpact", effectData)
            ent:Remove()
        end
    end
end

local screen = Material("effects/tvscreen_noise001a")
local screentwo = Material("effects/combine_binocoverlay")

function ENT:Draw()
    self:DrawModel()

    local pos = self:GetPos() + self:GetUp() * 1 + self:GetForward() * 17.3 + self:GetRight() * 10
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Up(), -90)
    ang:RotateAroundAxis(ang:Forward(), 78)
    ang:RotateAroundAxis(ang:Right(), -180)

    cam.Start3D2D(pos, ang, 0.1)
    surface.SetDrawColor(15, 15, 15, 255)
    surface.DrawRect(0, 0, 210, 150)
    surface.SetMaterial(screen)
    surface.DrawTexturedRect(0, 0, 210, 150)
    surface.SetMaterial(screentwo)
    surface.DrawTexturedRect(0, 0, 210, 150)
    cam.End3D2D()

    cam.Start3D2D(pos, ang, 0.2)
    local text = "Insert Token"
    local tcol = Color(200, 200, 200, 200)
    local twpos = 17

    if (self:GetProductionEnd() > 0) then
        text = "Producing Plastic"
        tcol = Color(180, 180, 0, 200)
        twpos = 9
    end

    draw.SimpleText(text, "ixMachineInterfaceFontBig", twpos, 25, tcol)

    cam.End3D2D()
end