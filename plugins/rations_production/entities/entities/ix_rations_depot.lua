AddCSLuaFile()
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Rations Depot"
ENT.Category = "Ration Production"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.bNoPersist = true

function ENT:PostEntityPaste(ply, ent, tab)
    ent:Remove()
end

function ENT:Initialize()
    if (CLIENT) then return end
    self:SetUseType(SIMPLE_USE)
    self:SetModel("models/props_wasteland/kitchen_fridge001a.mdl")
    self:SetMaterial("models/combine_turrets/ground_turret/ground_turret01")
    self:PhysicsInit(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if (phys and phys:IsValid()) then
        phys:Wake()
    end
end

function ENT:Use(ply)
    local stock = "ration"
    if (ix.RationsStock > 1) then stock = "rations" end
    ply:EmitSound("buttons/button24.wav")
    ply:Notify("The current stock stands at: " .. ix.RationsStock .. stock)
end

function ENT:Touch(ent)
    if (SERVER) then
        if (ent:GetClass() == "ix_ration" and ent:GetReady() and not ent.proccessed) then
            ent.proccessed = true
            ent:EmitSound("npc/scanner/cbot_discharge1.wav")
            Schema:AddRationStock(1)
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

    local pos = self:GetPos() + self:GetUp() * 74 + self:GetForward() * 24.2 + self:GetRight() * 17
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Up(), -90)
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), -180)

    cam.Start3D2D(pos, ang, 0.1)
    surface.SetDrawColor(15, 15, 15, 255)
    surface.DrawRect(0, 0, 400, 110)
    surface.SetMaterial(screentwo)
    surface.DrawTexturedRect(0, 0, 400, 110)
    cam.End3D2D()

    cam.Start3D2D(pos, ang, 0.2)
    local text = "Rations Depot"
    draw.SimpleText(text, "ixMachineInterfaceFontHuge", 16, 6, Color(200, 200, 0, 200))

    draw.SimpleText("'Use' to check stock", "ixMachineInterfaceFontHuge", 16, 28, Color(200, 200, 200, 200))

    cam.End3D2D()
end