
FACTION.name = "Vortigaunt Slave"
FACTION.description = "Brutally enslaved vortigaunts stripped of their power and from their vortal brethren, often subjected to cruel and vigorous tortures and exceedingly overworked. Often used as batteries and discarded like petals."
FACTION.color = Color(28, 148, 80, 255)
FACTION.models = {"models/willardnetworks/vortigaunt.mdl"}
FACTION.weapons = {"swep_vortigaunt_sweep"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:GetDefaultName(client)
	return "UU-BIOTIC." .. Schema:ZeroNumber(math.random(1, 99999), 3), true
end


function FACTION:OnTransfered(client)
	local character = client:GetCharacter()

	character:SetModel(self.models[1])
end


FACTION_VORT = FACTION.index
