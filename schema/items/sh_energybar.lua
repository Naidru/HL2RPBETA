
ITEM.name = "Granulated Sweet Bar"
ITEM.model = Model("models/willardnetworks/food/cmb_food3.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "White packaged 'Granulated Sweet Bar' packaged by the union for sale."
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