ITEM.name = "Blood Transfusion Bag"
ITEM.model = Model("models/willardnetworks/skills/bloodbag.mdl")
ITEM.description = "A bag labeled 'GLOBAL COMPATIBILITY HEMOGENICS SATCHEL'.. which is designed for the safe and efficient transfer of blood and other vital fluids in advanced medical emergencies. "
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 25, 0, MaxHP ) )
		return true
	end,
}
