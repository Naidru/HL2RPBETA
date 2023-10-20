ITEM.name = "HG-1 Pyronalkine Calcinum"
ITEM.model = Model("models/willardnetworks/skills/pills5.mdl")
ITEM.skin = 0
ITEM.description = "This advanced tablet is specifically designed to counteract the effects of nerve agents used in futuristic warfare or conflicts. When administered, it rapidly neutralizes the toxic effects of nerve agents, stabilizes the victim's nervous system, and restores normal bodily function, ensuring quick and precise treatment in emergency situations. It's a vital tool for military personnel and first responders in a world where nerve agents pose a significant threat."
ITEM.category = "Medical"
ITEM.price = 25

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