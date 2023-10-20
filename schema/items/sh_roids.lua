ITEM.name = "Caffeine Booster Supplements"
ITEM.model = Model("models/willardnetworks/skills/buffout.mdl")
ITEM.description = "A favourite of the CWU, Caffeine tablets put into pocket sized bottles for convenience, they often smell quite nice and taste pleasant."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 8, 0, MaxHP ) )
		return true
	end,
}
