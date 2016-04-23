function Gather( event )
	-- body
    local caster = event.caster
    local ability = event.ability
    local ability_name = ability:GetAbilityName()
    local target = event.target
    local target_class = target:GetClassname()

    if target_class == "ent_dota_tree" then

    	if (tree.builder ~= nil and tree.builder ~= caster) then
            print(" The Tree already has a wisp in it, find another one!")
            caster:Interrupt()
            return
        end

end