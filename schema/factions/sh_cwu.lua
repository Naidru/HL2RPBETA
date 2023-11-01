
FACTION.name = "Civil Worker's Union"
FACTION.description = "Civil Worker's Union: Show your dedication to the Union by joining the Workforce today!"
FACTION.color = Color(255, 197, 82, 255)
FACTION.models = {
    "models/willardnetworks/citizens/female_05.mdl",
	"models/willardnetworks/citizens/female_04.mdl",
	"models/willardnetworks/citizens/female_02.mdl",
	"models/willardnetworks/citizens/female_03.mdl",
	"models/willardnetworks/citizens/female_01.mdl",
	"models/willardnetworks/citizens/female_06.mdl",
	"models/willardnetworks/citizens/male_01.mdl",
	"models/willardnetworks/citizens/male_02.mdl",
	"models/willardnetworks/citizens/male_03.mdl",
	"models/willardnetworks/citizens/male_04.mdl",
	"models/willardnetworks/citizens/male_05.mdl",
	"models/willardnetworks/citizens/male_06.mdl",
	"models/willardnetworks/citizens/male_07.mdl",
	"models/willardnetworks/citizens/male_08.mdl",
	"models/willardnetworks/citizens/male_09.mdl",
	"models/willardnetworks/citizens/male_10.mdl",
	"models/earl_rp/citizens/player/female_01.mdl",
	"models/earl_rp/citizens/player/female_02.mdl",
	"models/earl_rp/citizens/player/female_04.mdl",
	"models/earl_rp/citizens/player/female_06.mdl",
	"models/earl_rp/citizens/player/female_19.mdl",
	"models/earl_rp/citizens/player/female_bms_1.mdl",
	"models/earl_rp/citizens/player/female_bms_2.mdl",
	"models/earl_rp/citizens/player/male_01.mdl",
	"models/earl_rp/citizens/player/male_02.mdl",
	"models/earl_rp/citizens/player/male_03.mdl",
	"models/earl_rp/citizens/player/male_04.mdl",
	"models/earl_rp/citizens/player/male_05.mdl",
	"models/earl_rp/citizens/player/male_06.mdl",
	"models/earl_rp/citizens/player/male_07.mdl",
	"models/earl_rp/citizens/player/male_08.mdl",
	"models/earl_rp/citizens/player/male_09.mdl",
	"models/barnes/refugee/female_70.mdl",
	"models/characters/gallaha.mdl",
	"models/humans/group01/drconnors.mdl",
	"models/humans/barnes/c8_admin.mdl",
	"models/humans/barnes/oshikawa.mdl",
	"models/humans/group03m/female_47.mdl",
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
FACTION.isDefault = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_CWU = FACTION.index
