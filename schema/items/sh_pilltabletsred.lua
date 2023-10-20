ITEM.name = "P-49 Pazorantine Pills"
ITEM.model = Model("models/willardnetworks/skills/pills4.mdl")
ITEM.skin = 0
ITEM.description = "These rare, unseen pills are powerful nanite boosters used in emergency situations, there is only a handful of them ever supplied to a city and they are usually for CWU, the Administrator, or Military."
ITEM.category = "Medical"
ITEM.price = 280

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