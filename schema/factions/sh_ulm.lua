FACTION.name = "Union Loyalist Militia"
FACTION.description = "Union Loyalist Militia: Protection for the people, by the people. Defend yourself and your community today!"
FACTION.color = Color(67, 54, 77 255)
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
"models/pms/males/male_01.mdl",
"models/pms/males/male_02.mdl",
"models/pms/males/male_03.mdl",
"models/pms/males/male_04.mdl",
"models/pms/males/male_05.mdl",
"models/pms/males/male_06.mdl",
"models/pms/males/male_07.mdl",
"models/pms/males/male_08.mdl",
"models/pms/males/male_09.mdl",
"models/pms/males/male_10.mdl",
"models/pms/males/male_11.mdl",
"models/pms/masks/male_gasmask.mdl",
"models/pms/masks/male_helmet.mdl",
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
"models/earl_rp/citizens/player/male_09.mdl"
}
FACTION.isDefault = false

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_CITIZEN = FACTION.index
