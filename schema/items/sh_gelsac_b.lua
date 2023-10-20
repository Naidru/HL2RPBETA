ITEM.name = "Biotic Jelly Sack"
ITEM.model = Model("models/weapons/w_packatb.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple sack containing jellied protein. Bland, tasteless, and not suitable for humans. Vortigaunts however find it quite palatable."
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