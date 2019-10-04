local pillboxTeleports = {
    { x = 298.57528686523, y = -599.33715820313, z = 43.292068481445, h = 338.03997802734, destination = 3, range = 2, text = 'Press ~r~[E] ~s~to go to lower Pillbox Entrance' },
    { x = 309.68832397461, y = -602.75939941406, z = 43.291839599609, h = 67.832542419434, destination = 4, range = 2, text = 'Press ~r~[E] ~s~to go to Pillbox roof'},
    { x = 357.58139038086, y = -590.75146484375, z = 28.788959503174, h = 245.51211547852, destination = 1, range = 5, text = 'Press ~r~[E] ~s~to enter Pillbox Hospital' },
    { x = 338.8362121582, y = -583.79595947266, z = 74.165649414063, h = 247.53303527832, destination = 2, range = 2, text = 'Press ~r~[E] ~s~to enter Pillbox Hospital'},
}

function IsNearTeleport()
    local shortest = 100000
    local tpDist = 0
    for _, tp in pairs(pillboxTeleports) do
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply, 0)
        local distance = #(vector3(tp.x, tp.y, tp.z) - plyCoords)
        if distance < (tp.range * 2) then
            DrawMarker(25, tp.x, tp.y, tp.z - 0.99, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 139, 16, 20, 250, false, false, 2, false, false, false, false)
            currentTp = tp
            if GetVehiclePedIsIn(ply, false) == 0 then
                if distance < tp.range then
                    Print3DText(tp, tp.text)
                    tpDist = tp.range
                else
                    tpDist = nil
                end
            else
                tpDist = nil
            end
        end

        if distance < shortest then
            shortest = distance
        end
    end

    return shortest, tpDist
end