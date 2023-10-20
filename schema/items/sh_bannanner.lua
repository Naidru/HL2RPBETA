ITEM.name = "Union Plantain"
ITEM.model = Model("models/bioshockinfinite/hext_banana.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A banana or some form of plantain stamped with a Combine logo. It doesn't look quite like the original thing, it's too uniform.. but tastes sort of similar.."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}