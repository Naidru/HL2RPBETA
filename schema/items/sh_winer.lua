ITEM.name = "Glass of Red Wine"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/wine_glass.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A glass of red wine. Say some things about the Combine, but Loyalists get the best perks: A glass of wine with their dinner is just one of many."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 