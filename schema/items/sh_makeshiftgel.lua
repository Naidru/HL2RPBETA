ITEM.name = "Makeshift Medigel Injector"
ITEM.model = Model("models/willardnetworks/skills/hpsyringe.mdl")
ITEM.skin = 0
ITEM.description = "Horribly dangerous and scuffed Resistance medigel made from raw antlion grub, it can sometimes prove lethal but they keep using it anyway."
ITEM.category = "Medical"
ITEM.price = 15

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
		client:SetHealth( math.Clamp( HP + 22, 0, MaxHP ) )
		return true
	end,
}