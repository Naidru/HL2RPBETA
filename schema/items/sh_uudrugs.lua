ITEM.name = "CMU Euphoron Supplements"
ITEM.model = Model("models/willardnetworks/skills/daytripper.mdl")
ITEM.description = "A medium-large jar assorted with all manner of union approved drugs and goodies, including joints and other psychadelics and so on. No violent stuff or needles, as it should be."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 25, 0, MaxHP ) )
		return true
	end,
}
