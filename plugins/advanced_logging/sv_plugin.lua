// # Copyright © liquid - All Rights Reserved.
// - Unauthorized copying of these files, via any medium is strictly prohibited.
// - Proprietary and confidential.
// > Written by liquid <liquid@l1q.pw>, July 2021.

local PLUGIN = PLUGIN

local HANDLER = {}

function HANDLER.Load()
	local query = mysql:Create("ix_logs")
        query:Create("id", "INT(132) UNSIGNED NOT NULL AUTO_INCREMENT")
        query:Create("log_type", "VARCHAR(20) NULL")
        query:Create("log_string", "TEXT DEFAULT NULL")
        query:Create("log_time", "INT(32) UNSIGNED NOT NULL")
        query:Create("log_x", "REAL NULL")
        query:Create("log_y", "REAL NULL")
        query:Create("log_z", "REAL NULL")
        query:Create("steamid", "VARCHAR(20) NULL")
        query:Create("item_id", "INT(11) NULL")
        query:Create("character_id", "INT(11) NULL")
        query:PrimaryKey("id")
    query:Execute()
end

function HANDLER.Write(client, message, logFlag, logType, args)
    local character
    local item
    if args then
        for _, v in pairs(args) do
            if type(v) == "table" then
                if v.uniqueID ~= nil then
                    item = v
                    continue
                end
    
                if isfunction(v.GetFaction) then
                    character = v
                end
            end
        end
    end

    if not character and IsValid(client) then
        character = isfunction(client.GetCharacter) and client:GetCharacter() or nil
    end

	local query = mysql:Insert("ix_logs")
        query:Insert("log_type", logType)
        query:Insert("log_string", message)
        query:Insert("log_time", os.time())
        if IsValid(client) and client:IsPlayer() then
            query:Insert("steamid", client:SteamID64())
            query:Insert("log_x", client:GetPos().x)
            query:Insert("log_y", client:GetPos().y)
            query:Insert("log_z", client:GetPos().z)
        end
        if character then
            query:Insert("character_id", character:GetID())
        end
        if item then
            query:Insert("item_id", item:GetID())
        end
    
    PLUGIN.insertQueue = PLUGIN.insertQueue or ""
    
    local rawQuery = mysql.BuildInsertQuery(query)
    PLUGIN.insertQueue = PLUGIN.insertQueue .. rawQuery .. ";"
end

ix.log.RegisterHandler("AdvancedLogging", HANDLER)

function PLUGIN:FlushQueue()
    if PLUGIN.insertQueue and PLUGIN.insertQueue != "" then
        mysql:RawQuery(PLUGIN.insertQueue)
    end

    PLUGIN.insertQueue = ""
end

timer.Create("ixLoggingInsertQueue", 5, 0, function()
    PLUGIN:FlushQueue()
end)

util.AddNetworkString("ixOpenAdvancedLogging")

local function CanUseLogging(ply)
    return IsValid(ply) and ply:IsAdmin() or ply:IsUserGroup("moderator")
end

local function IsWhiteSpace(v)
    return isstring(v) and v:gsub("%s+", "") == ""
end

util.AddNetworkString("ixLoggingPull")
util.AddNetworkString("ixLoggingReceive")

net.Receive("ixLoggingPull", function(len, ply)
    if not CanUseLogging(ply) then return end
    local limit = math.min(net.ReadInt(32), 10000)
    local filter = net.ReadTable()

    -- flush any cached logs into the database before pulling shit
    PLUGIN:FlushQueue()

    local count = 0
    local whereClause = "WHERE "

    for k, v in pairs(filter) do
        count = count + 1
        if count > 1 then
            whereClause = whereClause .. " AND "
        end
        
        if k == "search" and !IsWhiteSpace(v) then
            whereClause = whereClause .. "`ix_logs`.log_string LIKE " .. SQLStr("%" .. v .. "%")
        end

        if k == "player" and !IsWhiteSpace(v) then
            whereClause = whereClause .. "(`ix_logs`.steamid LIKE " .. SQLStr(v) .. " OR `ix_players`.steam_name LIKE " .. SQLStr("%" .. v .. "%") .. ")"
        end

        if k == "character" then
            local numID = tonumber(v)
            if numID then
                whereClause = whereClause .. "`ix_logs`.character_id = " .. v
            elseif !IsWhiteSpace(v) then
                whereClause = whereClause .. "`ix_characters`.name LIKE " .. SQLStr("%" .. v .. "%")
            end
        end

        if k == "item" then
            local numID = tonumber(v)
            if numID then
                whereClause = whereClause .. "`ix_logs`.item_id = " .. v
            elseif !IsWhiteSpace(v) then
                whereClause = whereClause .. "`ix_items`.unique_id LIKE " .. SQLStr("%" .. v .. "%")
            end
        end
    end

    if count == 0 then whereClause = "" end

    local query = [[
        SELECT 
            `ix_logs`.*, `ix_players`.steam_name , `ix_characters`.name
        FROM `ix_logs`
        LEFT JOIN `ix_players` 
            ON `ix_logs`.steamid = `ix_players`.steamid 
        LEFT JOIN `ix_characters` 
            ON `ix_logs`.steamid = `ix_characters`.steamid
        LEFT JOIN `ix_items` 
            ON `ix_logs`.item_id = `ix_items`.item_id
        ]] .. whereClause .. [[
        GROUP BY `ix_logs`.`id`
        ORDER BY `ix_logs`.`id` DESC
        LIMIT ]] .. limit .. [[;
    ]]

    mysql:RawQuery(query, function(results)
        results = istable(results) and results or {}

        local data = util.TableToJSON(results)
        data = util.Compress(data)

        net.Start("ixLoggingReceive")
        net.WriteInt(#data, 32)
        net.WriteData(data, #data)
        net.Send(ply)
    end)
end)