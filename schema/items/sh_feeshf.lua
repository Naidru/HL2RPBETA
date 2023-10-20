ITEM.name = "Cooked Fish"
ITEM.RestoreHunger = 25
ITEM.model = Model("models/willardnetworks/food/fishsteak.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Conscripts and Rebels usually only get their hands on fish - and rarely at that. Some spawning pools or small schools managed to survive the onslaught of the Combine, and make for a delicious meal when located. This is the result of a chef's handiwork, and tastes amazing to boot!"
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