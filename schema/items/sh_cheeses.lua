ITEM.name = "Synthesized Cheese Slice"
ITEM.RestoreHunger = 12
ITEM.model = Model("models/willardnetworks/food/cheesewheel1c.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A slice off of a larger wheel of synthesized cheese. Even though there tends to be plenty of this stuff to go around, it doesn't stop one from dreaming of the real thing now and then. Just looking at it makes you sad."
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