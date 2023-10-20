
ITEM.name = "Dried Cooking Herbs"
ITEM.model = Model("models/willardnetworks/food/cmb_food7.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = " Light green box labeled 'D.C.H - Dried Cooking Herbs'"
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