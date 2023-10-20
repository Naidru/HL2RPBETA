
ITEM.name = "Tinned Leeches"
ITEM.model = Model("models/willardnetworks/food/cmb_food2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Awful smelling but surprisingly palletable leeches in some form of pickled brine."
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
