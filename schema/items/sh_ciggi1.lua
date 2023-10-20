ITEM.name = "Union-Branded Cigarettes"
ITEM.model = Model("models/willardnetworks/cigarettes/cigarette_pack.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A simple, white pack with a Combine symbol stamped on, containing ready-to-smoke cigarettes."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Smoke = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, 100))

        return true
    end,
}