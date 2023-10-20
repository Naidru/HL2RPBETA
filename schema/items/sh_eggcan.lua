ITEM.name = "Ration: Omelette"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/eggmix.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Cooked egg and vegetables turned into a canned omelette. It looks odd at first, but with the seasoning and vegetables added in, it's not so bad!"
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