
PLUGIN.name = "Lit Locks"
PLUGIN.description = "Adds a dyanmic light to combine locks"
PLUGIN.author = "Generic"

ix.util.Include("sv_plugin.lua")
ix.util.Include("cl_plugin.lua")
AddCSLuaFile("cl_plugin.lua")
ix.util.Include("sv_hooks.lua")


ix.config.Add("LockRadius", 128, "The radius of the light emitted by combine locks", nil, {
    data = {min = 0, max = 384},
    category = "Lit Locks"
})

ix.config.Add("LockBrightness", 0.5, "The brightness of the light emitted by combine locks", nil, {
    data = {min = 0.0, max = 2, decimals = 1},
    category = "Lit Locks"
})