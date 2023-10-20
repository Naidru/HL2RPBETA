
ITEM.name = "Small Conscript IFAK"
ITEM.model = Model("models/willardnetworks/clothingitems_conscripts/torso_ifak.mdl")
ITEM.description = "A small pack with medical equipment inside."
ITEM.category = "Medical"
ITEM.price = 10

ITEM.functions.Apply = {
	sound = "items/medshot4.wav",
	OnRun = function(itemTable)
		local client = itemTable.player

		client:SetHealth(math.min(client:Health() + 20, client:GetMaxHealth()))
	end
}
