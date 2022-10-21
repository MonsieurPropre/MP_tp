TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("MP:checkperm", function(source, cb)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local perm = xPlayer.getGroup()
    cb(perm)
end)


ESX.RegisterServerCallback("MP:tp", function(source, cb, id, coords)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(id)
    print(coords)
    if xPlayer then
        TriggerClientEvent("MP:tok", id, coords)
        cb(true)
    else
        cb(false)
    end
    
end)


ESX.RegisterServerCallback("MP:tpa", function(source, cb, id)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(id)
    if xPlayer then
        TriggerClientEvent("MP:tak", id)
        cb(true)
    else
        cb(false)
    end
end)