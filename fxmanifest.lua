fx_version 'adamant'

game 'gta5'

author 'Nolfi#1989'

description 'Discord rich presence for Fivem | Github.com/Nolfi24'

dependency "vrp"

client_scripts {
    "lib/Tunnel.lua",
    "lib/Proxy.lua",
    "client.lua",
}

server_scripts {
    "lib/Tunnel.lua",
    "@vrp/lib/utils.lua",
    "server.lua",
}