require('hero_select_data')
-- File for builders to choose a specific builder after titan has been established


-- Present pick window
-- Once chosen, change player to that builder
-- Only 2 allowed, afterwards cannot select





-- A bunch of functions to aid in selecting roles.
function select_titan(event)
	local hero = event.caster
	local playerID = hero:GetPlayerOwnerID()
	addTitan(playerID)
	return 1
end

function select_either(event)
	local hero = event.caster
	local playerID = hero:GetPlayerOwnerID()
	addNeutral(playerID)
	return 1
end

function select_builder(event)
	local hero = event.caster
	local playerID = hero:GetPlayerOwnerID()
	addBuilder(playerID)
	return 1
end