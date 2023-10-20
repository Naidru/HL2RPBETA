AddCSLuaFile()
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Wrapper Machine"
ENT.Category = "Ration Production"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.bNoPersist = true

function ENT:PostEntityPaste(ply, ent, tab)
    ent:Remove()
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "Wear")
    self:NetworkVar("Int", 1, "ProductionStart")
    self:NetworkVar("Int", 2, "ProductionEnd")
    self:NetworkVar("Int", 3, "SoundLoop")
end

function ENT:Initialize()
    if (CLIENT) then return end
    self:SetUseType(SIMPLE_USE)
    self:SetModel("models/props_lab/powerbox01a.mdl")
    self:SetMaterial("models/combine_dropship/combine_dropship01")
    self:PhysicsInit(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()

    if (phys and phys:IsValid()) then
        phys:Wake()
    end

    self:SetWear(0)
end

function ENT:Use(ply)
    local inv = ply:GetCharacter():GetInventory()
    local repairSnds = {"npc/dog/dog_servo2.wav", "npc/dog/dog_servo6.wav", "npc/dog/dog_servo12.wav"}
    local repairSnd = table.Random(repairSnds)
    if (inv:HasItem("toolbox")) then
        if (self:GetWear() > 0) then
            if (not self.NextRepair) then
                self.NextRepair = CurTime()
            end

            if (CurTime() < self.NextRepair) then return end

            self.NextRepair = CurTime() + 1.2

            self:SetWear(math.Max(0, self:GetWear() - math.random(8.3,13.8)))
            ply:EmitSound(repairSnd, 75, math.random(80, 110))
        end
    end
end

function ENT:Think()
    if (CLIENT) then return end

    if (self:GetProductionEnd() > 0 and CurTime() >= self:GetProductionEnd()) then
        self:StopLoopingSound(self:GetSoundLoop())

        self:SetWear(math.min(100, self:GetWear() + math.random(8.3,13.8)))

        local entityPosition = self:GetPos()
        local endPosition = entityPosition + (self:GetUp() * 128) + (self:GetForward() * 24)

        local traceLine = util.TraceLine({
            endpos = endPosition,
            filter = self,
            start = entityPosition,
            mask = MASK_NPCWORLDSTATIC
        })
    
        local dropPos = self:GetPos() + self:GetUp() * 25 + self:GetForward() * 35 + self:GetRight() * 0

        local effectData = EffectData()
            effectData:SetOrigin(dropPos)
            effectData:SetScale(2)
            util.Effect("StunstickImpact", effectData)
          

        local ration = ents.Create("ix_ration")
        ration:SetPos(dropPos)
        ration:SetMaterial("models/debug/debugwhite")
        ration:Spawn()

        self:EmitSound("buttons/lever6.wav", 75, math.random(80, 90))   

        self:SetProductionStart(0)
        self:SetProductionEnd(0)
    end
end

function ENT:Touch(ent)
    if (SERVER) then
        if (ent:GetClass() == "ix_item" and ent:GetItemID() == "ration_plastic" and self:GetWear() < 100 and self:GetProductionEnd() == 0 and not ent.proccessed) then
            ent.proccessed = true
            ent:EmitSound("npc/scanner/cbot_discharge1.wav")
            self:SetProductionStart(CurTime())
            self:SetProductionEnd(CurTime() + ix.config.Get("wrapperProduceTime"))
            self:SetSoundLoop(self:StartLoopingSound("npc/manhack/mh_engine_loop1.wav"))
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

    local pos = self:GetPos() + self:GetUp() * 14 + self:GetForward() * 12.8 + self:GetRight() * 8.5
    local ang = self:GetAngles()
    ang:RotateAroundAxis(ang:Up(), -90)
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), -180)

    cam.Start3D2D(pos, ang, 0.1)
    surface.SetDrawColor(15, 15, 15, 255)
    surface.DrawRect(0, 0, 159, 70)
    surface.SetMaterial(screen)
    surface.DrawTexturedRect(0, 0, 159, 70)
    surface.SetMaterial(screentwo)
    surface.DrawTexturedRect(0, 0, 159, 70)
    cam.End3D2D()

    cam.Start3D2D(pos, ang, 0.2)
    local text = "Wrapping Machine"
    local tW, tH = surface.GetTextSize(text)
    draw.SimpleText(text, "ixMachineInterfaceFontSmall", 11, 0, Color(200, 200, 200, 255))

    local text = "Wear " .. self:GetWear() .. "%"
    local tcol = Color(200, 200, 200, 255)

    if (self:GetProductionEnd() > 0) then
        text = "Wrapping Ration"
        tcol = Color(150, 150, 0, 255)
    end

    draw.SimpleText(text, "ixMachineInterfaceFontSmall", 11, 10, tcol)

    local text = "Optimal"
    local tcol = Color(255, 128, 0, 255)

    if (self:GetWear() >= 75) then
        text = "Repair Needed"
        tcol = Color(150, 0, 0, 255)
    end

    draw.SimpleText(text, "ixMachineInterfaceFontSmall", 11, 21, tcol)

    cam.End3D2D()
end

if (CLIENT) then
    ENT.PopulateEntityInfo = true
    function ENT:OnPopulateEntityInfo(broke)
        if (self:GetWear() >= 75) then 
            local title = broke:AddRow("name")
            title:SetFont("ixSmallTitleFont")
            title:SetText("This machine requires repair")
            title:SetBackgroundColor(Color(200, 0, 0, 200))
            title:SizeToContents()
        
            local description = broke:AddRow("description")
            description:SetText("If you have a toolbox in your inventory, Hit 'Use' while looking at the machine to fix it.")
            description:SizeToContents()
        end
    end 
end