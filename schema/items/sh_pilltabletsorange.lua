ITEM.name = "MAc-93X Oxygenization Tablets"
ITEM.model = Model("models/willardnetworks/skills/pills7.mdl")
ITEM.skin = 0
ITEM.description = "A strange tablet often drank by CwU and the Administrator to seem impervious to the effects of the Air Exchange, the gas unable to effect them for up to 24 [IRL] hours."
ITEM.category = "Medical"
ITEM.price = 40

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