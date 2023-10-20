ITEM.name = "Popcorn"
ITEM.model = Model("models/bioshockinfinite/topcorn_bag.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A container of Union-branded Popcorn. Synthesized as can be, but it'd get you through a boring movie. If those even existed anymore..."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}