
FACTION.name = "Universal Union Official"
FACTION.description = "Universal Union Representatives: Directly Represent the Union's interests and demands to better the Human race, and bring Unity to Earth. Your failures will mark our race's end. Do not disappoint."
FACTION.color = Color(94, 226, 255, 255)
FACTION.models = {
	"models/humans/combine/female_01.mdl",
	"models/humans/combine/female_02.mdl",
	"models/humans/combine/female_03.mdl",
	"models/humans/combine/female_04.mdl",
	"models/humans/combine/female_06.mdl",
	"models/humans/combine/female_07.mdl",
	"models/humans/combine/female_ga.mdl",
	"models/humans/combine/male_01.mdl",
	"models/humans/combine/male_02.mdl",
	"models/humans/combine/male_03.mdl",
	"models/humans/combine/male_04.mdl",
	"models/humans/combine/male_05.mdl",
	"models/humans/combine/male_06.mdl",
	"models/humans/combine/male_07.mdl",
	"models/humans/combine/male_08.mdl",
	"models/humans/combine/male_09.mdl"
}
FACTION.isDefault = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_UU = FACTION.index
