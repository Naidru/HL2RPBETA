ITEM.name = "Bulk Ration"
ITEM.model = Model("models/willardnetworks/rations/wn_new_ration.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A larger version of the standard handout ration usually bought with extra ration tokens, with a resealable cap for storage."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 30

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}