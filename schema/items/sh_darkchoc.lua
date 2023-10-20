ITEM.name = "Union Chocolate Bar"
ITEM.model = Model("models/willardnetworks/props/unionchoco.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A compressed bar of chocolate substitute - though surprisingly similar to a real dark chocolate."
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