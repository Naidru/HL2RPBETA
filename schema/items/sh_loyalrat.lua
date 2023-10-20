ITEM.name = "Loyalist Ration pack"
ITEM.model = Model("models/foodnhouseholdaaaaa/combirationc.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A red ration pack with a Union stamp on it's surface, labeled 'LOYALIST GRADE SUPPLEMENT PACKAGE'. Contains enough food supplements to last one Loyalist two days, or two Loyalists one day. As per it's name, usually only in the possession of Loyalist Citizens or even Civil Protection, and contains a better quality of food."
ITEM.category = "Consumables"
ITEM.permit = "consumables"
ITEM.RestoreHunger = 23

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}