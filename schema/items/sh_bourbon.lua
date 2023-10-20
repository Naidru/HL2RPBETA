ITEM.name = "Old Appalachia Premium Bourbon"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/bourbon.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bottle of Premium Bourbon made by the Old Appalachia Brewing Company. You won't find this often, but if you do: Hide it, tell nobody, and enjoy it. It may end up being one of the last few on Earth."
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