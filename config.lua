--[[
 __   __     ______     __         ______   __    
/\ "-.\ \   /\  __ \   /\ \       /\  ___\ /\ \   
\ \ \-.  \  \ \ \/\ \  \ \ \____  \ \  __\ \ \ \  
 \ \_\\"\_\  \ \_____\  \ \_____\  \ \_\    \ \_\ 
  \/_/ \/_/   \/_____/   \/_____/   \/_/     \/_/ 
-----------------------CREDITS------------------------
-- Copyright 2020-2021 ©Nolfi. All rights reserved  --
------------------------------------------------------
]]--

Config = {}

Config.DiscordAppId = "AppId" -- Your Discord Appid

Config.LogoAsset = "logo" -- The name of the Logo

Config.vRPID = true -- set to false for standalone

Config.WaitTime = 1500

Config.buttons = {
    {
        index = 0,
        name = 'Join Server',
        url = 'fivem://connect/127.0.0.1:30120',
    },
    {
        index = 1,
        name = 'Join Discord',
        url = "https://discord.gg/123",
    },
}