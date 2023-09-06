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
		TriggerServerEvent("Nolfi-rich:serverGetData")
		Citizen.Wait(Config.WaitTime)
	end
end)

local function getLocation()
  local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
  local StreetHash = GetStreetNameAtCoord(x, y, z)

  if StreetHash ~= nil then
    StreetName = GetStreetNameFromHashKey(StreetHash)
    if IsPedOnFoot(PlayerPedId()) and not IsEntityInWater(PlayerPedId()) then
        if not IsEntityInArea(PlayerPedId(),2631.851,2572.982,45.096,-2449.445,711.613,264.987,false,false,0) then
        if IsPedSprinting(PlayerPedId()) then
        return ("Sprinter ned af "..StreetName)
      elseif IsPedRunning(PlayerPedId()) then
        return ("Løber ned af "..StreetName)
      elseif IsPedWalking(PlayerPedId()) then
        return ("Går ned af "..StreetName)
      elseif IsPedStill(PlayerPedId()) then
        return ("Står på "..StreetName)
      end
      else
      if IsPedRunning(PlayerPedId()) or GetEntitySpeed(PlayerPedId()) > 2.0 then
        return ("Løber bange rundt på "..StreetName)
      elseif not IsPedRunning(PlayerPedId()) and GetEntitySpeed(PlayerPedId()) > 1.0 and GetEntitySpeed(PlayerPedId()) < 2.0 then
        return ("Søger rundt alene på "..StreetName)
      else
        return ("Slapper af på "..StreetName)
      end
      end
    elseif IsPedInAnyVehicle(PlayerPedId(), false) and not IsPedInAnyHeli(PlayerPedId()) and not IsPedInAnyPlane(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) and not IsPedInAnySub(PlayerPedId()) and not IsPedInAnyBoat(PlayerPedId()) then
      local MPH = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 2.23693629205)
      local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
      if MPH > 50 and not IsPedOnAnyBike(PlayerPedId()) then
        return ("Blæser ned "..StreetName)
      elseif MPH <= 50 and MPH > 0  then
        return ("Cruiser ned af "..StreetName)
      elseif MPH == 0 then
        return ("Holder parkeret på "..StreetName)
      elseif MPH > 50 and IsPedOnAnyBike(PlayerPedId()) then
        return ("Kører rundt i nærheden af "..StreetName)
      end
    elseif IsPedInAnyHeli(PlayerPedId()) or IsPedInAnyPlane(PlayerPedId()) then
      local KT = math.ceil(GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId())) * 1.9438444924406046)
      local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
      if IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) and GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) > 25.0 and KT>90 then
        return ("Flyver over "..StreetName.." i en "..VehName)
      elseif IsEntityInAir(GetVehiclePedIsUsing(PlayerPedId())) and GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) <= 25.0 and KT < 90 and KT>40 and GetLandingGearState(GetVehiclePedIsIn(PlayerPedId(), false)) == 0 then
        return ("Lander ved "..StreetName.." i en "..VehName)
      elseif GetEntityHeightAboveGround(GetVehiclePedIsUsing(PlayerPedId())) <= 25.0 and KT >= 90 and KT < 120 and GetLandingGearState(GetVehiclePedIsIn(PlayerPedId())) == 0 then
        return ("Igang med take off ved "..StreetName.." i en "..VehName)
      else
        return ("Landede ved "..StreetName.." i en "..VehName)
      end
    elseif IsEntityInWater(PlayerPedId()) then
      return ("Svømmer rundt")
    elseif IsPedInAnyBoat(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
      local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(PlayerPedId()))))
      return ("Sejler rundt med en "..VehName)
    elseif IsPedInAnySub(PlayerPedId()) and IsEntityInWater(GetVehiclePedIsUsing(PlayerPedId())) then
      return ("Trækker vejret under vand")
    end
      return "Sætter sig i køretøj"
  end
end

RegisterNetEvent("Nolfi-rich:clientSetData")
AddEventHandler("Nolfi-rich:clientSetData", function(data)
  local Buttons = (Config.buttons)
  local Maxplayers = data.Maxplayers
  local playerName = GetPlayerName(PlayerId())
  local onlinePlayers = #GetActivePlayers()
  local location = getLocation()
  local _id = nil

  if Config.vRPID then 
	  _id = data.id
  else
	  _id = GetPlayerServerId(PlayerId())
  end

  SetDiscordAppId(Config.DiscordAppId)
  SetDiscordRichPresenceAsset(Config.LogoAsset)
  SetDiscordRichPresenceAssetText("ID: ".._id.." | "..playerName)
  SetRichPresence("Online: "..onlinePlayers.."/"..Maxplayers.." | "..location)
  
  for _, v in pairs(Buttons) do
    SetDiscordRichPresenceAction(v.index, v.name, v.url)
  end
end)