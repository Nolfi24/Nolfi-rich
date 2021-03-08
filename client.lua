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

Citizen.CreateThread(function()
	while true do

		local Buttons = {
			{index = 0,name = "Join Server",url = "fivem://connect/94.130.9.144:30120"},
			{index = 1,name = "Discord",url = "https://discord.gg/YtKpN4knnU"}
		}

		local Maxplayers = "500"
			
		local playerName = GetPlayerName(PlayerId())
			
		MySQL.Async.fetchAll('SELECT * FROM user WHERE name = @name', {
		['@name'] = playerName
	        }, function(result)
		   local playFirstname = result[i].firstname
		   local playLastname = result[i].lastname
	        end)

		local onlinePlayers = 0
		for i = 0, 255 do
			if NetworkIsPlayerActive(i) then
				onlinePlayers = onlinePlayers+1
			end
		end

		SetDiscordAppId(816941126232703037)

		SetDiscordRichPresenceAsset('logo')

                SetDiscordRichPresenceAssetText(playerName)

		SetRichPresence("Online: "..onlinePlayers.."/"..Maxplayers.." | Name: "..playFirstname ..playLastname)

		for _, v in pairs(Buttons) do
		SetDiscordRichPresenceAction(v.index, v.name, v.url)
		end
        -- It updates every minute just in case.
		Citizen.Wait(1500)
	end
end)
