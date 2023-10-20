ITEM.name = "Union Lager"
ITEM.model = Model("models/bioshockinfinite/hext_bottle_lager.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bottle of lager made from synthesized alcohol. The Combine have this as part of their Loyalist and Civil Protection Rations only because of the flavour difference compared to the normal garbage."
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