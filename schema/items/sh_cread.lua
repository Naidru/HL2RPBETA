ITEM.name = "Combine Bread"
ITEM.model = Model("models/bioshockinfinite/dread_loaf.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A loaf of bread using synthesized flour and other - usually unlisted - ingredients. It's better sliced."
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