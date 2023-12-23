ESX = nil
local PlayerData    = {}
local ox_inventory = exports.ox_inventory

-------------
-- MAGAZYN --
-------------

local storage = {
    id = 'burgerstorage',
    label = 'Hotelowa Szafka',
    slots = 70,
    weight = 100000,
    owner = false,
}

------------------------------------
-- REGISTER STASHY PRZY ODPALANIU --
------------------------------------

AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName() then
        ox_inventory:RegisterStash(storage.id, storage.label, storage.slots, storage.weight, storage.owner)
    end
end)