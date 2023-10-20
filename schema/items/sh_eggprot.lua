
ITEM.name = "UU Egg Protein"
ITEM.model = Model("models/willardnetworks/food/cmb_food1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "White box with faded pink lettering and stripe down the middle, labeled 'E.P.P - Egg Protein Package'."
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