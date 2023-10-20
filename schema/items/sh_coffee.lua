
ITEM.name = "Union Branded Coffee"
ITEM.model = Model("models/willardnetworks/food/coffee.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A Coffee cup with an interesting brand image promoting the Combine. Comes with the recipient's CID tag written on the side. The Coffee substitute isn't very good, however."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}