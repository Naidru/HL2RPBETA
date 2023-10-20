ITEM.name = "Banana"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/bananna.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A synthesized banana. It tastes more like banana flavouring than anything."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 