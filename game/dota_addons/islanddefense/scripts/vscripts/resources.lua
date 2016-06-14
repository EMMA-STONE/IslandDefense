require('playerdata')

function PrintLumber(event)
	local hero = event.caster;
   	local playerID = hero:GetPlayerOwnerID();
  	local playerData = GetPlayerData(playerID)
	local current_lumber = playerData.lumber
	DebugPrint(current_lumber);



end

-- Give 1 gold to hero attacking crystal
function GiveGold( event )
	
	local attackingUnit = event.attacker

	--local player = PlayerResource:GetPlayer( caster:GetPlayerID() )
	--local hero = PlayerResource:GetSelectedHeroEntity(playerID)

			--hero:ModifyGold(interest)
	attackingUnit:ModifyGold(300);

end




-- EVERYTHING BELOW IS FROM ELEMENT TD and IDK if it will actually work

-- All gold is reliable. The gold value is stored on the playerData
function CDOTA_BaseNPC_Hero:ModifyGold(goldAmount)
	local hero = self
    local playerID = hero:GetPlayerOwnerID()
    local playerData = GetPlayerData(playerID)

    --[[if goldAmount < 0 and playerData.freeTowers then
        return
    end]]

   --[[ local goldGain = math.floor(goldAmount)
    local remainder = goldAmount - goldGain -- floating point component
    playerData.gold_remainder = playerData.gold_remainder + remainder -- accumulated
    if (playerData.gold_remainder >= 1) then
        playerData.gold_remainder = playerData.gold_remainder - 1
        goldGain = goldGain + 1
    end]]

    local newGold = tonumber(playerData.gold) + tonumber(goldAmount)
    SetCustomGold(playerID, newGold)
end

function CDOTA_BaseNPC_Hero:GetGold()
    local hero = self
    local playerID = hero:GetPlayerOwnerID()
    local playerData = GetPlayerData(playerID)
    return playerData.gold
end

function CDOTA_PlayerResource:GetGold(playerID)
    return GetPlayerData(playerID).gold
end

function CDOTA_BaseNPC_Hero:GetLumber()
    local hero = self
    local playerID = hero:GetPlayerOwnerID()
    local playerData = GetPlayerData(playerID)
    return playerData.lumber
end

function CDOTA_PlayerResource:GetLumber(playerID)
    return GetPlayerData(playerID).lumber
end

function CDOTA_PlayerResource:GetTotalGold()
    local totalGold = 0
    ForAllPlayerIDs(function(playerID)
        totalGold = totalGold + PlayerResource:GetGold(playerID)
    end)
    return totalGold
end

function SetCustomGold(playerID, amount)
    local playerData = GetPlayerData(playerID)
    local player = PlayerResource:GetPlayer(playerID)

    playerData.gold = amount

    local hero = PlayerResource:GetSelectedHeroEntity(playerID)
    if hero then
        hero:SetGold(0, false)
        hero:SetGold(playerData.gold, true) --This can go up to 99.999 gold, but the UI will still show bigger values
    end

    if player then
        CustomGameEventManager:Send_ServerToPlayer(player, "etd_update_gold", { gold = playerData.gold } )
    end
end

function ModifyLumber(playerID, amount)
    local playerData = GetPlayerData(playerID)

    SetCustomLumber(playerID, playerData.lumber + amount)

   --[[ if amount > 0 then
        local hero = PlayerResource:GetSelectedHeroEntity(playerID)
        local summoner = playerData.summoner

        if hero then
            PopupLumber(hero, amount)
        end

        if summoner and playerData.elementalCount == 0 then
            Highlight(summoner, playerID)
        end

        if GameSettings.elementsOrderName == "AllPick" then
            SendLumberMessage(playerID, "#etd_lumber_add", amount)
        end
    end]]
end

function SetCustomLumber(playerID, amount)
    local playerData = GetPlayerData(playerID)

    playerData.lumber = amount
    --UpdateSummonerSpells(playerID)    
    local hero = PlayerResource:GetSelectedHeroEntity(playerID)
    if hero then
        --hero:SetAbilityPoints(playerData.lumber)
    end

    local current_lumber = playerData.lumber
   -- local summoner = playerData.summoner
    --[[if summoner then
        if current_lumber > 0 then
            if not summoner.particle then
                local origin = summoner:GetAbsOrigin()
                local particleName = "particles/econ/courier/courier_trail_01/courier_trail_01.vpcf"
                summoner.particle = ParticleManager:CreateParticleForPlayer(particleName, PATTACH_CUSTOMORIGIN, summoner, PlayerResource:GetPlayer(playerID))
                ParticleManager:SetParticleControl(summoner.particle, 0, Vector(origin.x, origin.y, origin.z+30))
                ParticleManager:SetParticleControl(summoner.particle, 15, Vector(255,255,255))
                ParticleManager:SetParticleControl(summoner.particle, 16, Vector(1,0,0))
            end        
        else
            if summoner.particle then
                ParticleManager:DestroyParticle(summoner.particle, false)
                summoner.particle = nil
            end
        end

        local player = PlayerResource:GetPlayer(playerID)
        if player then
            CustomGameEventManager:Send_ServerToPlayer(player, "etd_update_lumber", { lumber = current_lumber, summoner = summoner:GetEntityIndex() } )
        end
    end

    UpdateScoreboard(playerID)]]
end