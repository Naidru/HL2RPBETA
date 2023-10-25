PLUGIN.name = "Unstuck API"
PLUGIN.author = "SunRed"
PLUGIN.description = "A replacement for the default unstucking mechanism."

-- THIS IS A DIRECT COPY PASTE FROM GIST
-- https://gist.github.com/SunRed/da1b02efa7c167804e65

-- this shit works wonders thank you

if not SERVER then return end

-- TODO: Nocollided props still trigger even with MASK_PLAYERSOLID!
---------------------------------------------------------------
local ply = nil

-- WeHateGarbage
local t = {start=nil,endpos=nil,mask=MASK_PLAYERSOLID,filter=nil}
local function PlayerNotStuck()

	t.start = ply:GetPos()
	t.endpos = t.start
	t.filter = ply
	
	return util.TraceEntity(t,ply).StartSolid == false
	
end

local NewPos = nil
local function FindPassableSpace( direction, step )

	local i = 0
	while ( i < 100 ) do
		local origin = ply:GetPos()

		--origin = VectorMA( origin, step, direction )
		origin = origin + step * direction
		
		ply:SetPos( origin )
		if PlayerNotStuck( ply ) then
			NewPos = ply:GetPos()
			return true
		end
		i = i + 1
	end
	return false
end

-- 	
--	Purpose: Unstucks player
--	Note: Very expensive to call, you have been warned!
--
local function UnstuckPlayer( pl )
	ply = pl

	NewPos = ply:GetPos()
	local OldPos = NewPos
	
	if not PlayerNotStuck( ply ) then
	
		local angle = ply:GetAngles()
		
		local forward = angle:Forward()
		local right = angle:Right()
		local up = angle:Up()
		
		local SearchScale = 1 -- Increase and it will unstuck you from even harder places but with lost accuracy. Please, don't try higher values than 12

		if	not FindPassableSpace( forward, SearchScale ) and	-- forward
			not FindPassableSpace( right, SearchScale ) and  	-- right
			not FindPassableSpace( right, -SearchScale ) and 	-- left
			not FindPassableSpace( up, SearchScale ) and    	-- up
			not FindPassableSpace( up, -SearchScale ) and   	-- down
			not FindPassableSpace( forward, -SearchScale )   	-- back
		then								
			--Msg( "Can't find the world for player "..tostring(ply).."\n" )
			return false
		end
		
		if OldPos == NewPos then 
			return true -- Not stuck?
		else
			ply:SetPos( NewPos )
			if SERVER and ply and ply:IsValid() and ply:GetPhysicsObject():IsValid() then
				if ply:IsPlayer() then
					ply:SetVelocity(vector_origin)
				end
				ply:GetPhysicsObject():SetVelocity(vector_origin) -- prevents bugs :s
			end
		
			return true
		end
		
	end
	
	
end

---------------------------------------------------------------

local meta = FindMetaTable( "Player" )
if not meta then return end

--	Unstucks a player
-- returns:
--	true:	Unstucked
--	false:	Could not UnStuck
--	else:	Not stuck 
--
function meta:UnStuck()
	return UnstuckPlayer(self)
end