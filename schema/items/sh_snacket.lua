ITEM.name = "Snack Packet"
ITEM.model = Model("models/gibs/props_canteen/vm_sneckol.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A brown packet that comes on their own or with larger Ration Packs, containing simple snacks to be eaten whenever desired."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}