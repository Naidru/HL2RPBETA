ITEM.name = "Trauma Kit"
ITEM.model = Model("models/willardnetworks/skills/medkit.mdl")
ITEM.skin = 0
ITEM.description = "A highly advanced and authoritarian medical kit designed for Combine medical teams. It includes tools like a Combine Med-Injector, a Biometric Scanner, a Laser Surgical Tool, Hemostatic Foam, and a Bio-Evaluation Module and three Cooling Mediweave Bandages, embodying the Combine's efficient and standardized approach to medical response in their world."
ITEM.category = "Medical"
ITEM.price = 100

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
		client:SetHealth( math.Clamp( HP + 200, 0, MaxHP ) )
		return true
	end,
}