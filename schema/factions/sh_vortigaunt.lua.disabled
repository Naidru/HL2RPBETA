
FACTION.name = "Vortigaunt"
FACTION.description = "Wise but ultimately not very well understood aliens hailing from an unknown dimension before coming to Xen, and finally Earth. Powerful when freed. Very much not when enslaved."
FACTION.color = Color(28, 148, 104, 255)
FACTION.weapons = {"swep_vortigaunt_beam"}
FACTION.isDefault = false
FACTION.models = {
	"models/vortigaunt.mdl"
}
FACTION.isDefault = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_VORT = FACTION.index