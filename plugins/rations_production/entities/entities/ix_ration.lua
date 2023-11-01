AddCSLuaFile()
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Ration"
ENT.Category = "Ration Production"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.bNoPersist = true

function ENT:PostEntityPaste(ply, ent, tab)
    ent:Remove()
end

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Painted")
    self:NetworkVar("Bool", 1, "Ready")
end

function ENT:Initialize()
    if (CLIENT) then return end
    self:SetModel("models/willardnetworks/rations/wn_new_ration.mdl")
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()

    if (phys and phys:IsValid()) then
        phys:Wake()
    end
end

if (CLIENT) then
    ENT.PopulateEntityInfo = true

    function ENT:OnPopulateEntityInfo(ration)

        local statusTitle = "Unpainted Ration"
        local statusDescription = "Take this ration to the painting machine"

        if (self:GetPainted()) then
            statusTitle = "Painted Ration"
            statusDescription = "Take this ration to the packing machine"
        elseif (self:GetReady()) then
            statusTitle = "Packaged Ration"
            statusDescription = "Take this ration to the rations depot, the machine will paint and sort it as needed."
        end
        
        local title = ration:AddRow("name")
        title:SetFont("ixSmallTitleFont")
        title:SetText(statusTitle)
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()
        
        local description = ration:AddRow("description")
        description:SetText(statusDescription)
        description:SizeToContents()
    end
    
end