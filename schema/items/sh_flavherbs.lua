
ITEM.name = "Union Branded Coffee"
ITEM.model = Model("models/willardnetworks/food/coffee.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A Coffee cup with an interesting brand image promoting the Combine. Comes with the recipient's CID tag written on the side. The Coffee substitute isn't very good, however."
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