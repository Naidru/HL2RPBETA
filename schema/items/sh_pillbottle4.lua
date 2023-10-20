ITEM.name = "Antibiotics"
ITEM.model = Model("models/willardnetworks/skills/medjar3.mdl")
ITEM.description = "Antibiotics are medications that kill or inhibit the growth of bacteria. They are used to treat a wide range of bacterial infections, from urinary tract infections to skin infections."
ITEM.category = "Medical"
ITEM.price = 10

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP - 5, 0, MaxHP ) )
		return true
	end,
}
