
FACTION.name = "Civil Medical Union"
FACTION.description = "Civil Medical Union: If you cannot give a life, you can save a life! Your hands are needed, and idle hands are the devil's work! Register with a local authority figure today!"
FACTION.color = Color(204, 65, 149, 255)
FACTION.models = {
	"models/barnes/refugee/female_70.mdl
models/characters/gallaha.mdl
models/humans/group01/drconnors.mdl
models/humans/barnes/c8_admin.mdl
models/humans/barnes/oshikawa.mdl
}
FACTION.isDefault = true

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_CMU = FACTION.index
