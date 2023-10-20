ITEM.name = "Chunk of Meat"
ITEM.RestoreHunger = 23
ITEM.model = Model("models/willardnetworks/food/meat3.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A citizen on the train told you that all that was left of the wildlife after the Combine started harvesting the planet were stray cats and dogs, and the meat is what's left of them. A disgusting thought, but these are desperate times."
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