local PlayerInjuries = {}

function GetCharsInjuries(source)
    return PlayerInjuries[source]
end

Citizen.CreateThread(function()
    exports['mythic_chat']:AddAdminChatCommand('kill', function(source, args, rawCommand)
        TriggerClientEvent('mythic_hospital:client:Kill', source)
    end, {
        help = 'Die, Bitch',
    }, 0)
end)

RegisterServerEvent('mythic_hospital:server:SyncInjuries')
AddEventHandler('mythic_hospital:server:SyncInjuries', function(data)
    PlayerInjuries[source] = data
end)