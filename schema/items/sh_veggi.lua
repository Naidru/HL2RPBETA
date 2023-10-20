ITEM.name = "Mixed Vegetable Package"
ITEM.model = Model("models/willardnetworks/foods/vege.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A box with the label 'Variety Dried Vegetables', which includes a list of many (hopefully) healthy vegetables to choose from!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}