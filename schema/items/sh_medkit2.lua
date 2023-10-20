ITEM.name = "Surgical Kit"
ITEM.model = Model("models/willardnetworks/skills/surgicalkit.mdl")
ITEM.skin = 0
ITEM.description = "This kit features a blend of traditional surgical tools and repurposed Combine technology. It includes a modified laser cutter, ration pack hemostatic sponges, hybrid sutures, and a medic's manual."
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
		client:SetHealth( math.Clamp( HP + 100, 0, MaxHP ) )
		return true
	end,
}