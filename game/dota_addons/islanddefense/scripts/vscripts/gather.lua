require('resources')

function Gather( event )

    -- set tree to taken
    -- Give wood every tick
    --literally none of this shit works ffs

    local caster = event.caster
    local PlayerID = caster:GetMainControllingPlayer()
--DebugPrint(PlayerID)

	ModifyLumber(PlayerID, 5);
end