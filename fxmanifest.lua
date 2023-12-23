fx_version 'adamant'
games { 'gta5' }
lua54 'yes'
author {"XolaX Group Development"}
description {"Skrypt odpowiedzialny za hostowanie mieszkan szafki przebieralnie i teleportowanie"}

client_scripts {
    'client.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua'
}


server_scripts {
    'config.lua',
    'server.lua',
    '@ox_lib/init.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua'
}
