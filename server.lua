ESX = nil

RegisterNetEvent('equipementbase')
AddEventHandler('equipementbase', function()
    local _source = source                                                                       
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addWeapon('WEAPON_NIGHTSTICK', Config.amountAmmo)
    xPlayer.addWeapon('WEAPON_STUNGUN', Config.amountAmmo)
    xPlayer.addWeapon('WEAPON_FLASHLIGHT', Config.amountAmmo)
    TriggerClientEvent('esx:showNotification', source, "Vous avez reçu votre ~b~équipement de base")
end)


-------------------

RegisterNetEvent('finalpolice:arsenalvide')
AddEventHandler('finalpolice:arsenalvide', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    for k,v in pairs(Config.armurerie) do
        xPlayer.removeWeapon(string.upper(v.arme))
    end
    xPlayer.removeWeapon('WEAPON_NIGHTSTICK')
    xPlayer.removeWeapon('WEAPON_STUNGUN')
    xPlayer.removeWeapon('WEAPON_FLASHLIGHT')
    TriggerClientEvent('esx:showNotification', source, "Vous avez posé tous vos armes")
end)
