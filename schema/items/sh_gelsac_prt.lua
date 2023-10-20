ITEM.name = "Priority Gel Sac"
ITEM.model = Model("models/weapons/w_packatp.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple sack containing jellied protein. Usually bland and tasteless, but this bag is golden coloured for a reason. One can only imagine that the contents inside tastes like the purest honey, or the richest ambrosia."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 45

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}