ITEM.name = "Ration: Meat Stew"
ITEM.model = Model("models/willardnetworks/food/canned_food3.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An opened ration can containing a simple but hearty meat stew. It's perfect!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}