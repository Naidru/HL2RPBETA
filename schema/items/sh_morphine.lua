ITEM.name = "CMU Medilite Syringe"
ITEM.model = Model("models/willardnetworks/skills/medx.mdl")
ITEM.skin = 0
ITEM.description = "This specialized compound combines traditional morphine with advanced nanotechnology. Administered through a compact injector, it provides rapid and precise pain relief and stabilizes vital signs in cases of severe injury or trauma. The nanobots in the compound ensure controlled delivery, minimizing the risk of addiction and side effects. It's an indispensable tool for medical personnel in high-risk environments and during waste exploration."
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
		client:SetHealth( math.Clamp( HP + 30, 0, MaxHP ) )
		return true
	end,
}