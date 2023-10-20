ITEM.name = "Synthesized Orange"
ITEM.model = Model("models/bioshockinfinite/hext_orange.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "It's an orange - it tastes like citrus, but it's not quite right, or as refreshing. The peel has a Union stamp, as well as a barcode.'"
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}