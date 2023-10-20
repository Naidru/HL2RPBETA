ITEM.name = "Vegetable Ration Soup"
ITEM.model = Model("models/willardnetworks/food/vegetablesoup.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A plain soup made out of boiled vegetables from a ration package. It's almost flavourless, but definitely good for you (We hope)!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}