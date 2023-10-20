ITEM.name = "Small Ration Pack"
ITEM.model = Model("models/willardnetworks/food/ration.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A relatively flat block of protein and supplements. It's pretty flavourless, but it provides nutrition. Some may be able to cook it with spices or flavouring to enhance the taste!"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}