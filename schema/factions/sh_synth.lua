FACTION.name = "Synth"
FACTION.description = "A transhuman Overwatch soldier produced by the Combine."
FACTION.color = Color(140, 102, 98)
FACTION.isDefault = false
FACTION.isGloballyRecognized = true

function FACTION:GetDefaultName(client)
	return "CMB-SNT.CRM-" .. Schema:ZeroNumber(math.random(1, 99999), 5), true
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