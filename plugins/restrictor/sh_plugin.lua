local PLUGIN = PLUGIN
PLUGIN.name = "Toolgun Restictor"
PLUGIN.description = "Restricts access to STOOLs."
PLUGIN.author = "liquid"

ix.flag.Add("w", "Access to wiremod tools.")

function PLUGIN:CanTool(ply, tr, tool)
    if string.sub(tool, 0, 5) == "wire_" then
        local character = ply:GetCharacter()
        return character and character:HasFlags("w")
    end
end