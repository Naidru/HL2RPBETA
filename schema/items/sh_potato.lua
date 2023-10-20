ITEM.name = "Potato"
ITEM.model = Model("models/bioshockinfinite/hext_potato.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A potato that's either synthesized or the only vegetable that was daring and tough enough to survive the Combine's destruction."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 12

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(12)
		client:SetHealth( math.Clamp( HP + 15, 0, MaxHP ) )
		return true
	end,
}