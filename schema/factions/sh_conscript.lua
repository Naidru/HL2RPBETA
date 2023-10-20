
FACTION.name = "CCA Conscription Force"
FACTION.description = "Trained infantry. Usually the remains of the former Earth forces requisitioned and unwillingly reincorporated into the Combine units as low rank human Combine soldiers."
FACTION.color = Color(84, 83, 32, 255)
FACTION.pay = 25
FACTION.weapons = {"arccw_go_melee_knife", "rappel_gear"}
FACTION.isDefault = false
FACTION.models = {
	"models/willardnetworks/conscripts/male_01.mdl",
    "models/willardnetworks/conscripts/male_02.mdl",
    "models/willardnetworks/conscripts/male_03.mdl",
    "models/willardnetworks/conscripts/male_04.mdl",
    "models/willardnetworks/conscripts/male_05.mdl",
    "models/willardnetworks/conscripts/male_06.mdl",
    "models/willardnetworks/conscripts/male_07.mdl",
    "models/willardnetworks/conscripts/male_08.mdl",
    "models/willardnetworks/conscripts/male_09.mdl",
    "models/willardnetworks/conscripts/male_10.mdl",
    "models/willardnetworks/conscripts/female_01.mdl",
    "models/willardnetworks/conscripts/female_02.mdl",
    "models/willardnetworks/conscripts/female_03.mdl",
    "models/willardnetworks/conscripts/female_04.mdl",
    "models/willardnetworks/conscripts/female_05.mdl",
    "models/willardnetworks/conscripts/female_06.mdl"
}
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("cid", 1, {
		name = character:GetName(),
		id = id
	})
end

FACTION_CONSCRIPT = FACTION.index
