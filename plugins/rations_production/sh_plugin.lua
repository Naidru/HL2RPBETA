local PLUGIN = PLUGIN

PLUGIN.name = "Ration Production System"
PLUGIN.description = "Adds a functional ration production to your HL2RP schema"
PLUGIN.author = "Ceryx"
--[[-----------------------
This plugin adds a functional ration production system forcing citizens to work for their rations instead of getting free and out of thin air.

When you set up the entities make sure to use the ration dispenser of this plugin and not the regular one otherwise this plugin is pointless

It is important to know that some of the machines can wear off while being used, which also adds another item that will fix the machines when needed.

To fix machines that need repair, get a toolbox from a CP or think of another way to obtain it and hit 'Use' on machines with high wear.
Ration tokens are also obtained from CP so it can work under the workcycle event or you can think of your own way of doing it.

You can modify this plugin however you want, my only demand if you happen to upload it anywhere credit me for it.
-----------------------]]--

ix.util.Include("sv_plugin.lua")
ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_data.lua")

LANGUAGE = {
    optPlasticProduceTime = "Plastic Production Time",
    optWrapperProduceTime = "Wrapper Production Time",
    optPaintProduceTime = "Painting Production Time",
    optContentProduceTime = "Conents Production Time"
}

ix.config.Add("plasticProduceTime", 5, "How long it takes the machines to produce plastic for the wrapper", nil, {
    data = {min = 5, max = 60},
    category = "Ration Production"
})

ix.config.Add("wrapperProduceTime", 20, "How long it takes the machines to produce the rations wrapper", nil, {
    data = {min = 5, max = 60},
    category = "Ration Production"
})

ix.config.Add("paintProduceTime", 15, "How long it takes the machines to paint the rations", nil, {
    data = {min = 5, max = 60},
    category = "Ration Production"
})

ix.config.Add("contentProduceTime", 10, "How long it takes the machines to insert the ration contents", nil, {
    data = {min = 5, max = 60},
    category = "Ration Production"
})

ix.command.Add("AddRationStock", {
    description = "Add rations to the stock",
    arguments = ix.type.number,
    OnRun = function(self, ply, amt)
        if (not ply:IsSuperAdmin()) then
            return "Not so fast buddy!"
        end

        if(amt <= 0 or amt == "") then
            return "Invalid Value"
        else
            Schema:AddRationStock(amt)
            ply:Notify("Added: " .. amt .. " rations to the stock.")
        end
    end
})

ix.command.Add("RemoveRationStock", {
    description = "Remove rations from the stock",
    arguments = ix.type.number,
    OnRun = function(self, ply, amt)
        if (not ply:IsSuperAdmin()) then
            return "Not so fast buddy!"
        end

        if(amt <= 0 or amt == "") then
            return "Invalid Value"
        else
            Schema:AddRationStock(-amt)
            ply:Notify("Removed: " .. amt .. " rations from the stock.")
        end
    end
})