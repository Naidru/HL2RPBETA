// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.

local PLUGIN = PLUGIN
PLUGIN.name = "Advanced Logging"
PLUGIN.author = "liquid"

ix.util.Include("sv_plugin.lua")

ix.command.Add("Logs", {
	syntax = "<none>",
    adminOnly = true,
	description = "Open the advanced logging menu.",
	OnRun = function(self, client)
        if client:IsUserGroup("event manager") then return "You are not allowed to do this." end
		net.Start("ixOpenAdvancedLogging")

        local logTypes = {}
        for k, _ in pairs(ix.log.types) do
            table.insert(logTypes, k)
        end

        net.WriteTable(logTypes)
        net.Send(client)
	end
})

if CLIENT then
    function PLUGIN:LoadFonts(font ,genericFont)
        surface.CreateFont("ixLogs", {
            font = genericFont,
            size = 12,
            extended = true,
            weight = 400,
            antialias = true
        })

        surface.CreateFont("ixLogsBold", {
            font = genericFont,
            size = 12,
            extended = true,
            weight = 700,
            antialias = true
        })
    end

    net.Receive("ixOpenAdvancedLogging", function()
        PLUGIN.logTypes = net.ReadTable()
        vgui.Create("ixAdvancedLogging")
    end)
end