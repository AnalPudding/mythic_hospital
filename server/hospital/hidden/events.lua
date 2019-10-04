RegisterServerEvent('mythic_hospital:server:AttemptHiddenRevive')
AddEventHandler('mythic_hospital:server:AttemptHiddenRevive', function()
    local src = source
    math.randomseed(os.time())
    local luck = math.random(100) < Config.HiddenRevChance

    local totalBill = CalculateBill(GetCharsInjuries(src), Config.HiddenInjuryBase)
    -- YOU NEED TO IMPLEMENT YOUR FRAMEWORKS BILLING HERE

    if luck then
        TriggerClientEvent('mythic_notify:client:SendAlert', { text = 'You\'ve Been Treated & Billed', type = 'inform', style = { ['background-color'] = '#760036' }})
    else
        TriggerClientEvent('chatMessage', src, '', { 0, 0, 0 }, 'You were revived, but there were some complications')
    end

    RecentlyUsedHidden[source] = os.time() + 1800
    TriggerClientEvent('mythic_hospital:client:FinishServices', src, true, luck)
end)