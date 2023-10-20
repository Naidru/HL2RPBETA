ITEM.name = "Civil Protection Gel Sac"
ITEM.model = Model("models/weapons/w_packatm.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple sack containing jellied protein. Usually bland and tasteless, but Civil Protection get performance enhancers and other substances that may or may not increase aggression upon consumption."
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