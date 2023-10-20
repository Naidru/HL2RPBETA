ITEM.name = "NaCl Tablets"
ITEM.model = Model("models/willardnetworks/skills/pills1.mdl")
ITEM.skin = 0
ITEM.description = "NaCl Tablets are an essential and safe medical item that serves various medical and therapeutic purposes, particularly in maintaining fluid and electrolyte balance in the body."
ITEM.category = "Medical"
ITEM.price = 35

ITEM.width = 1
ITEM.height = 1
ITEM.useTime = 2
--ITEM.useSound = "LiteNetwork/hl2rp/eat.ogg"

ITEM.functions.Take = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(15)
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
		return true
	end,
}