ITEM.name = "H-Chips"
ITEM.model = Model("models/bioshockinfinite/bag_of_hhips.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bag of chips made from.. questionable sources. They taste good though, so nobody complains."
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