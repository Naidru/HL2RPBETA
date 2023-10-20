ITEM.name = "Reward Package: Civil Protection"
ITEM.model = Model("models/pg_plops/pg_food/pg_tortellinac.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple metal box containing hot, hearty and supplemented food for Civil Protection Units. Includes performance enhancers and boosters."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}