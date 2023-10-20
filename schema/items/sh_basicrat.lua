ITEM.name = "Standard Grade Ration"
ITEM.model = Model("models/foodnhouseholdaaaaa/combirationb.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A white and blue coloured ration pack with a Union stamp on it's surface, labeled with the words: 'STANDARD GRADE SUPPLEMENT PACKET'. Contains enough food supplements for one Citizen to last two days, or two Citizens to last one day."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}