ITEM.name ="Union Lemonade"
ITEM.model = Model("models/willardnetworks/food/breencan2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A yellow can with the symbol '>B' on it's surface, containing a lemonade substitute."
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