ITEM.name = "MRE: CITIZEN"
ITEM.model = Model("models/mres/consumables/tag_mre.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A yellow MRE package labeled 'CITIZEN TIER SUPPLEMENTS'. Contains enough emergency food supplements to last one Citizen two to three days if rationed properly."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 23

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
}