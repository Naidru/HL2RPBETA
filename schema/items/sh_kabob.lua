ITEM.name = "Headcrab Skewer"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/meatskewer.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Headcrab meat cooked and then stuck onto a skewer. Sold by street peddlers or made by Conscripts and Rebels when out in the field."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 22

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}