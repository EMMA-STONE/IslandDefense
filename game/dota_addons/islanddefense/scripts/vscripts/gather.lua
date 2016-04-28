function Gather( event )

    -- set tree to taken
    -- Give wood every tick

    local caster = event.caster
    local pID = caster:GetMainControllingPlayer()


	

    -- Not working
	Timers:CreateTimer(0, 
    function()
      
      SetGold(hero, hero:GetGold() + 1, 1)

      return 1 
    end)    

end