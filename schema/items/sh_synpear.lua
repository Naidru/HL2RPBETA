ITEM.name = "Synthesized Pear"
ITEM.model = Model("models/bioshockinfinite/hext_pear.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "It's a pear, but it's not quite what it ap-pears to be. Get it?.."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}