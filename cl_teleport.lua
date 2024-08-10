local teleportLocationValentine = vector3(-167.84, 628.32, 114.03)
local teleportLocationRhodes = vector3(1226.89, -1304.67, 76.9)
local circleLocationValentine = vector3(-174.39, 633.19, 114.09)
local circleLocationRhodes = vector3(1231.48, -1299.65, 76.9)
local isMenuOpen = false
local isPlayerInCircle = false
local currentLocation = nil

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distanceValentine = #(playerCoords - circleLocationValentine)
        local distanceRhodes = #(playerCoords - circleLocationRhodes)

        if distanceValentine < 10.0 then
            DrawMarker(28, circleLocationValentine.x, circleLocationValentine.y, circleLocationValentine.z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.5, 255, 0, 0, 100, false, true, 2, nil, nil, false)
            if distanceValentine < 1.5 then
                if not isMenuOpen then
                    DrawTxt("Pressione [E] para abrir o menu", 0.5, 0.88, 0.5, 0.5, true, 255, 255, 255, 255, true)
                    isPlayerInCircle = true
                    currentLocation = 'valentine'
                end
            else
                isPlayerInCircle = false
            end
        elseif distanceRhodes < 10.0 then
            DrawMarker(28, circleLocationRhodes.x, circleLocationRhodes.y, circleLocationRhodes.z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.5, 255, 0, 0, 100, false, true, 2, nil, nil, false)
            if distanceRhodes < 1.5 then
                if not isMenuOpen then
                    DrawTxt("Pressione [E] para abrir o menu", 0.5, 0.88, 0.5, 0.5, true, 255, 255, 255, 255, true)
                    isPlayerInCircle = true
                    currentLocation = 'rhodes'
                end
            else
                isPlayerInCircle = false
            end
        end

        Citizen.Wait(0)
    end
end)

function DrawTxt(text, x, y, scale, scale2, center, r, g, b, a)
    SetTextScale(scale, scale2)
    SetTextColor(r, g, b, a)
    SetTextCentre(center)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isPlayerInCircle and IsControlJustPressed(0, 0xCEFD9220) then
            SendNUIMessage({action = 'openMenu', location = currentLocation})
            SetNuiFocus(true, true)
            isMenuOpen = true
        end
    end
end)

RegisterNetEvent('west_train:teleportToLocation')
AddEventHandler('west_train:teleportToLocation', function(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'closeMenu'})
    isMenuOpen = false
    cb('ok')
end)

RegisterNUICallback('teleport', function(data, cb)
    TriggerServerEvent('west_train:teleport', data.location)
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'closeMenu'})
    isMenuOpen = false
    cb('ok')
end)
