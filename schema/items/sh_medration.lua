ITEM.name = "Ration Box"
ITEM.model = Model("models/willardnetworks/food/ration_box.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A small ration box containing five smaller ration packs. Anyone can buy these with enough ration tokens. Still as bland as ever, though."
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