ITEM.name = "Bread Half"
ITEM.RestoreHunger = 25
ITEM.model = Model("models/willardnetworks/food/bread_half.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Half a loaf of bread. Not as good as a full loaf, but it'll do."
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