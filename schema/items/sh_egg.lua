ITEM.name = "Egg"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/egg1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An egg. It cracks like a real egg, has yolk and whites, but nobody can tell if it's synthesized or not."
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