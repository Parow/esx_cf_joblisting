ESX = nil
Jobs = {}
onmenu = false

Citizen.CreateThread(function()

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.TriggerServerCallback('esx_joblisting:getJobsList', function(data)
        Jobs = data
    end)

    Wait(500)
    AddMenuJobMenu(mainMenu)
    
    if Config.EnableBlips then
        blip = AddBlipForCoord(-265.0, -963.6, 30.2)
        SetBlipSprite(blip, 407)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.9)
        SetBlipColour(blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Pôle Emploi")
        EndTextCommandSetBlipName(blip)
    end

    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, -265.0, -963.6, 30.2)

            if onmenu == false then
                DrawMarker(2, -265.0, -963.6, 31.2, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.8, 0.6, 0.6, 255, 255, 255, 50, true, true, 2, nil, nil, false)
            end
            
            if dist <= 1.2 and onmenu == false then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au ~b~pôle emploi~s~")
            if IsControlJustPressed(1,51) then
                onmenu = true
                mainMenu:Visible(not mainMenu:Visible())
            end
        end
    end
end)
