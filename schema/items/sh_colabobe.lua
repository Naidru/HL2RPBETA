ITEM.name = "Radio Bob Energy"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/bobdrinks_premium.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An off-shoot of the strange Radio Bob drinks that keep appearing around the city. It claims it's an energy drink, but the Union say it's an illegal substance."
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