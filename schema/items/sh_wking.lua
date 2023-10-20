ITEM.name = "Wayne King's Own Brew Black'O Tea"
ITEM.model = Model("models/bioshockinfinite/ebsinthebottle.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "An alcoholic tea beverage using synthesized alcohol. Nobody really knows who Wayne King is, but the Combine have their symbol stamped all over his bottles."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}