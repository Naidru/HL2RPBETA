ITEM.name = "Ibuprofen"
ITEM.model = Model("models/willardnetworks/skills/medjar1.mdl")
ITEM.description = "Ibuprofen is a nonsteroidal anti-inflammatory drug (NSAID) that helps relieve pain, reduce inflammation, and lower fever. It's effective for a range of conditions, including headaches, arthritis, and menstrual cramps."
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
