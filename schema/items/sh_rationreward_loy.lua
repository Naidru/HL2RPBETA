ITEM.name = "Reward Package: Loyalist"
ITEM.model = Model("models/pg_plops/pg_food/pg_tortellinap.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple metal box containing hot, fresh, and flavourful unsynthesized food. A Loyalist Tier reward for proven assistance and/or loyalty to the Union."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}