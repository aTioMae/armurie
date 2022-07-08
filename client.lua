print("Auteur aTioMae#2385")

-- Premier script donc possible d'avoir des erreurs 
-- si problème envoyer un message à aTioMae#2385 
-- mettre les coordonnées à la ligne 95


ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local function sendNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(true, false)
end


RMenu.Add("armurie", "acceuil", RageUI.CreateMenu("Armurie"," "))


function menuarme()
    if open then 
        open = false 
        RageUI.Visible(RMenu:Get("armurie", "acceuil"),false)
    else
        open = true 
        RageUI.Visible(RMenu:Get("armurie", "acceuil"), true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(RMenu:Get("armurie", "acceuil"), true,true,true,function()

                    RageUI.ButtonWithStyle("~s~→ ~b~Equipement de base", nil, { },true, function(Hovered, Active, Selected)
                        if (Selected) then   
                            TriggerServerEvent('equipementbase')
                        end
                    end)

                    RageUI.ButtonWithStyle("~s~→ ~r~Rendre~r~ les armes de service", nil, { },true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent('finalpolice:arsenalvide')
                        end
                    end)
    

                end, function()end, 1)
                Wait(0)
            end
        end)
    end
end






local armurie = {x =  y = , z = , h = }

Citizen.CreateThread(function()
    local scale = 1.0

    while true do 

        if IsControlJustPressed(0, 96) then
            scale = scale + 0.5
        elseif IsControlJustPressed(0, 97) then
            scale = scale -0.5
        end


        DrawMarker(20, armurie.x,  armurie.y, armurie.z,armurie.h, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)

        Citizen.Wait(1)
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(armurie) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, armurie[k].x, armurie[k].y, armurie[k].z)

            if dist <= 1.0 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then

               RageUI.Text({
                    message = "Appuyez sur [~b~E~w~] pour acceder a ~b~l'armurie",
                    time_display = 1
                })
                if IsControlJustPressed(1,51) then
                    menuarme()
                end
            end
        end
    end
end)


