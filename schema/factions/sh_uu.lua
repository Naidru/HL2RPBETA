
FACTION.name = "Universal Union Official"
FACTION.description = "Universal Union Representatives: Directly Represent the Union's interests and demands to better the Human race, and bring Unity to Earth. Your failures will mark our race's end. Do not dissapoint."
FACTION.color = Color(94, 226, 255, 255)
FACTION.models = {
	"models/industrial_uniforms/industrial_uniform2.mdl",
	"models/industrial_uniforms/industrial_uniform.mdl",
	"models/hlvr/characters/worker/npc/worker_citizen.mdl",
	"models/hlvr/characters/hazmat_worker/npc/hazmat_worker_citizen.mdl",
	"models/hazcit_npc.mdl",
	"models/snood_17/male_04.mdl",
	"models/humans/gasmask/gascit.mdl",
	"models/humans/gasmask/gasmask_civi_01.mdl",
    "models/humans/airex/airex_male.mdl",
    "models/humans/airex/airex_female.mdl"
}
FACTION.isDefault = true

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_UU = FACTION.index
