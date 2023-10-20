local PLUGIN = PLUGIN

-- Data Saving --

function PLUGIN:SaveData()
	local packerData = {}
	local wrapperData = {}
	local painterData = {}
	local rtokenData = {}
	local rdepotData = {}
	local rdisData = {}

	for _, v in ipairs( ents.FindByClass( "ix_packing_machine" ) ) do
		packerData[#packerData + 1] = {
			v:GetPos( ),
			v:GetAngles( )
		}
	end

	for _, v in ipairs( ents.FindByClass( "ix_wrapper_machine" ) ) do
		wrapperData[#wrapperData + 1] = {
			v:GetPos( ),
			v:GetAngles( )
		}
	end

	for _, v in ipairs( ents.FindByClass( "ix_painting_machine" ) ) do
		painterData[#painterData + 1] = {
			v:GetPos( ),
			v:GetAngles( )
		}
	end

	for _, v in ipairs( ents.FindByClass( "ix_token_machine" ) ) do
		rtokenData[#rtokenData + 1] = {
			v:GetPos( ),
			v:GetAngles( )
		}
	end

	for _, v in ipairs( ents.FindByClass( "ix_rations_depot" ) ) do
		rdepotData[#rdepotData + 1] = {
			v:GetPos( ),
			v:GetAngles( )
		}
	end

	for _, v in ipairs( ents.FindByClass( "ix_ration_dispenser" ) ) do
		rdisData[#rdisData + 1] = {
			v:GetPos( ),
			v:GetAngles( )
		}
	end

	ix.data.Set("packerData", packerData)
	ix.data.Set("wrapperData", wrapperData)
	ix.data.Set("painterData", painterData)
	ix.data.Set("rtokenData", rtokenData)
	ix.data.Set("rdepotData", rdepotData)
	ix.data.Set("rdisData", rdisData)
end

-- Data Loading --

function PLUGIN:LoadData()
	for _, v in ipairs( ix.data.Get( "packerData" ) or {} ) do
		local packer = ents.Create( "ix_packing_machine" )

		packer:SetPos(v[1])
		packer:SetAngles(v[2])
		packer:Spawn()

		local physicsObject = packer:GetPhysicsObject( )
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion( false )
		end
	end

	for _, v in ipairs( ix.data.Get( "wrapperData" ) or {} ) do
		local wrapper = ents.Create( "ix_wrapper_machine" )

		wrapper:SetPos(v[1])
		wrapper:SetAngles(v[2])
		wrapper:Spawn()

		local physicsObject = wrapper:GetPhysicsObject( )
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion( false )
		end
	end

	for _, v in ipairs( ix.data.Get( "painterData" ) or {} ) do
		local painter = ents.Create( "ix_painting_machine" )

		painter:SetPos(v[1])
		painter:SetAngles(v[2])
		painter:Spawn()

		local physicsObject = painter:GetPhysicsObject( )
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion( false )
		end
	end

	for _, v in ipairs( ix.data.Get( "rtokenData" ) or {} ) do
		local rtoken = ents.Create( "ix_token_machine" )

		rtoken:SetPos(v[1])
		rtoken:SetAngles(v[2])
		rtoken:Spawn()

		local physicsObject = rtoken:GetPhysicsObject( )
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion( false )
		end
	end

	for _, v in ipairs( ix.data.Get( "rdepotData" ) or {} ) do
		local depot = ents.Create( "ix_rations_depot" )

		depot:SetPos(v[1])
		depot:SetAngles(v[2])
		depot:Spawn()

		local physicsObject = depot:GetPhysicsObject( )
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion( false )
		end
	end

	for _, v in ipairs( ix.data.Get( "rdisData" ) or {} ) do
		local rdis = ents.Create( "ix_ration_dispenser" )

		rdis:SetPos(v[1])
		rdis:SetAngles(v[2])
		rdis:Spawn()

		local physicsObject = rdis:GetPhysicsObject( )
		
		if (IsValid(physicsObject)) then
			physicsObject:EnableMotion( false )
		end
	end
end