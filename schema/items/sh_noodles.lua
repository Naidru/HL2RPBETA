ITEM.name = "Noodle Bowl"
ITEM.RestoreHunger = 35
ITEM.model = Model("models/willardnetworks/food/noodles.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bowl of simple, but tasty noodles. Made with synthesized materials, but all by hand. The effort behind it's creation adds something."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
} 