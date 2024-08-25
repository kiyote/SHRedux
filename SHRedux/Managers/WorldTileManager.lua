local WorldTileManager = {}

local ModuleName = "WorldTileManager"
local WorldTileData = require("SHRedux/Data/WorldTileData")
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

function WorldTileManager.GetBagId()
  return "worldtile_Bag"
end

function WorldTileManager.GetWorldTileId( tileName, copyNumber )
  return "worldtile_" .. tileName .. "_" .. tostring( copyNumber )
end

function WorldTileManager.CreateWorldTile( tileName, tileData, copyNumber, bag )
  Log.ModuleTrace( ModuleName, "CreateWorldTile" )

  local bagPosition = bag.getPosition()

  local worldTileId = WorldTileManager.GetWorldTileId( tileName, copyNumber )
  tile = spawnObject({
    type = "Custom_Token",
    position = { bagPosition[1], bagPosition[2], bagPosition[3] - 2.00 },
    rotation = { 0.00, 180.00, 0.00 },
    scale = { 0.40, 1.00, 0.40 },
    sound = false,
    snap_to_grid = false,
    callback_function =
    function( spawnedTile )
      bag.putObject( spawnedTile )
    end
  })
  tile.setCustomObject({
    image = tileData.url,
    thickness = 0.1,
    merge_distance = 15.0,
    stackable = false
  })
  local tags = Util.Append( tileData.tags, worldTileId )
  tile.setTags( tags )
  tile.setName( tileData.name )
  tile.setDescription( tileData.ability.description )

  return tile
end

function WorldTileManager.WorldTileExists( worldTileId )
  Log.ModuleTrace( ModuleName, "WorldTileExists" )

  local tile = Util.GetObjectByTag( worldTileId )

  return ( tile ~= nil )
end

function WorldTileManager.CreateWorldTiles( bagId )
  Log.ModuleTrace( ModuleName, "CreateWorldTiles" )

  local bag = Util.GetObjectByTag( bagId )
  local waitFrames = 1
  for name, data in pairs( WorldTileData ) do
    for copyCount = 1, data.count do
      local worldTileId = WorldTileManager.GetWorldTileId( name, copyCount )
      if ( WorldTileManager.WorldTileExists( worldTileId ) == false ) then
        Wait.frames(
          function()
            local tile = WorldTileManager.CreateWorldTile( name, data, copyCount, bag )
          end,
          waitFrames
        )
        waitFrames = waitFrames + 1
      end
    end
  end
end

function WorldTileManager.GetOrCreateBag()
  Log.ModuleTrace( ModuleName, "GetOrCreateBag" )

  local bagId = WorldTileManager.GetBagId()
  local bag = Util.GetObjectByTag( bagId )


  if (bag == nil) then
    local bagPosition = { 66.00, 0.80, -9.50 }

    bag = spawnObject({
      type = "Bag",
      position = bagPosition,
      rotation = { 0.00, 0.00, 0.00 },
      scale = { 1.00, 1.00, 1.00 },
      sound = false,
      snap_to_grid = false,
      callback_function =
        function()
            WorldTileManager.CreateWorldTiles( bagId )
        end
    })
    bag.setName( "World Tiles" )
    bag.setTags( { bagId } )
    bag.setColorTint( Color.Black )
    bag.setLock( true )
  end

  return bagId
end

function WorldTileManager.LayoutTable()
  Log.ModuleTrace( ModuleName, "LayoutTable" )

  WorldTileManager.GetOrCreateBag()
end

return WorldTileManager
