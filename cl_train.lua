local locations = {
    valentine = {
        name = "valentine",
        teleportCoords = vector3(-167.84, 628.32, 114.03),
        circleCoords = vector3(-174.39, 633.19, 114.09)
    },
    rhodes = {
        name = "rhodes",
        teleportCoords = vector3(1226.89, -1304.67, 76.9),
        circleCoords = vector3(1231.48, -1299.65, 76.9)
    }
}

local isMenuOpen = false
local isPlayerInCircle = false
local currentLocation = nil

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for locationName, location in pairs(locations) do
            local distance = #(playerCoords - location.circleCoords)
            if distance < 10.0 then
                DrawMarker(28, location.circleCoords.x, location.circleCoords.y, location.circleCoords.z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.5, 255, 0, 0, 100, false, true, 2, nil, nil, false)
                if distance < 1.5 then
                    if not isMenuOpen then
                        DrawTxt("Pressione [E] para abrir o menu", 0.5, 0.88, 0.5, 0.5, true, 255, 255, 255, 255, true)
                        isPlayerInCircle = true
                        currentLocation = locationName
                    end
                else
                    isPlayerInCircle = false
                end
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

RegisterNetEvent('west_train:playTrainVideo')
AddEventHandler('west_train:playTrainVideo', function(location)
    -- Envia mensagem para NUI para reproduzir o vídeo do YouTube
    SendNUIMessage({
        action = "playYouTubeVideo",
        videoUrl = "okbCuUJ_dKY"
    })

    -- Aguarda 10 segundos
    Citizen.Wait(10000)

    -- Esconde o vídeo e teletransporta o jogador
    SendNUIMessage({action = "hideVideo"})
    TriggerServerEvent('west_train:teleport', location)
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'closeMenu'})
    isMenuOpen = false
    cb('ok')
end)

RegisterNUICallback('teleport', function(data, cb)
    -- Reproduz o vídeo antes de teletransportar
    TriggerEvent('west_train:playTrainVideo', data.location)
    SetNuiFocus(false, false)
    SendNUIMessage({action = 'closeMenu'})
    isMenuOpen = false
    cb('ok')
end)
