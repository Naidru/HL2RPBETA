ITEM.name = "MRE: LOYALIST"
ITEM.model = Model("models/mres/consumables/pag_mre.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A red MRE package labeled 'LOYALIST TIER SUPPLEMENTS'. Contains enough emergency food supplements to last one Loyalist two to three days if rationed properly. Usually only seen in the hands of Loyalists and even Civil Protection."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 23

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(35)
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
}