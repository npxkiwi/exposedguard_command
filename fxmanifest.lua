fx_version 'cerulean'
game 'gta5'

author 'Notepad'
description 'search_player_cheat_leak'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'NotifyConfig.lua',
    'Config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'DiscordConfig.lua',
    'server/*.lua'
}

lua54 'yes'