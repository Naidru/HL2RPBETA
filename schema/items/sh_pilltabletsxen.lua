ITEM.name = "Xen Pill Tablets"
ITEM.model = Model("models/willardnetworks/skills/pills_xen.mdl")
ITEM.description = "Small Pill Tablets that glow under the dark. From what you understand they're dried and ground up 'Xen Water.' Whatever that means."
ITEM.category = "Medical"
ITEM.price = 75

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(150)
		client:SetHealth( math.Clamp( HP + 35, 0, MaxHP ) )
		return true
	end
}