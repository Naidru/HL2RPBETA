ITEM.name = "Ration: Mystery Meat"
ITEM.model = Model("models/willardnetworks/food/canned_food1.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An opened ration can containing... something. It's meat, but there's no telling what it came from. At least it's cooked?"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 12

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
		return true
	end,
}