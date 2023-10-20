ITEM.name = "Hex Apple"
ITEM.model = Model("models/bioshockinfinite/hext_apple.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A not-so-round apple, likely made using synthesized plant matter. Looks like something out of an old video game."
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