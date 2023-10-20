
ITEM.name = "Enriched Beef Reserve"
ITEM.model = Model("models/willardnetworks/food/cmb_food4.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Tan, medium/large box labeled 'Enriched Beef Reserve', smells okay."
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