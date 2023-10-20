ITEM.name = "Tz8111 Memory Replacement Tablets"
ITEM.model = Model("models/willardnetworks/skills/radxbos.mdl")
ITEM.description = "Removes and replaces the last few hours, or days of memories from a citizens' mind. The more tablets the more you erase. A certain upper limit will put them into a vegetative state, however."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 1, 0, MaxHP ) )
		return true
	end,
}
