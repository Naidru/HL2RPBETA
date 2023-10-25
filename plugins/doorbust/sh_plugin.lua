PLUGIN.name = "Door Bust Charges"
PLUGIN.author = "Black Tea; Helix conversion by Ghost."
PLUGIN.desc = "A Charge that can blow up the door."

if (CLIENT) then

	local muzzleMaterials = {}
	for i = 1, 8 do
		muzzleMaterials[i] = Material("effects/ar2ground2.vtf", "SpriteCard")
		muzzleMaterials[i]:SetInt("$additive", 1)
		muzzleMaterials[i]:SetInt("$translucent", 1)
		muzzleMaterials[i]:SetInt("$vertexcolor", 1)
		muzzleMaterials[i]:SetInt("$vertexalpha", 1)
	end

	local EFFECT = {}
	function EFFECT:Init( data ) 
		self:SetNoDraw(true)
		local pos = data:GetStart()	
		local scale = 3
		self.emitter = WORLDEMITTER or ParticleEmitter(Vector(0, 0, 0))

		for i = 0, 1 do
			local smoke = self.emitter:Add( "particle/particle_debris_01.vmt"..math.random(1,9), pos + VectorRand()*10)
			smoke:SetVelocity(VectorRand()*155*scale)
			smoke:SetDieTime(math.Rand(3,3))
			smoke:SetStartAlpha(math.Rand(255,255))
			smoke:SetEndAlpha(0)
			smoke:SetStartSize(math.random(155,5)*scale)
			smoke:SetEndSize(math.random(55,44)*scale)
			smoke:SetRoll(math.Rand(180,480))
			smoke:SetRollDelta(math.Rand(-3,3))
			smoke:SetColor(33, 33, 33)
			smoke:SetGravity( Vector( 0, 0, 20 ) )
			smoke:SetAirResistance(300)
		end

            local smoke = self.emitter:Add(ix.util.GetMaterial("particle/particle_smokegrenade.vmt"), pos + VectorRand()*10)
            smoke:SetVelocity(VectorRand()*155*scale)
            smoke:SetDieTime(math.Rand(4,4))
            smoke:SetStartAlpha(math.Rand(255,66))
            smoke:SetEndAlpha(0)
            smoke:SetStartSize(math.random(155,155)*scale)
            smoke:SetEndSize(math.random(100,88)*scale)
            smoke:SetRoll(math.Rand(180,480))
            smoke:SetRollDelta(math.Rand(-3,3))
            smoke:SetColor(128, 128, 128)
            smoke:SetGravity( Vector( 0, 0, 20 ) )
            smoke:SetAirResistance(250)
            
		for i = 0, 1 do
            local smoke = self.emitter:Add( muzzleMaterials[math.random(1, 8)], pos + VectorRand()*10)
            smoke:SetVelocity(VectorRand()*155*scale)
            smoke:SetDieTime(math.Rand(.3,.2))
            smoke:SetStartAlpha(math.Rand(255,255))
            smoke:SetEndAlpha(0)
            smoke:SetStartSize(math.random(155,155)*scale)
            smoke:SetEndSize(math.random(44,66)*scale)
            smoke:SetRoll(math.Rand(180,480))
            smoke:SetRollDelta(math.Rand(-3,3))
            smoke:SetColor(128, 128, 128)
            smoke:SetGravity( Vector( 0, 0, 20 ) )
            smoke:SetAirResistance(250)
        end

        self.nig = {}
		for i = 0, 15 do
			local smoke = self.emitter:Add(ix.util.GetMaterial("particle/particle_smokegrenade.vmt"), pos + VectorRand()*20)
			smoke:SetVelocity(VectorRand()*255*scale)
			smoke:SetDieTime(math.Rand(3,3))
			smoke:SetStartAlpha(math.Rand(255,155))
			smoke:SetEndAlpha(0)
			smoke:SetStartSize(math.random(255,255)*scale)
			smoke:SetEndSize(0)
			smoke:SetRoll(math.Rand(180,480))
			smoke:SetRollDelta(math.Rand(-3,3))
		    smoke:SetColor(128, 128, 128)
			smoke:SetAirResistance(250)
            table.insert(self.nig, smoke)
		end
	end

    function EFFECT:Think()
        for k, v in pairs(self.nig) do
            v:SetVelocity(VectorRand()*1900)
        end
    end

	effects.Register( EFFECT, "doorCharge" )
end