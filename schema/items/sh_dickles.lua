ITEM.name = "Combine Pickles"
ITEM.model = Model("models/bioshockinfinite/dickle_jar.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A jar of pickles! Who knows if they're real, but they sure taste the same."
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