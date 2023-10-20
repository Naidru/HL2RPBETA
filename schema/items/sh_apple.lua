ITEM.name = "Apple"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/apple.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An apple. Possibly synthesized, but nobody can really tell the difference anymore."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 