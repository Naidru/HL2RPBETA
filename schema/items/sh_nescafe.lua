ITEM.name = "Nescafe Coffee"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/coffee_nescafe.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "This shit is awful, do NOT drink this, even in an emergency scenario. It is more AWFUL than the synthesized coffee the Union puts out, and that's saying something!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP - 10, 1, MaxHP ) )
		return true
	end,
} 