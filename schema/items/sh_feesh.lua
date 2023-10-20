ITEM.name = "Raw Fish"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/fishgolden.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Conscripts and Rebels usually only get their hands on fish - and rarely at that. Some spawning pools or small schools managed to survive the onslaught of the Combine, and make for a delicious meal when located."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}