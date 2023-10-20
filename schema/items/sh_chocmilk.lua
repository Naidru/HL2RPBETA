ITEM.name = "Union 'Milk' Chocolate"
ITEM.model = Model("models/bioshockinfinite/hext_candy_chocolate.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bar of chocolate in a white wrapper, stamped with a blue Combine symbol. It's supposed to be an emulated milk chocolate, but isn't quite the same without the milk, it has a strange plastic-y fatty aftertaste."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 23

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}