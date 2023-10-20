ITEM.name = "Cooked Leech"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/cooked_leech.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A cooked leech. It's not the best food around, but it's meat and that counts for something. Just don't think about it when you eat it."
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