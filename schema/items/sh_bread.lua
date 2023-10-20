ITEM.name = "Bread"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/bread_loaf.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "You've got to get that bread, even if it's now made of synthesized flour substitute."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 23

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}