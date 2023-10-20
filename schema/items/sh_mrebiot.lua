ITEM.name = "MRE: BIOTIC"
ITEM.model = Model("models/mres/consumables/lag_mre.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A green MRE package labeled 'BIOTIC TIER SUPPLEMENTS'. Contains enough emergency food supplements to last one Vortigaunt two to three days if rationed properly. Usually seen in the hands of Vortigaunt slaves."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
		return true
	end
}