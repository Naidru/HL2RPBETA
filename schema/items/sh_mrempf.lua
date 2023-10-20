ITEM.name = "MRE: CIVIL PROTECTION"
ITEM.model = Model("models/mres/consumables/zag_mre.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A black MRE package labeled 'CIVIL PROTECTION FUNCTIONARY SUPPLEMENTARY PACKET'. Contains enough emergency food supplements to last one Civil Protection Unit two to three days if rationed properly."
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