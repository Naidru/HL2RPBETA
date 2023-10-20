ITEM.name = "Synthesized Cheese"
ITEM.model = Model("models/bioshockinfinite/pound_cheese.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Cheese is very hard to make without a prime ingredient: Milk. Whatever this is? It's not cheese, but it'll sure as hell make you dream about wanting the real thing."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}