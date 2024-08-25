local PlayerSetup = {}

local ModuleName = "PlayerSetup"
local Log = require("SHRedux/Log")
local DecalManager = require("SHRedux/Managers/DecalManager")
local SnapManager = require("SHRedux/Managers/SnapManager")
local ZoneManager = require("SHRedux/Managers/ZoneManager")
local Util = require("SHRedux/Util")

function PlayerSetup.LayoutPlayers()
  Log.ModuleTrace( ModuleName, "LayoutPlayers" )

  local colours = Player.getAvailableColors()
  for _, colour in ipairs( colours ) do
    PlayerSetup.LayoutSeat( colour )
  end
end

function PlayerSetup.StartGame()
  Log.ModuleTrace( ModuleName, "StartGame" )

  local colours = Player.getAvailableColors()
  for _, colour in ipairs(colours) do
    PlayerSetup.RemoveSeat( colour )
  end

  local players = Player.getPlayers()
  for _, player in ipairs( players ) do
    colours = Util.Remove( colours, player.color )
  end

  for _, colour in ipairs( colours ) do
    local hiddenId = "hiddenzone_" .. tostring( colour )
    ZoneManager.Remove( hiddenId )
  end

end

function PlayerSetup.LayoutSeat( colour )
  Log.ModuleTrace( ModuleName, "LayoutSeat")

  local hand = Player[ colour ].getPlayerHand()
  local layoutPosition = { hand.pos_x, 1.0, hand.pos_z + ( 7.5 * hand.trigger_forward_z ) }

  -- Create the playerboard dropzone decal
  local areaId = "setupzone_" .. tostring(colour)
  local url = "https://steamusercontent-a.akamaihd.net/ugc/1785091452718720103/7C5A2A13EF76D2C2488E0E5624FB282A3B07B8C9/"
  DecalManager.Add( Global, areaId, url, layoutPosition, { 90.00, 0.00, 0.00 }, { 10.00, 7.50, 1.00 } )

  -- Add the zone and snap for spawning the player tokens
  local tags = { "playerboard" }
  SnapManager.Add( Global, areaId, layoutPosition, tags, { 0.00, 180.00, 0.00 } );
  ZoneManager.Add( areaId, layoutPosition, { 10.00, 1.00, 7.500 }, tags )

  local hiddenId = "hiddenzone_" .. tostring( colour )
  ZoneManager.AddHidden( hiddenId, { hand.pos_x, 1.00, hand.pos_z + 3.50 }, { 10.00, 0.10, 1.00 }, { "token_mission" }, colour )
end

function PlayerSetup.RemoveSeat( colour )
  local areaId = "setupzone_" .. tostring(colour)
  DecalManager.Remove( Global, areaId )
  SnapManager.Remove( Global, areaId )
  ZoneManager.Remove( areaId )
end

return PlayerSetup
