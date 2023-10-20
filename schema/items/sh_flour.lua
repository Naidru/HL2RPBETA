
ITEM.name = "Saturated Flour"
ITEM.model = Model("models/willardnetworks/food/cmb_food6.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Tan bag labeled 'Saturated Flour', looks grainy and cream-colored."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 12

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}