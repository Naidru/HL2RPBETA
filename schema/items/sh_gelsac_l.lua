ITEM.name = "Loyalist Gel Sac"
ITEM.model = Model("models/weapons/w_packatl.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple sack containing jellied protein. Usually bland and tasteless, but Loyalists seem to get some flavouring in theirs!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 15

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}