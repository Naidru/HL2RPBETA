// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.

local PLUGIN = PLUGIN
PLUGIN.name = "Enhanced Scanner"
PLUGIN.description = "Adds the ability for scanners to take pictures and send to units."

PLUGIN.pictureData = PLUGIN.pictureData or {}

ix.config.Add("ixScannerFlashRadius", 50, "The radius of a scanner's flash sphere.", nil, {
	data = {min = 10, max = 5000},
	category = "Scanner"
})

if CLIENT then
	function PLUGIN:ShouldHideBars()
		if Schema.IsScannerFirstPerson and Schema:IsScannerFirstPerson() then return true end
	end

	function PLUGIN:LoadFonts(font, genericFont)
		surface.CreateFont("ixScannerHUD", {
			font = "BudgetLabel",
			size = ScrH() * .06,
			extended = true,
			weight = 600,
			antialias = true
		})

		surface.CreateFont("ixScannerHUDSmall", {
			font = "BudgetLabel",
			size = ScrH() * .04,
			extended = true,
			weight = 300
		})
	end

	function PLUGIN:GetDimensions()
		local h = ScrH() * .6
		local w = h
		local x = ScrW() / 2 - h / 2
		local y = ScrH() / 2 - h / 2

		return x, y, w, h
	end

	function PLUGIN:HUDPaint()
		if !Schema.IsScannerFirstPerson or !Schema:IsScannerFirstPerson() then return end
		local x, y, w, h = self:GetDimensions()
		surface.SetDrawColor(0, 0, 0)

		for i = 1, 2 do
			surface.DrawOutlinedRect(x + i, y + i, w - i * 2, h - i * 2)
		end

		surface.SetDrawColor(255, 255, 255)

		for i = 3, 4 do
			surface.DrawOutlinedRect(x + i, y + i, w - i * 2, h - i * 2)
		end

		surface.SetDrawColor(0, 0, 0, 150)
		surface.DrawRect(0, 0, x, ScrH())
		surface.DrawRect(x + w, 0, x, ScrH())
		surface.DrawRect(x, 0, w, y)
		surface.DrawRect(x, y + h, w, y)
		local pos = Vector(0, 0, 0)
		local velocity = Vector(0, 0, 0)
		local altitude = 0

		if IsValid(LocalPlayer().pk_pill_ent) then
			velocity = LocalPlayer().pk_pill_ent:GetVelocity()
			pos = LocalPlayer().pk_pill_ent:GetPos()
			local tr = util.QuickTrace(pos, pos + Vector(0, 0, -9999999), {LocalPlayer(), LocalPlayer().pk_pill_ent})
			altitude = pos:Distance(tr.HitPos)
		end

		draw.SimpleTextOutlined(string.format("<:: %s ::>", LocalPlayer():Name()), "ixScannerHUD", x + (w * .01), y + (w * .01), nil, nil, nil, ScrH() * .004, Color(0, 0, 0))
		draw.SimpleTextOutlined(string.format("<:: POS :-: %.0f -: %.0f -: %.0f ::>", pos.x, pos.y, pos.z), "ixScannerHUDSmall", x + (w * .01), y + (w * .01) + ScrH() * .06, nil, nil, nil, ScrH() * .002, Color(0, 0, 0))
		draw.SimpleTextOutlined(string.format("<:: VEL :-: %.0f ::>", velocity:Length()), "ixScannerHUDSmall", x + (w * .01), y + (w * .01) + (ScrH() * .09), nil, nil, nil, ScrH() * .002, Color(0, 0, 0))
		draw.SimpleTextOutlined(string.format("<:: ALT :-: %.0f ::>", altitude), "ixScannerHUDSmall", x + (w * .01), y + (w * .01) + ScrH() * .12, nil, nil, nil, ScrH() * .002, Color(0, 0, 0))
	end

    function PLUGIN:PostRender()
        if self.doPicture then
            self.doPicture = nil
            self:DoPicture()
        end
    end

	function PLUGIN:DoPicture()
		local x, y, w, h = PLUGIN:GetDimensions()

		local data = render.Capture({
			format = "jpeg",
			quality = 0,
			x = x,
			y = y,
			w = w,
			h = h
		})

        local pictureID = math.random(11111, 99999)
        
        -- send an unreliable message so it actually sends before the whole thing is done
        net.Start("ixScannerPictureStart")
        net.SendToServer()

        timer.Simple(.1, function()
            local dataSplit = netstream.Split(util.Compress(data))

            for k, v in pairs(dataSplit) do
                netstream.Start("ixScannerPictureChunk", pictureID, v, k == #dataSplit)
            end
        end)
	end

	function PLUGIN:KeyPress(ply, key)
		if ply ~= LocalPlayer() then return end
		if key ~= IN_ATTACK then return end
		if not Schema:IsScannerFirstPerson() then return end
		self.nextRunTime = self.nextRunTime or 0
		if self.nextRunTime > CurTime() then return end
		self.nextRunTime = CurTime() + 5
		self.doPicture = true
	end

    netstream.Hook("ixScannerPictureChunk", function(pictureID, chunk, photographer, isEnd)
        PLUGIN.pictureData[pictureID] = PLUGIN.pictureData[pictureID] or ""
        PLUGIN.pictureData[pictureID] = PLUGIN.pictureData[pictureID] .. chunk

        if isEnd then
            if !IsValid(ix.gui.combine) then return end

            local fileName = string.format("helix/scanner_%d.jpg", pictureID)
            file.Write(fileName, util.Decompress(PLUGIN.pictureData[pictureID]))
            ix.gui.combine:AddImage(Material("../data/" .. fileName, "smooth"), 10, 1)
            file.Delete(fileName)

            ix.gui.combine:AddLine(string.format("Visual download from %s complete.", photographer:Name()), Color(39,240,139))

            PLUGIN.pictureData[pictureID] = nil
        end
    end)

	net.Receive("ixScannerFlashed", function()
		if LocalPlayer():Team() == FACTION_DISPATCH then return end

		LocalPlayer():ScreenFade(SCREENFADE.IN, Color(255, 255, 255, 250), 1, 1)
	end)
end

if SERVER then
    util.AddNetworkString("ixScannerPictureStart")
    util.AddNetworkString("ixScannerFlashed")

    net.Receive("ixScannerPictureStart", function(len, ply)
		if ply:Team() != FACTION_DISPATCH then
			ix.plugin.Get("adminutil"):WarnExploits(ply, "ixScannerPictureStart")
			return
		end

		local entities = ents.FindInSphere(ply:GetPos(), ix.config.Get("ixScannerFlashRadius", 50))
		for _, target in pairs(entities) do
			if target:IsPlayer() then
				net.Start("ixScannerFlashed")
				net.Send(target)
			end
		end
		Schema:AddCombineDisplayMessage(string.format("Preparing for visual upload from %s.", ply:Name()))
	end)

    netstream.Hook("ixScannerPictureChunk", function(ply, pictureID, chunk, isEnd)
        if ply:Team() != FACTION_DISPATCH then
            ix.plugin.Get("adminutil"):WarnExploits(ply, "ixScannerPictureChunk")
            return
        end

        local pictureExists = PLUGIN.pictureData[pictureID] != nil

        if !pictureExists then
            ply.ixNextScannerPicture = ply.ixNextScannerPicture or 0
            if ply.ixNextScannerPicture > CurTime() then return end
            ply.ixNextScannerPicture = CurTime() + 4.5

            PLUGIN.pictureData[pictureID] = ""
        end

        PLUGIN.pictureData[pictureID] = PLUGIN.pictureData[pictureID] .. chunk

        if isEnd then
            local dataSplit = netstream.Split(PLUGIN.pictureData[pictureID])

            local receivers = {}

            for _, v in ipairs(player.GetAll()) do
                if v:IsCombine() or v:Team() == FACTION_DISPATCH then
                    table.insert(receivers, v)
                end
            end

            for k, v in pairs(dataSplit) do
                netstream.Start(receivers, "ixScannerPictureChunk", pictureID, v, ply, k == #dataSplit)
            end

            PLUGIN.pictureData[pictureID] = nil
        end
    end)
end