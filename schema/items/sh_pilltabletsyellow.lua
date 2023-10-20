ITEM.name = "CM-2 Nanite Pills"
ITEM.model = Model("models/willardnetworks/skills/pills3.mdl")
ITEM.skin = 0
ITEM.description = "These rare pills are not actually pills but small clusters, containing highly precise nanites which are often used to manage moderate to severe bodily injury. Safer than Medigel. Cancer Free Too!"
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