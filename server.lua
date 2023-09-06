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

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterNetEvent("Nolfi-rich:serverGetData")
AddEventHandler("Nolfi-rich:serverGetData", function()
  local source = source
  local user_id = vRP.getUserId({source})
  local max = GetConvar("sv_maxclients", 0)
  local data = {
    id = "Unknown",
    Maxplayers = max,
  }

  if user_id ~= nil then
    data.id = user_id
  end
  
  TriggerClientEvent("Nolfi-rich:clientSetData", source, data)
end)