ITEM.name = "Bread Dough"
ITEM.RestoreHunger = 25
ITEM.model = Model("models/willardnetworks/food/dough.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An uncooked loaf of bread dough, made entirely from synthesized ingredients. Fun to bake, horrid to eat."
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