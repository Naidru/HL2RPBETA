
FACTION.name = "Civil Infestation Control"
FACTION.description = "Civil Infestation Control: Your city is at constant risk of destruction from Xenian infestation: Nobody is safe against it's spread unless YOU work hard to cleanse it. Mandatory volunteership may be imposed upon you by your local Civil Protection Functionary. Cooperation ensures a safer tomorrow, today."
FACTION.color = Color(255, 255, 0, 255)
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

FACTION_CIC = FACTION.index
