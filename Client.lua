local firstSpawn = true
AddEventHandler('playerSpawned', function()
    if firstSpawn then
        for _, v in pairs(Config.Buttons) do
            SetDiscordRichPresenceAction(v.index, v.name, v.url)
        end
        firstSpawn = false
    end
end)

local RichAppId = Config.RichAppId
local RichAssetId = Config.RichAssetId

local DiscordAppId = tonumber(GetConvar("RichAppId", RichAppId))
local DiscordAppAsset = GetConvar("RichAssetId", RichAssetId)


local UpdateTime = 1500 -- Set update time (delay between each update) here (ms).

Citizen.CreateThread(function()
	while true do
		local playerName = GetPlayerName(PlayerId())
		local onlinePlayers = 0
		
		for i = 0, 255 do
			if NetworkIsPlayerActive(i) then
				onlinePlayers = onlinePlayers+1
			end
		end
	
		SetDiscordAppId(DiscordAppId)
		
		SetDiscordRichPresenceAsset(DiscordAppAsset)
		
		SetDiscordRichPresenceAssetText(playerName)
		
		SetDiscordRichPresenceAssetSmall(DiscordAppAssetSmall)
		
		SetDiscordRichPresenceAssetSmallText("FiveM")

		SetRichPresence("Online: "..onlinePlayers.."/80")
		
		Citizen.Wait(UpdateTime)
	end
end)