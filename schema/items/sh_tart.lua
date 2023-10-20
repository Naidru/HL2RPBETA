ITEM.name = "Strawberry Lemon Tart"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/cake.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A strawberry lemon tart made entirely of synthesized materials. While it may not taste as amazing as the real thing, at least the presentation is on point."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 