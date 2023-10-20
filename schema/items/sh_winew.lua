ITEM.name = "Glass of White Wine"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/white_wine_glass.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A glass of white wine. Say some things about the Combine, but Loyalists get the best perks: A glass of wine with their dinner is just one of many."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 