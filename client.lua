Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)
local perm = "user"
local checkperm = nil
local a = false

checkperm = function(permission)
    local ok = false
    for i = 1, #permission, 1 do
        if perm == permission[i] then
            ok = true
        end
    end
    if ok == false then
        ESX.ShowNotification("Tu n'a pas les permissions pour effectué cette action !")
    end
    return ok
end

Citizen.CreateThread(function()
    while true do
        ESX.TriggerServerCallback("MP:checkperm", function(cb)
            print(cb)
            if cb then
                perm = cb
            end
        end)
        Citizen.Wait(60000)
    end
end)

RegisterNetEvent("MP:tok")
AddEventHandler("MP:tok", function(coords)
    Citizen.Wait(100)
    if a then
        ESX.Game.Teleport(PlayerPedId(), coords)
        a = false
    else
        ESX.ShowNotification("Mdrrr ça cheat ?")
    end
end)

Citizen.CreateThread(function()
    for i = 1, #Config.tp, 1 do
        RegisterCommand(Config.tp[i].nameCommand, function(source, args)
            local coords = Config.tp[i].pos
            local check = checkperm(Config.tp[i].perm)
            if check then
                if args[1] then
                    ESX.TriggerServerCallback("MP:tp", function(cb)
                        if cb then
                            ESX.ShowNotification("Vous avez bien téléporté le joueur !")
                            a = true
                        else
                            ESX.ShowNotification("L'id n'es pas valide'!")
                        end
                    end, args[1], coords)
                else
                    ESX.Game.Teleport(PlayerPedId(), coords)
                end
            end
        end)
    end
end)
