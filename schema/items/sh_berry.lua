ITEM.name = "Berry"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/berries01.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Synthesized berries made by the Union. They taste like fruit flavouring from old candy."
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