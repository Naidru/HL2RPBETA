ITEM.name = "Synthesized Pineapple"
ITEM.model = Model("models/bioshockinfinite/hext_pineapple.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A pineapple that has no reason to exist, but the Combine decided to keep this one fruit among all the others."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}