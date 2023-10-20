ITEM.name = "Sesame Seed Bagel"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/bagel2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A bagel made from flour substitute. It's more like eating something made from cardboard, but the sesame seeds help."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 