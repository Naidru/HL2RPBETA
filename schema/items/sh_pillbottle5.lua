ITEM.name = "Anti-Coagulant"
ITEM.model = Model("models/willardnetworks/skills/medjar4.mdl")
ITEM.description = "Anticoagulants like Warfarin help prevent the formation of blood clots, reducing the risk of conditions like deep vein thrombosis and stroke."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(150)
		client:SetHealth( math.Clamp( HP + 15, 0, MaxHP ) )
		return true
	end,
}
