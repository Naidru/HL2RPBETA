ITEM.name = "Sliced Bread"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/bread_slice.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Nothing's been better than sliced bread since the Combine showed up. But it's still made of the same old synthesized crap, so maybe not."
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