ITEM.name = "Ration: Last Resort"
ITEM.model = Model("models/willardnetworks/food/canned_food4.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A ration plate with slimy, squishy chunks placed on top. It looks horrid and vomit-inducing, but in an emergency it will get one fed."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}