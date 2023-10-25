// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.

local PLUGIN = PLUGIN
PLUGIN.name = "Ratio Enforcer"
PLUGIN.author = "liquid"
PLUGIN.description = "Enforces ration between CCA/citizens etc."

ix.config.Add("ratioEnforcerEnabled", ix.config.Get("ratioEnforcerEnabled", true), "", nil, {
	category = "Ratio Enforcer"
})

ix.config.Add("ratioCitizens", ix.config.Get("ratioCitizens", 1), "", nil, {
	data = {min = 1, max = 10},
	category = "Ratio Enforcer"
})

ix.config.Add("ratioCombine", ix.config.Get("ratioCombine", 2), "", nil, {
	data = {min = 1, max = 10},
	category = "Ratio Enforcer"
})

ix.config.Add("ignoreBypassedPeople", ix.config.Get("ignoreBypassedPeople", true), "", nil, {
	category = "Ratio Enforcer"
})

ix.command.Add("AllowFlagUp", {
	description = "Allow someone to flag up",
	superAdminOnly = true,
	arguments = ix.type.player,
	OnRun = function(self, client, target)
		target.skipRatioCheckOnce = true
        return "Skipping ratio enforcer once for " .. target:Name() .. "."
	end
})

CAMI.RegisterPrivilege({
	Name = "Helix - Bypass Ratio Enforcer",
	MinAccess = "superadmin"
})

function PLUGIN:GetLoadedInPlayers()
    local results = {}

    for _, v in ipairs(player.GetAll()) do
        if !isfunction(v.GetCharacter) then continue end

        local char = v:GetCharacter()
        if not char then continue end

        results[v] = char
    end

    return results
end

function PLUGIN:CanPlayerUseCharacter(client, character)
    if !ix.config.Get("ratioEnforcerEnabled", false) then
        return
    end

    if CAMI.PlayerHasAccess(client, "Helix - Bypass Ratio Enforcer", nil) then return end
    if client.skipRatioCheckOnce then
        client.skipRatioCheckOnce = nil
        return
    end

    local combineFactions = {
        FACTION_MPF
        --FACTION_DISPATCH,
        --FACTION_OTA
    }

    local skipCitizens = {
        FACTION_OTA,
        FACTION_VORT,
        FACTION_DISPATCH,
        FACTION_FREEVORT,
        FACTION_STAFF,
        FACTION_DISTRICTADMINISTRATOR,
        FACTION_CIC
    }

    local loadedIn = self:GetLoadedInPlayers()
    
    --local minimumPlayers = ix.config.Get("ratioCitizens") + ix.config.Get("ratioCombine") 
    --if #loadedIn < minimumPlayers then return end

    if table.HasValue(combineFactions, character:GetFaction()) then
        local citizenCount = 0

        -- add 1 because we need to check if the ratio AFTER switching would be breaking the rules
        local combineCount = 1 

        local afkCombine = {}

        for ply, char in pairs(loadedIn) do
            if table.HasValue(combineFactions, ply:Team()) then

                local onDuty = ply:GetNetVar("onDuty", true)

                if !(ix.config.Get("ignoreBypassedPeople")
                and CAMI.PlayerHasAccess(ply, "Helix - Bypass Ratio Enforcer", nil))
                and onDuty then
                    combineCount = combineCount + 1
                end

                if ply.isAFK and onDuty then
                    table.insert(afkCombine, char)
                end
            elseif !table.HasValue(skipCitizens, ply:Team()) then
                citizenCount = citizenCount + 1
            end
        end

        local ixRatio = citizenCount / combineCount
        local ixRequiredRatio = ix.config.Get("ratioCitizens") / ix.config.Get("ratioCombine")

        if ixRatio < ixRequiredRatio then
            if #afkCombine > 0 then
                local afkChar = afkCombine[math.random(#afkCombine)]
                local afkName = afkChar:GetName()

                timer.Simple(3, function()
                    afkChar:Kick()
                end)

                timer.Simple(.5, function()
                    afkChar:GetPlayer():Notify("You have been kicked off of your character because you were AFK and somebody else flagged up.")
                    client:Notify(afkName .. " was kicked off their character to let you flag up since they were AFK.")
                end)
                
                return
            end

            return false, "Sorry! You cannot flag up due to the current ratio being uneven."
        end
    end
end