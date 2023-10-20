ITEM.name = "Cooked Synthesized Steak"
ITEM.RestoreHunger = 50
ITEM.model = Model("models/willardnetworks/food/meat6.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "You know, I know this steak doesn't exist. I know that when I put it in my mouth, the Union is telling my brain that it's juicy and delicious. After nine years, you know what I realize? Ignorance is bliss."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 10, 100))

        return true
    end,
} 