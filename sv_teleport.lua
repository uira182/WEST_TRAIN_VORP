local vorpCore = {}
TriggerEvent("getCore", function(core)
    vorpCore = core
end)

RegisterNetEvent('west_train:teleport')
AddEventHandler('west_train:teleport', function(location)
    local _source = source
    local User = vorpCore.getUser(_source)
    local Character = User.getUsedCharacter
    local money = Character.money

    local teleportCost = 1.50
    if money >= teleportCost then
        Character.removeCurrency(0, teleportCost)
        TriggerClientEvent('chat:addMessage', _source, {
            args = {"Sistema", "Você foi teletransportado por $"..teleportCost.."."}
        })

        if location == 'valentine' then
            TriggerClientEvent('west_train:teleportToLocation', _source, vector3(-167.84, 628.32, 114.03))
        elseif location == 'rhodes' then
            TriggerClientEvent('west_train:teleportToLocation', _source, vector3(1226.89, -1304.67, 76.9))
        end
    else
        TriggerClientEvent('chat:addMessage', _source, {
            args = {"Sistema", "Você não tem dinheiro suficiente para teletransportar."}
        })
    end
end)
