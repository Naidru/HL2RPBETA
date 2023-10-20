ITEM.name = "Xen Berry"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/berries02.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Strange, alien berries originating from Xen. These can be found in Xen infested zones, but are dangerous to acquire. Vortigaunts crave these as a snack."
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