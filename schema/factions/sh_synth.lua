FACTION.name = "Synth"
FACTION.description = "The Synths are biomechanical weapons created by the Combine, featuring diverse combat capabilities and posing a formidable challenge to the resistance."
FACTION.color = Color(140, 102, 98)
FACTION.models = {"models/icarus_anon.mdl"}
FACTION.weapons = {"weapon_vj_npccontroller"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true

function FACTION:GetDefaultName(client)
	return "CMB-SNT.NULL-" .. Schema:ZeroNumber(math.random(1, 99999), 5), true
end

function FACTION:OnTransferred(character)
	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	
	if (!Schema:IsCombineRank(oldValue, "SCN") and Schema:IsCombineRank(value, "SCN")) then
		character:JoinClass(CLASS_SCN)
    elseif (!Schema:IsCombineRank(oldValue, "SLK") and Schema:IsCombineRank(value, "SLK")) then
		character:JoinClass(CLASS_SLK)
        --character:SetModel("models/stalker.mdl")
    else
        character:JoinClass(CLASS_CRM)

	end
end

FACTION_SYNTH = FACTION.index
