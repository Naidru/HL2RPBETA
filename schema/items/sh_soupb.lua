ITEM.name = "Beef Stew"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/meatysoup2.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A hearty stew made from synthesized meat. Makes for a warm home cooked meal."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 