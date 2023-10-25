
FACTION.name = "Vortigaunt"
FACTION.description = "Wise but ultimately not very well understood aliens hailing from an unknown dimension before coming to Xen, and finally Earth. Powerful when freed. Very much not when enslaved."
FACTION.color = Color(28, 148, 104, 255)
FACTION.models = {"models/vortigaunt.mdl"}
FACTION.weapons = {"swep_vortigaunt_beam_edit", "swep_vortigaunt_heal"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()

	character:SetModel(self.models[1])
end

FACTION_FREEVORT = FACTION.index
