--hero_select_data
--This is where we store all of the people who have chosen Titan/Builder roles
if not data then
	data = {}
end

function CreateHeroSelect()
	if not data then
		data = {}
		data["numberofTitans"] = 0
		data["numberofNeutrals"] = 0
	    data["numberofBuilders"] = 0
		data["Titans"] = {}
		data["Neutrals"] = {}
		data["Builders"] ={}   
    	return data
	else
		return data
	end
	return data
end

function addTitan(playerID)
	--data["numberofTitans"] = data["numberofTitans"] + 1;
	--data.Titans.[numberofTitans] = playerID
	DebugPrint("Added Titan.  Total # of titans: " .. data["numberofTitans"])
end

function addNeutral(playerID)
	--data["numberofTitans"] = data["numberofTitans"] + 1;
	--data.Titans.[numberofTitans] = playerID
	DebugPrint("Added neutral.  Total # of eithers: " .. data["numberofNeutrals"])
end

function addBuilder(playerID)
	--data["numberofTitans"] = data["numberofTitans"] + 1;
	--data.Titans.[numberofTitans] = playerID
	DebugPrint("Added builder.  Total # of builders: " .. data["numberofBuilders"])
end