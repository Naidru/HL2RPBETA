ITEM.name = "Overwatch Grade Adrenaline Stimboost"
ITEM.model = Model("models/willardnetworks/skills/pyscho.mdl")
ITEM.description = "A medical injector with the parts from a Combine Soldier's internal medical augments tied to it. It's hard to tell if this was Union doing or Resistance."
ITEM.category = "Medical"
ITEM.price = 120

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 120, 0, MaxHP ) )
		return true
	end,
}
