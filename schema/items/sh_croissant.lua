ITEM.name = "Croissant"
ITEM.RestoreHunger = 34
ITEM.model = Model("models/willardnetworks/food/croissant.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Out of everything the Combine chose to keep, of course it was French."
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