ITEM.name = "Reward Package: Priority"
ITEM.model = Model("models/pg_plops/pg_food/pg_tortellinat.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple metal box containing hot, premium tier food for only the most loyal Overseers of the Union. Given only to Officers within Civil Protection, the Combine Military, or The Consul themselves."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
}