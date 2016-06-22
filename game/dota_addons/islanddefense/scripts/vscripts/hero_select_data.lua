--hero_select_data
--This is where we store all of the people who have chosen Titan/Builder roles
if not data then
	data = {}
end

function CreateHeroSelect()

		data["numberofTitans"] = 0
		data["numberofNeutrals"] = 0
	    data["numberofBuilders"] = 0
		data["Titans"] = {}
		data["Neutrals"] = {}
		data["Builders"] ={}   
	return
end

function addTitan(playerID)
	data["numberofTitans"] = data["numberofTitans"] + 1;
	data["Titans"][data["numberofTitans"]] = playerID
	DebugPrint("Added Titan.  Total # of titans: " .. data["numberofTitans"])
end

function addNeutral(playerID)
	data["numberofNeutrals"] = data["numberofNeutrals"] + 1;
	data["Neutrals"][data["numberofNeutrals"]] = playerID
	DebugPrint("Added neutral.  Total # of eithers: " .. data["numberofNeutrals"])
end

function addBuilder(playerID)
	data["numberofBuilders"] = data["numberofBuilders"] + 1;
	data["Builders"][data["numberofBuilders"]] = playerID
	DebugPrint("Added builder.  Total # of builders: " .. data["numberofBuilders"])
end

function chooseTitan()
	--math.randomseed(os.time())
	local TitanPlayerID
	if data["numberofTitans"] >= 1 then
		TitanPlayerID = data["Titans"][math.random(data["numberofTitans"])]
	elseif data["numberofNeutrals"] >= 1 then
		TitanPlayerID = data["Neutrals"][math.random(data["numberofNeutrals"])]
	else
		TitanPlayerID = data["Builders"][math.random(data["numberofBuilders"])]
	end
	
	return TitanPlayerID
end