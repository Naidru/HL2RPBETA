ITEM.name = "Citalopram HX Mk.2"
ITEM.model = Model("models/willardnetworks/skills/pill_bottle.mdl")
ITEM.skin = 0
ITEM.description = "Forcefully upgraded tablets made to 'force' a citizens happiness by applying the usual anti-depressant mumbo jumbo, but now mixed with a healthy dose of subliminal mental imaging and neural relinking."
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
		client:SetHealth( math.Clamp( HP + 50, 0, MaxHP ) )
		return true
	end,
}