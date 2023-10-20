ITEM.name ="Union Cola"
ITEM.model = Model("models/willardnetworks/food/breencan1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A red can with the symbol '>B' on it's surface, containing a cola soft drink."
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