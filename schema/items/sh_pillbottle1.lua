ITEM.name = "Paracetamol"
ITEM.model = Model("models/willardnetworks/skills/medjar.mdl")
ITEM.description = "Paracetamol, also known as Acetaminophen, is a widely-used over-the-counter medication. It's an analgesic (pain reliever) and antipyretic (fever reducer) that helps alleviate pain and reduce fever. It's commonly used for headaches, muscle aches, and mild to moderate pain."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(25)
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
}
