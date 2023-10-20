ITEM.name = "AAc-3 Activated Charcoal Capsules"
ITEM.model = Model("models/willardnetworks/skills/pills8.mdl")
ITEM.skin = 0
ITEM.description = "These high-tech capsules contain activated carbon derived from advanced, bioengineered materials. When ingested, they quickly absorb and neutralize a wide range of toxins, poisons, and harmful substances. In addition to detoxification, these capsules have the unique ability to target and neutralize alien or unknown toxins commonly encountered in the Wasteland and beyond. They are a crucial tool for Outland explorers and settlers dealing with unfamiliar environments and potential hazards."
ITEM.category = "Medical"
ITEM.price = 8

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
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
}