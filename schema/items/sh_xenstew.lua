ITEM.name = "Vortigaunt Special"
ITEM.model = Model("models/willardnetworks/food/xen_stew.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A soup made from Xenian origins. The Vortigaunts love it! Humans and Combine? Much less so. It won't kill you, but God is it horrible unless you're a many-eyed telepathic alien!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 12

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.min( HP + 15, MaxHP ) )
		return true
	end
}