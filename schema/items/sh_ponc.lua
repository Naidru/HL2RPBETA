ITEM.name = "Synthesized Corn"
ITEM.model = Model("models/bioshockinfinite/porn_on_cob.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Bright, yellow, and corny as hell. It's corn! At least through the Combine synthesizer's point of view.. It's extremely chewy and gets stuck in your teeth often."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Eat = {
    OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(15)
		client:SetHealth( math.Clamp( HP + 15, 0, MaxHP ) )
		return true
	end,
}