ITEM.name = "GH-3 Antirad Capsules"
ITEM.model = Model("models/willardnetworks/skills/radx.mdl")
ITEM.description = "These advanced capsules are designed to protect individuals from harmful radiation exposure in harsh environments. When ingested, they release a unique blend of nanomaterials and antioxidants that bind to radioactive particles, reducing their impact on the body. They also contain radioprotective compounds that help repair radiation-induced damage at the cellular level. These capsules are a vital defense against the deadly effects of radiation in a world where radiation is a constant threat."
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
