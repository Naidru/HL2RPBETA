ITEM.name = "Meaty Soup"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/meatysoup.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A hearty soup made from fresh and synthesized materials. Makes for a great home cooked meal."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 