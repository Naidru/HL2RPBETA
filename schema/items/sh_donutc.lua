ITEM.name = "Lemon Creme Donut"
ITEM.RestoreHunger = 32
ITEM.model = Model("models/willardnetworks/food/creamtreat.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A donut filled with lemon cream. All synthesized of course, but it's the thought that counts."
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