RegisterNetEvent('mythic_hospital:client:SyncLimbs')
AddEventHandler('mythic_hospital:client:SyncLimbs', function(limbs)
    BodyParts = limbs

	injured = {}
    for k, v in pairs(BodyParts) do
        if v.isDamaged then
            table.insert(injured, {
                part = k,
                label = v.label,
                severity = v.severity
            })
        end
    end

    DoLimbAlert()
end)

RegisterNetEvent('mythic_hospital:client:SyncBleed')
AddEventHandler('mythic_hospital:client:SyncBleed', function(bleedStatus)
    isBleeding = tonumber(bleedStatus)
    DoBleedAlert()
end)

RegisterNetEvent('mythic_hospital:client:FieldTreatLimbs')
AddEventHandler('mythic_hospital:client:FieldTreatLimbs', function()
    for k, v in pairs(BodyParts) do
        v.isDamaged = false
        v.severity = 1
    end

    for k, v in pairs(injured) do
        if v.part == Config.Bones[bone] then
            v.severity = BodyParts[Config.Bones[bone]].severity
        end
    end

    TriggerServerEvent('mythic_hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    ProcessRunStuff(PlayerPedId())
    DoLimbAlert()
end)
RegisterNetEvent('mythic_hospital:client:FieldTreatBleed')
AddEventHandler('mythic_hospital:client:FieldTreatBleed', function()
    if isBleeding > 1 then
        isBleeding = tonumber(isBleeding) - 1

        TriggerServerEvent('mythic_hospital:server:SyncInjuries', {
            limbs = BodyParts,
            isBleeding = tonumber(isBleeding)
        })

        ProcessRunStuff(PlayerPedId())
        DoBleedAlert()
    end
end)

RegisterNetEvent('mythic_hospital:client:ReduceBleed')
AddEventHandler('mythic_hospital:client:ReduceBleed', function()
    if isBleeding > 0 then
        isBleeding = tonumber(isBleeding) - 1

        TriggerServerEvent('mythic_hospital:server:SyncInjuries', {
            limbs = BodyParts,
            isBleeding = tonumber(isBleeding)
        })

        ProcessRunStuff(PlayerPedId())
        DoBleedAlert()
    end
end)


RegisterNetEvent('mythic_hospital:client:ResetLimbs')
AddEventHandler('mythic_hospital:client:ResetLimbs', function()
    injured = {}

    for k, v in pairs(BodyParts) do
        v.isDamaged = false
        v.severity = 0
    end
    TriggerServerEvent('mythic_hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    ProcessRunStuff(PlayerPedId())
    DoLimbAlert()
end)

RegisterNetEvent('mythic_hospital:client:RemoveBleed')
AddEventHandler('mythic_hospital:client:RemoveBleed', function()
    isBleeding = 0

    TriggerServerEvent('mythic_hospital:server:SyncInjuries', {
        limbs = BodyParts,
        isBleeding = tonumber(isBleeding)
    })

    ProcessRunStuff(PlayerPedId())
    DoBleedAlert()
end)

RegisterNetEvent('mythic_hospital:client:UsePainKiller')
AddEventHandler('mythic_hospital:client:UsePainKiller', function(tier)
    if tier < 10 then
        onPainKiller = 90 * tier
    end

<<<<<<< Updated upstream
    exports['mythic_notify']:DoCustomHudText('inform', 'You feel the pain subside temporarily', 5000)
=======
    exports['mythic_notify']:SendAlert('inform', 'You feel the pain subside temporarily', 5000)
>>>>>>> Stashed changes
    ProcessRunStuff(PlayerPedId())
end)

RegisterNetEvent('mythic_hospital:client:UseAdrenaline')
AddEventHandler('mythic_hospital:client:UseAdrenaline', function(tier)
    if tier < 10 then
        onDrugs = 180 * tier
    end

<<<<<<< Updated upstream
    exports['mythic_notify']:DoCustomHudText('inform', 'You\'re Able To Ignore Your Body Failing', 5000)
=======
    exports['mythic_notify']:SendAlert('inform', 'You\'re Able To Ignore Your Body Failing', 5000)
>>>>>>> Stashed changes
    ProcessRunStuff(PlayerPedId())
end)

--[[ Player Died Events ]]--
<<<<<<< Updated upstream
RegisterNetEvent('baseevents:onPlayerKilled')
=======
--[[RegisterNetEvent('baseevents:onPlayerKilled')
>>>>>>> Stashed changes
AddEventHandler('baseevents:onPlayerKilled', function(killedBy, data)
    ResetAll()
end)

RegisterNetEvent('baseevents:onPlayerDied')
AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos)
    ResetAll()
<<<<<<< Updated upstream
end)
=======
end)]]
>>>>>>> Stashed changes
