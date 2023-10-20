ITEM.name = "Steak Skewer"
ITEM.RestoreHunger = 32
ITEM.model = Model("models/willardnetworks/food/meatskewer2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Synthesized steak cooked and then stuck onto a skewer. Sold by street peddlers or made by Conscripts and Rebels when out in the field."
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