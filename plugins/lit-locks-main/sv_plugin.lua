local PLUGIN = PLUGIN



function PLUGIN:SaveCombineLocks()
	local data = {}

	for _, v in ipairs(ents.FindByClass("ix_cmblock")) do
		if (IsValid(v.door)) then
			data[#data + 1] = {
				v.door:MapCreationID(),
				v.door:WorldToLocal(v:GetPos()),
				v.door:WorldToLocalAngles(v:GetAngles()),
				v:GetLocked(),
                v:GetClass()
			}
		end
	end

	for _, v in ipairs(ents.FindByClass("ix_cwulock")) do
		if (IsValid(v.door)) then
			data[#data + 1] = {
				v.door:MapCreationID(),
				v.door:WorldToLocal(v:GetPos()),
				v.door:WorldToLocalAngles(v:GetAngles()),
				v:GetLocked(),
                v:GetClass()
			}
		end
	end

	for _, v in ipairs(ents.FindByClass("ix_cmulock")) do
		if (IsValid(v.door)) then
			data[#data + 1] = {
				v.door:MapCreationID(),
				v.door:WorldToLocal(v:GetPos()),
				v.door:WorldToLocalAngles(v:GetAngles()),
				v:GetLocked(),
                v:GetClass()
			}
		end
	end
	
	for _, v in ipairs(ents.FindByClass("ix_rbllock")) do
		if (IsValid(v.door)) then
			data[#data + 1] = {
				v.door:MapCreationID(),
				v.door:WorldToLocal(v:GetPos()),
				v.door:WorldToLocalAngles(v:GetAngles()),
				v:GetLocked(),
                v:GetClass()
			}
		end
	end

	

	ix.data.Set("combineLocksLit", data)
end


function PLUGIN:LoadCombineLocks()
	for _, v in ipairs(ix.data.Get("combineLocksLit") or {}) do
		local door = ents.GetMapCreatedEntity(v[1])

		if (IsValid(door) and door:IsDoor()) then
			local lock = ents.Create(v[5])

			lock:SetPos(door:GetPos())
			lock:Spawn()
			lock:SetDoor(door, door:LocalToWorld(v[2]), door:LocalToWorldAngles(v[3]))
			lock:SetLocked(v[4])
            
		end
	end
end