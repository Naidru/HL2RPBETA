local PLUGIN = PLUGIN
PLUGIN.name = "MPF Radio Noises"
PLUGIN.description = "Adds immersive radio chatter."
PLUGIN.author = "liquid"

ix.config.Add("combineChatterEnabled", true, "", nil, {
    category = "Combine Chatter"
})

ix.config.Add("combineChatterChance", 40, "", nil, {
    data = {min = 0, max = 100},
    category = "Combine Chatter"
})

if SERVER then
	util.AddNetworkString("ixMPFChatter")
end

if CLIENT then
    net.Receive("ixMPFChatter", function() 
        local entities = net.ReadTable()
        for _, ent in ipairs(entities) do
        if ent != nil and entities != nil then
            ent:EmitSound("combinechatter/chatter" .. math.random(1, 9) .. ".wav", 70, math.random(90, 110), 0.3)
        end
     end
    end)
end