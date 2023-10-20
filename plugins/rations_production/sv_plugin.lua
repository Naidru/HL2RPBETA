local PLUGIN = PLUGIN

util.AddNetworkString("nUpdateRationStock")

ix.RationsStock = ix.RationsStock or 0

function Schema:UpdateRationStock(amt)
	local limit = 75

	ix.RationsStock = math.Clamp(amt, 0, limit)
	net.Start("nUpdateRationStock")
	net.WriteUInt(ix.RationsStock, 7)
	net.Broadcast()
end

function Schema:AddRationStock(amt)
	local limit = 75

	local rations = math.Clamp(ix.RationsStock + amt, 0, limit)
	ix.RationsStock = rations
	net.Start("nUpdateRationStock")
	net.WriteUInt(rations, 7)
	net.Broadcast()
end

function PLUGIN:CanPlayerHoldObject(ply, ent)
	if (ent:GetClass() == "ix_ration") then return true end
end
