require('resources')
require('playerdata')

--Stops channeling if tree already taken, else adds it to gathering array
function GatherCheck(event)

	local caster = event.caster
    local tree = event.target
	local tree_location = tree:GetAbsOrigin()
    local PlayerID = caster:GetMainControllingPlayer()
    if not AddToGather(tree_location, PlayerID, false) then
		caster:Stop()
		AddToGather(tree_location, PlayerID, true)
	end


end


--Gives wood every tick
function Gather( event )

    local caster = event.caster
    local tree = event.target
    local PlayerID = caster:GetMainControllingPlayer()
	ModifyLumber(PlayerID, 5);

end

--Removes the tree from the gathering array
function GatherStop(event)

	local caster = event.caster
    local tree = event.target
	local tree_location = tree:GetAbsOrigin()
    local PlayerID = caster:GetMainControllingPlayer()
    RmFromGather(tree_location, PlayerID)


end


--This function is called when a gatherer tries to gather lumber from a tree
--If there is already a worker gathering from that tree, return false
--Else, add tree to gather array and return true
function AddToGather(tree_location, playerID, override)
    DebugPrint("add tree location: ".. tostring(tree_location))
    local playerData = GetPlayerData(playerID)

    if override then
    	table.insert(playerData["tree_locations"], tree_location)
    	DebugPrint("OVERRIDE added tree location to table")
    	return
    end


    for k, location in pairs(playerData["tree_locations"]) do
        DebugPrint("add location: " .. tostring(location))
        if tree_location == location then
            DebugPrint("tree_location = location!")
            	return false
        end
    end

    table.insert(playerData["tree_locations"], tree_location)
    DebugPrint("added tree location to table")
    return true


end

function RmFromGather(tree_location, playerID)
	DebugPrint("remove tree location: ".. tostring(tree_location))
    local playerData = GetPlayerData(playerID)
    for k, location in pairs(playerData["tree_locations"]) do
        DebugPrint("remove location: " .. tostring(location))
        if tree_location == location then
            DebugPrint("removing tree from array")
            table.remove(playerData["tree_locations"], k)  
            return          
        end
    end
	DebugPrint("Got to the end of RmFromGather, this shouldn't happen")
end
