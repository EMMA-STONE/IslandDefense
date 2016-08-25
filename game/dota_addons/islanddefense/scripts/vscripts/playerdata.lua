-- playerdata.lua
-- manages player data

if not PlayerData then
	PlayerData = {}
end

function CreateDataForPlayer(playerID, allowOverride, hero)

    -- Don't create data twice unless allowed to override
    if not allowOverride then
        if PlayerData[playerID] or playerID == -1 then
            return 
        end
    end

	PlayerData[playerID] = {}
	local data = PlayerData[playerID]
	data["hero"] = hero
	data["lumber"] = 100
	data["gold"] = 500
	data["tree_locations"] = {}
    --data["gold_remainder"] = 0
	--data["towers"] = {}
	--data["victory"] = 0  -- 0 if lost, 1 if won    
    print("Created Data for player ", playerID)
    
	return data
end


function GetPlayerData(playerID)
	return PlayerData[playerID]
end

function GetPlayerName(playerID)
	return PlayerData[playerID].name or ""
end
