local hospitalCheckin = { x = 308.06161499023, y = -595.19683837891, z = 43.291839599609, h = 180.4409942627 }

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance = #(vector3(hospitalCheckin.x, hospitalCheckin.y, hospitalCheckin.z) - plyCoords)
        if distance < 10 then
            DrawMarker(25, hospitalCheckin.x, hospitalCheckin.y, hospitalCheckin.z - 0.99, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 139, 16, 20, 250, false, false, 2, false, false, false, false)

            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                if distance < 3 then
                    Print3DText(hospitalCheckin, 'Press ~r~[E] ~s~To Check In')
                    if IsControlJustReleased(0, 54) then
                        if (GetEntityHealth(PlayerPedId()) < 200) or (IsInjuredOrBleeding()) then
                            exports['mythic_base']:FetchComponent('Progress'):ProgressWithStartEvent({
                                name = "hospital_action",
                                duration = 2500,
                                label = 'Checking In',
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "missheistdockssetup1clipboard@base",
                                    anim = "base",
                                    flags = 49,
                                },
                                prop = {
                                    model = "p_amb_clipboard_01",
                                    bone = 18905,
                                    coords = { x = 0.10, y = 0.02, z = 0.08 },
                                    rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                },
                                propTwo = {
                                    model = "prop_pencil_01",
                                    bone = 58866,
                                    coords = { x = 0.12, y = 0.0, z = 0.001 },
                                    rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                },
                            }, function()
                                isInHospitalBed = true
                            end, function(status)
                                if not status then
                                    TriggerServerEvent('mythic_hospital:server:RequestBed')
                                else
                                    isInHospitalBed = false
                                end
                            end)
                        else
                            exports['mythic_notify']:DoHudText('error', 'You do not need medical attention')
                        end
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local short, dist = IsNearTeleport()
        if dist ~= nil and currentTp ~= nil then
            local player = PlayerPedId()
            if IsControlJustReleased(1,51) then
                if not IsPedInAnyVehicle(player, true) then
                    DoScreenFadeOut(500)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(10)
                    end
            
                    SetEntityCoords(player, pillboxTeleports[currentTp.destination].x, pillboxTeleports[currentTp.destination].y, pillboxTeleports[currentTp.destination].z, 0, 0, 0, false)
                    SetEntityHeading(player, pillboxTeleports[currentTp.destination].h)
            
                    Citizen.Wait(100)
            
                    DoScreenFadeIn(1000)
                end
            end

            Citizen.Wait(1)
        elseif short < 25 then
            Citizen.Wait(5)
        else
            Citizen.Wait(30 * short)
        end
    end
end)