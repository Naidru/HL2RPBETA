
FACTION.name = "Biotic"
FACTION.description = "Brutally enslaved vortigaunts stripped of their power and from their vortal brethren, often subjected to cruel and vigorous tortures and exceedingly overworked. Often used as batteries and discarded like petals."
FACTION.color = Color(28, 148, 80, 255)
FACTION.weapons = {}
FACTION.isDefault = false
FACTION.models = {
	"models/vortigaunt_slave.mdl"
}
FACTION.isDefault = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_BIOTIC = FACTION.index