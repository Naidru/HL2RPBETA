ITEM.name = "Cooked Chunk of Meat"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/meat4.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Try not to dwell on it."
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