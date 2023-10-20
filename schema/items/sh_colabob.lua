ITEM.name = "Radiobob Cola"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/bobdrinks_can.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Cans from a mysterious sub-company called Radiobob. Ask and you won't find an answer. These cans somehow end up deposited into the cola machines, and not even the Union know who's doing it."
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