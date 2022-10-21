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

RegisterNetEvent("MP:tak")
AddEventHandler("MP:tak", function()
    Citizen.Wait(100)
    if a then
        ESX.Game.Teleport(a, GetEntityCoords(PlayerPedId()))
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


    for i = 1, #Config.tp2, 1 do
        RegisterCommand(Config.tp2[i].nameCommand, function(source, args)
            local check = checkperm(Config.tp2[i].perm)
            if check then
                if Config.tp2[i].b == "tp" then
                    if args[1] then
                        local coords = GetEntityCoords(PlayerPedId())
                        ESX.TriggerServerCallback("MP:tp", function(cb)
                            if cb then
                                ESX.ShowNotification("Vous avez bien téléporté le joueur !")
                                a = true
                            else
                                ESX.ShowNotification("L'id n'es pas valide'!")
                            end
                        end, args[1], coords)
                    end
                else
                    if args[1] then
                        ESX.TriggerServerCallback("MP:tpa", function(cb)
                            if cb then
                                a = PlayerPedId()
                                ESX.ShowNotification("Vous vous êtes bien téléporté sur le joueur !")
                            else
                                ESX.ShowNotification("L'id n'es pas valide'!")
                            end
                        end, args[1])
                    end
                end
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        for i = 1, #Config.pos do
            if #(Config.pos[i].coords-GetEntityCoords(PlayerPedId())) < 2 then
                if IsControlJustPressed(0, 51) then
                    show(false, Config.pos[i].num)
                end
            end
        end
        Citizen.Wait(1)
    end
end)
