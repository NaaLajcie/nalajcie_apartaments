-- # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
-- #             .-"""-.                                                                                                                         #
-- #            /       \                                                                                                                        #
-- #            \       /                                                                                                                        #
-- #     .-"""-.-`.-.-.<  _                             ______ |\        ___                __        __                                         #
-- #    /      _,-\ O_O-_/ )                            \     \| |____  |   |   _____      |__| ____ |__| ____                                   #
-- #    \     / ,  `   . `|                             /   |    |__  \ |   |   \__  \     |  |/ ___\|  |/ __ \                                  #
-- #     '-..-| \-.,__~ ~ /                            /    |\   |/ __ \_   |___ / __ \_   |  |  \___|  |  ___/_                                 #
-- #           \ `-.__/  /                             \____| \  /____  /______ \____  /\__|  |\___  /__|\___  /                                 #
-- #          / `-.__.-\`-._    ,",                            \/     \/       \/    \/\_____/     \/        \/                                  #
-- #         / /|    ___\-._`-.;  , .----.                                                                                                       #
-- #        ( ( |.-"`   `'\ '-(     -.---'                ___                    __                                        __                    #
-- #         \ \/    {}{}  |   \.__.-'                 __| _/ ____ ___  __ ____ |  |   ____ ______   _____   ____   ____ _/  |_                  #
-- #          \|           /                          / __ |_/ __ \\  \/ // __ \|  |  / __ \\____ \ /     \_/ __ \ /    \\   __\                 #
-- #           \        , /                          / /_/ |\  ___/_\   /\  ___/_  |__  \_\ )  |_\ \  | |  \  ___/_   |  \|  |                   #
-- #           ( __`;-;'__`)                         \____ | \___  / \_/  \___  /____/\____/|   ___/__|_|  /\___  /___|  /|__|                   #
-- #           `//'`   `||`                               \/     \/           \/            |__|         \/     \/     \/                        #
-- #          _//       ||                                                                                                                       #
-- #  .-"-._,(__)     .(__).-""-.                                  Discord: https://discord.gg/xnwsFtgnZs                                        #
-- # /          \    /           \                                 Documentation: https://discord.gg/xnwsFtgnZs                                  #
-- # \          /    \           /                        # Copyright by NaLajcie Development 2022 | Made by NaLajcie#4754                       #
-- #  `'-------`      `--------'`                                                                                                                #
-- #                                                                                                                                             #
-- #                                                                                                                                             #
-- #                                                                                                                                             #
-- # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


ESX = nil
local qtarget = exports.qtarget
local ox_inventory = exports.ox_inventory

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(25)
    end
  end)
  
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
  end)
  
---------------------------------- [ EVENT DO TELEPORTU ] ----------------------------------------
  
  RegisterNetEvent("nalajcie:mieszkania")
  AddEventHandler("nalajcie:mieszkania", function()
  exports['dopeNotify']:gcNotify({         
    text = '<b><i class="fas fa-bell"></i> POWIADOMIENIE</span></b></br><span style="color: #a9a29f;">Wchodzisz do mieszkania',
    type = "info",
    timeout = 3000,
    layout = "topRight"
 })

TriggerServerEvent('InteractSound_SV:PlayOnSource', 'demo', 1)
    local playerPed = PlayerPedId()
    ESX.Game.Teleport(playerPed, {x = -820.9431, y = 3468.1992, z = -159.1531, heading = 337.5074}, function() 
        print('Przeniesiono Do Mieszkania!')
        local playerPed = PlayerPedId()
        Citizen.CreateThread(function()
            SetEntityVisible(playerPed, false)
            while true do
                Citizen.Wait(0)
                SetEntityLocallyVisible(playerPed)
            end
        end)
    end)
end, false)

---------------------------------- [ NOTYFIKACJA ] ----------------------------------------
  RegisterNetEvent("nalajcie:wyjdzmieszkania")
  AddEventHandler("nalajcie:wyjdzmieszkania", function(jd)
  exports['dopeNotify']:gcNotify({           
    text = '<b><i class="fas fa-bell"></i> POWIADOMIENIE</span></b></br><span style="color: #a9a29f;">Wychodzisz z mieszkania',
    type = "info",
    timeout = 3000,
    layout = "topRight"
})

TriggerServerEvent('InteractSound_SV:PlayOnSource', 'demo', 1)
    local playerPed = PlayerPedId()
    ESX.Game.Teleport(playerPed, {x = -271.0116, y =  -957.9396 , z = 31.22, heading = 293.28}, function() ----271.0116, -957.9396, 31.22744
        print('Wyszedles Z Mieszkania!')
        local playerPed = PlayerPedId()
        Citizen.CreateThread(function()
            SetEntityVisible(playerPed, true)
            while true do
                Citizen.Wait(0)
              SetEntityLocallyVisible(playerPed)
            end
        end)
    end)
end, false)

---------------------------------- [ BLIP ] ----------------------------------------
local blips = {
    {title="Mieszkanie", colour=0, id=40, x = -270.48, y = -957.66, z = 31.22}
}      
Citizen.CreateThread(function()
  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


RegisterNetEvent('nalajcie-apartamenty:OpenStorage')
AddEventHandler('nalajcie-apartamenty:OpenStorage', function()
    ox_inventory:openInventory('stash', 'burgerstorage') -- OTWÓRZ SCHOWEK
end)

---------------------------------- [ TARGETY ] ----------------------------------------

exports.qtarget:AddBoxZone("przebieralniamieszkanie", vector3(-816.4, 3469.96, -159.15), 1.4, 1.2, {
	name="przebieralniamieszkanie",
	heading=0,
	debugPoly=false,
  minZ=-161.85,
  maxZ=-157.85,
	}, {
		options = {
			{
				event = "nalajcie-apartamenty:OpenStorage",
				icon = "fas fa-sign-in-alt",
				label = "Otwórz Szafkę",
			},
      {
        event = "fivem-appearance:clothingaspy",
        icon = "fas fa-user-alt", 
        label = "Przebierz się",
      },
      {
        event = "nalajcie:zaprosdodomu",  
        icon = "fas fa-user-alt", 
        label = "Zaproś do mieszkania",
      }
		},
		distance = 3.5
})

exports.qtarget:AddBoxZone("wejsciedomieszkania", vector3(-271.0116, -957.9396, 31.22744), 2, 2, {
  name="wejsciedomieszkania",
  heading = 30,
  debugPoly=false,
  minZ = 29.22744,
  maxZ = 33.22744
  }, {
    options = {
      {
       event = "nalajcie:mieszkania",
       icon = "fas fa-door-open",
       label = "Wejdź do mieszkania"
      }
    },
    distance = 3.0 -- dystans
})

exports.qtarget:AddBoxZone("wyjsciezmieszkania", vector3(-821.49, 3466.93, -159.15), 1, 1.3, {
  name="wyjsciezmieszkania",
  heading=0,
  debugPoly=false,
  minZ=-161.85,
  maxZ=-157.85,
  }, {
    options = {
      {
      event = "nalajcie:wyjdzmieszkania",
      icon = "fas fa-door-closed",
      label = "Wyjdź z mieszkania",
      }
    },
    distance = 3.5
})

    
    

    