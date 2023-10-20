ITEM.name = "Union 'Sparkling' Water"
ITEM.model = Model("models/props_lunk/popcan01a.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A blue can with a Union stamp on it's surface, containing carbonated water. It's alright, if a bit bland or bitter."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}