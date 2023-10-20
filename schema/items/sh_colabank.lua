ITEM.name = "Bank Soda - Zhongguo"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/bobdrinks_goodfella.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An old brand of cola that fluttered around New York in it's prime. It survived the Seven Hour War and the Combine, but it's a rare treat."
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