ITEM.name = "CM-3 Neurolization Tablets"
ITEM.model = Model("models/willardnetworks/skills/pills6.mdl")
ITEM.skin = 0
ITEM.description = "These rare pills can jumpstart brain activity in the dead when injested mere moments after death. Rarely used, but powerful and often used by interrogative forces for purposes sinister."
ITEM.category = "Medical"
ITEM.price = 85

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
		client:SetHealth( math.Clamp( HP + 50, 0, MaxHP ) )
		return true
	end,
}