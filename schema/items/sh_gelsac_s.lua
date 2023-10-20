ITEM.name = "Standard Gel Sac"
ITEM.model = Model("models/weapons/w_packatc.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple sack containing jellied protein. Bland, Tasteless, but suitable for Human consumption. With some extra effort, one might be able to put some flavour into this stuff."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 12

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}