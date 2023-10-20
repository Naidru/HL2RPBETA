
ITEM.name = "Melon"
ITEM.model = Model("models/props_junk/watermelon01.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A green fruit, it has a hard outer shell."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 75

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}