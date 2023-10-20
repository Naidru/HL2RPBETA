ITEM.name = "Union Gin"
ITEM.model = Model("models/bioshockinfinite/jin_bottle.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bottle of gin made from synthesized alcohol. Some say Wayne King made this one too, but the Combine have plastered their logo all over it. Usually reserved for Loyalists and Civil Protection."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 50

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}