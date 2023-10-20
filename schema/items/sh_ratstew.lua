ITEM.name = "Ration: Meat and Veg"
ITEM.model = Model("models/willardnetworks/food/canned_food2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An opened ration can containing a simple stew of meat and vegetables. It's not half bad."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}