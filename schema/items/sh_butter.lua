
ITEM.name = "UU Approved Margarine"
ITEM.model = Model("models/willardnetworks/food/cmb_food5.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Grey tin labeled 'Quality Margarine'.. Yeah right."
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
