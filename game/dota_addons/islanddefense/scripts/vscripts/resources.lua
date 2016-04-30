

-- Give 1 gold to hero attacking crystal
function GiveGold( event )
	
	local attackingUnit = event.attacker

	-- local player = PlayerResource:GetPlayer( caster:GetPlayerID() )

	attackingUnit:ModifyGold(1, true, 0)

end