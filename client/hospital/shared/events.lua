RegisterNetEvent('mythic_hospital:client:FinishServices')
AddEventHandler('mythic_hospital:client:FinishServices', function(h, wasLucky)
    if h and usedHiddenRev then return end

    local player = PlayerPedId()

	if IsPedDeadOrDying(player) then
		local playerPos = GetEntityCoords(player, true)
		NetworkResurrectLocalPlayer(playerPos, true, true, false)
    end

    if wasLucky then
        SetEntityHealth(player, GetEntityMaxHealth(player))
        ClearPedBloodDamage(player)
        SetPlayerSprint(PlayerId(), true)
        TriggerEvent('mythic_hospital:client:RemoveBleed')
        TriggerEvent('mythic_hospital:client:ResetLimbs')
    else

    end

    if h then
        usedHiddenRev = true
    else
        LeaveBed()
    end
end)