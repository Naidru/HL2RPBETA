ITEM.name = "Civil Protection Supplements"
ITEM.model = Model("models/willardnetworks/food/cproids.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A caniseter labeled 'Unit Creatine', a powdered supplement for Civil Protection's water rations. Assists with focus, attention and duties. Warning: May lead to increased aggression."
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