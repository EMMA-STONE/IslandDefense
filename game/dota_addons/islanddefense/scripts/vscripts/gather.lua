require('resources')

function Gather( event )

    -- set tree to taken
    -- Give wood every tick

    local caster = event.caster
    local target = event.target
    local PlayerID = caster:GetMainControllingPlayer()

    if target:HasModifier("modifier_cant_cut") then
		caster:InterruptChannel()
	else
		ModifyLumber(PlayerID, 5);
	end
end