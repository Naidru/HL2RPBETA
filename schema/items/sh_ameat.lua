ITEM.name = "Cooked Alien Meat"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/cooked_alienmeat.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Editor note: This shit invokes feelings that I do not know how to explain when looking at it. It's disgusting cooked alien meat. Is it safe? Try it."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 