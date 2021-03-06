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


vRP = Proxy.getInterface("vRP")
Nolfi = Tunnel.getInterface("nolfigetplayerid",Nolfi)

Citizen.CreateThread(function()
	while true do

		local Buttons = {
			{index = 0,name = "Join Server",url = "fivem://connect/94.130.9.144:30120"}
			{index = 1,name = "Discord",url = "https://discord.gg/YtKpN4knnU"},
		}

		local Maxplayers = "64"

		local playerName = GetPlayerName(PlayerId())

		local playerid = Nolfi.getPlayerID()

		local onlinePlayers = 0
		for i = 0, 255 do
			if NetworkIsPlayerActive(i) then
				onlinePlayers = onlinePlayers+1
			end
		end

		SetDiscordAppId(816941126232703037)

		SetDiscordRichPresenceAsset('logo')

        SetDiscordRichPresenceAssetText(playerName)

		SetRichPresence("Online: "..onlinePlayers.."/"..Maxplayers.." | ID: "..playerid)

		for _, v in pairs(Buttons) do
		SetDiscordRichPresenceAction(v.index, v.name, v.url)
		end
        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)