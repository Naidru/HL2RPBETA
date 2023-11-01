
FACTION.name = "Civil Medical Director"
FACTION.description = "Civil Medical Union: If you cannot give a life, you can save a life! Your hands are needed, and idle hands are the devil's work!"
FACTION.color = Color(154, 21, 191, 255)
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
	"models/humans/group03m/female_47.mdl"
}
FACTION.isDefault = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_CMUDIRECTOR = FACTION.index
