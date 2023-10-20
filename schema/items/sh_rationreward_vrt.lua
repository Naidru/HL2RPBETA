ITEM.name = "Reward Package: Biotic"
ITEM.model = Model("models/pg_plops/pg_food/pg_tortellinas.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple metal box containing hot, bland nutritional paste. Vortigaunts don't seem to mind it (They do). Given to Vortigaunt Slaves for loyalty in their duties to the Union."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}