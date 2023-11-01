
FACTION.name = "Civil Worker's Director"
FACTION.description = "Civil Worker's Union Director: The strongest backs carry the workload! A hard-working society is a beneficial society, and you can reap the rewards! Register with your local authorities today!"
FACTION.color = Color(255, 228, 140, 255)
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

FACTION_CWUDIRECTOR = FACTION.index
