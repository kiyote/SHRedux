local FactionTokenManager = {}

local ModuleName = "FactionTokenManager"
local FactionData = require("SHRedux/Data/FactionData")
local InfiniteToken = require("SHRedux/InfiniteToken")
local DecalManager = require("SHRedux/Managers/DecalManager")
local GameTokenData = require("SHRedux/Data/GameTokenData")

local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

function FactionTokenManager.SetupFaction( factionId, zone )
  Log.ModuleTrace( ModuleName, "SetupFaction" )

  FactionTokenManager.CreateTokenArea( factionId, zone )
  FactionTokenManager.CreateShipTokens( factionId, zone )
end

function FactionTokenManager.CreateTokenArea( factionId, zone )
  local zonePosition = zone.getPosition()
  local decalPosition = { zonePosition[1], 1.03, zonePosition[3] + 5 }
  DecalManager.Add(
    Global,
    "tokenboard_" .. factionId,
    "https://steamusercontent-a.akamaihd.net/ugc/1785091954056302941/28C1772A383AFE353A15E3E0756E97A67DC6DB6E/",
    decalPosition,
    { 90, 0, 0 },
    { 10.00, 1.50, 1.00 }
  )

  for _, tokenData in ipairs( GameTokenData.PerPlayer ) do
    InfiniteToken.LayoutPerPersonJson( tokenData, decalPosition, factionId )
  end

  Wait.frames(
    function()
      local startCash = FactionData[ factionId ].start_cash
      local zoffset = 0.30

      startCash = FactionTokenManager.AddStartingCash( "cash25source"..factionId, zonePosition, startCash, 25, zoffset, 0.20 )
      startCash = FactionTokenManager.AddStartingCash( "cash10source"..factionId, zonePosition, startCash, 10, zoffset, 0.40 )
      startCash = FactionTokenManager.AddStartingCash( "cash5source"..factionId, zonePosition, startCash, 5, zoffset, 0.60 )
      startCash = FactionTokenManager.AddStartingCash( "cash2source"..factionId, zonePosition, startCash, 2, zoffset, 0.80 )
      startCash = FactionTokenManager.AddStartingCash( "cash1source"..factionId, zonePosition, startCash, 1, zoffset, 1.00 )
    end,
    5
  )
end

function FactionTokenManager.AddStartingCash( sourceId, position, startCash, amount, zoffset, yincr )
  Log.ModuleTrace( ModuleName, "AddStartingCash" )
  local yoffset = yincr
  while ( startCash >= amount ) do
    local position = { position[1] + 1.19, position[2] + 0.10 + yoffset, position[3] + zoffset }
    InfiniteToken.PutAt( sourceId, position )
    startCash = startCash - amount
    yoffset = yoffset + 0.10
  end

  return startCash
end

function FactionTokenManager.TeardownFaction( factionId, zone )
  Log.ModuleTrace( ModuleName, "TeardownFaction" )

  DecalManager.Remove( Global, "tokenboard_" .. factionId )

  local scale = zone.getScale()
  local hits = Physics.cast( { origin = zone.getPosition(), max_distance = 0.00, direction = { 0, 1, 0 }, type = 3, size = { scale[1], 10.00, scale[3] } } )
  for _, hit in ipairs( hits ) do
    if ( hit.hit_object.hasTag( "cash" ) == true ) then
      destroyObject( hit.hit_object )
    end
  end

  for _, tokenData in ipairs( GameTokenData.PerPlayer ) do
    local objectTag = tokenData.source_id .. factionId
    local object = Util.GetObjectByTag( objectTag )
    destroyObject( object )
  end

  local objects = getObjectsWithTag( "factiontoken" )
  for _, object in ipairs( objects ) do
    if ( object.hasTag( factionId ) ) then
      local objectPosition = object.getPosition()

      local hitList = Physics.cast( { origin = objectPosition, direction = { 0.00, 1.00, 0.00 }, type = 1, max_distance = 1.00 } )
      for _, hit in pairs( hitList ) do
        if ( hit.hit_object.hasTag( "playerboard" ) == false ) then
          destroyObject( hit.hit_object )
        end
      end

      destroyObject( object )
    end
  end
end

function FactionTokenManager.CreateShipTokens( factionId, zone )
  local tokenData = FactionData[ factionId ].tokens

  local scale = zone.getScale()
  local position = zone.getPosition()

  local column = 0
  local columns = 9
  local columnSize = math.floor( scale.x / columns ) + 0.1
  local columnOffset = ( scale.x / 2) - ( columnSize / 2 )
  local row = 0
  local rowOffset = (scale.z / 2 ) + 3

  local index = 1
  for _, data in ipairs( tokenData ) do
      local x = position.x - columnOffset + ( column * columnSize )
      local y = position.z + rowOffset + ( row * 1.1 )
      local tokenPosition = { x, 1.03, y }

      if ( data.has_start ) then
        local start = data.start
        local startPosition = nil
        if (start.type and start.type == "Relative") then
          startPosition = { position[1] + start.position[1], position[2] + start.position[2] + 1.00, position[3] + start.position[3] }
        else
          startPosition = { start.position[1], start.position[2] + 1.00, start.position[3] }
        end

        FactionTokenManager.CreateShipToken( factionId, data, startPosition, start.transfer_tokens )

      else
        FactionTokenManager.CreateShipToken( factionId, data, tokenPosition, 0 )

        column = column + 1
        if ( column >= columns ) then
          column = 0
          row = row + 1
        end
      end
  end
end

function FactionTokenManager.CreateShipToken( factionId, tokenData, tokenPosition, transferCount )
  Log.ModuleTrace( ModuleName, "CreateToken" )

  local token = spawnObject({
    type = "Custom_Tile",
    position = tokenPosition,
    rotation = { 0.00, 180.00, 0.00 },
    scale = { 0.50, 1.00, 0.50 },
    sound = false,
    snap_to_grid = false
  })
  token.setCustomObject({
    image = tokenData.url_front,
    image_bottom = tokenData.url_back,
    type = 3,
    thickness = 0.1,
    stackable = false
  })
  local tokenTags = { factionId, "factiontoken" }
  token.setTags( tokenTags )
  token.setName( tokenData.type .. " - " .. tokenData.name )

  local description = ""
  local hasLab = tokenData.has_lab or false
  if ( hasLab ) then
    description = description .. "Lab"
  end
  local hasProduction = tokenData.has_production or false
  if ( hasProduction ) then
    if ( string.len( description ) > 1 ) then
      description = description .. "\nProduction"
    else
      description = description .. "Production"
    end
  end
  local hasSpectrometer = tokenData.has_spectrometer or false
  if ( hasSpectrometer ) then
    if ( string.len( description ) > 1 ) then
      description = description .. "\nSpectrometer"
    else
      description = description .. "Spectrometer"
    end
  end
  local drones = tokenData.drones or 0
  if ( drones > 0 ) then
    if ( string.len( description ) > 1 ) then
      description = description .. "\nDrones x" .. tostring( drones )
    else
      description = description .. "Drones x" .. tostring( drones )
    end
  end
  if ( string.len( description ) > 0 ) then
    token.setDescription( description )
  else
    token.setDescription( "-" )
  end

  if ( transferCount > 0 ) then
    for i = 1, transferCount, 1 do
      local transferPosition = { tokenPosition[1], tokenPosition[2] + (i * 0.10), tokenPosition[3] }
      InfiniteToken.PutAt( "tokensource_transfer", transferPosition )
    end
  end
end

return FactionTokenManager
