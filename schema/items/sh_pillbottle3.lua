ITEM.name = "Aspirin"
ITEM.model = Model("models/willardnetworks/skills/medjar2.mdl")
ITEM.description = "Aspirin is a pain reliever, anti-inflammatory, and blood thinner. It's used to relieve pain and reduce inflammation and can also help prevent blood clots, making it valuable for individuals at risk of heart disease."
ITEM.category = "Medical"
ITEM.price = 20

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(150)
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
		return true
	end,
}
