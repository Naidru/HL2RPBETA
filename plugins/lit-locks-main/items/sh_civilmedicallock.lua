ITEM.name = "Civil Medical Union Lock"
ITEM.category = "Lit Locks"
ITEM.description = "A metal apparatus applied to doors."
ITEM.model = Model("models/willardnetworks/props_combine/wn_combine_lock.mdl")
ITEM.width = 1
ITEM.height = 2
ITEM.iconCam = {
	pos = Vector(-0.5, 50, 2),
	ang = Angle(0, 270, 0),
	fov = 25.29
}
ITEM.lockEntity = "ix_cmulock"

ITEM.functions.Place = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client

		local lock = scripted_ents.Get(itemTable.lockEntity):SpawnFunction(client, util.TraceLine(data))

		if (IsValid(lock)) then
			client:EmitSound("physics/metal/weapon_impact_soft2.wav", 75, 80)
		else
			return false
		end
	end
}