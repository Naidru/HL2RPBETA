ITEM.name = "Spicy Curry Stew"
ITEM.model = Model("models/willardnetworks/food/stew1.mdl ")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "With some experimentation with rations, one can emulate a spicy curry stew! It's pretty delicious!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}