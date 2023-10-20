ITEM.name = "Union Cereal"
ITEM.model = Model("models/bioshockinfinite/hext_cereal_box_cornflakes.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.RestoreHunger = 54
ITEM.description = "A black box with the words 'Bran Flakes Cereal Substitute'. It's a very simple cereal that can be passable for breakfast or a midday snack, if you like it dry."
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