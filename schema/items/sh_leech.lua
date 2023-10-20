ITEM.name = "Leech"
ITEM.RestoreHunger = 5
ITEM.model = Model("models/willardnetworks/food/leech.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A disgusting, raw, and wriggling leech. Cooked, it's edible, but on it's own? You'd have to be tough to scarf this thing down raw and not immediately puke it up afterwards."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
	end
}