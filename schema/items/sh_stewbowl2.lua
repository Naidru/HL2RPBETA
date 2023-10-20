ITEM.name = "Ration-Meat Soup"
ITEM.model = Model("models/willardnetworks/food/whitesoup.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple soup with a light broth made from experimenting with rations, containing a meaty bone in the center. Where did the meat come from? Probably best not to ask."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}