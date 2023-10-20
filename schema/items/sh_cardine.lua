ITEM.name = "Can of Cardines"
ITEM.model = Model("models/bioshockinfinite/cardine_can_open.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A can of what appear to just be sardines. They call them 'Cardines' because the Combine HAS to be synthesizing them, a big portion of our oceans dried up years ago... They look and taste like real sardines, but they've got to be fake, right?"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 35

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}