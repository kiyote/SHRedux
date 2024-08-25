local ZoneManager = {}

local ModuleName = "ZoneManager"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

function ZoneManager.Add( zoneId, zonePosition, zoneScale, zoneTags )
  Log.ModuleTrace( ModuleName, "Add" )

  local zone = Util.GetObjectByTags( { "zone", zoneId } )
  if ( zone == nil ) then
    zone = spawnObject({
      type = "ScriptingTrigger",
      rotation = { 0.00, 0.00, 0.00 },
      position = zonePosition,
      scale = zoneScale,
      sound = false,
      snap_to_grid = false
    })
    local tags = Util.Append( zoneTags, zoneId )
    tags = Util.Append( tags, "zone" )
    zone.SetTags( tags )
  end
end

function ZoneManager.AddHidden( zoneId, zonePosition, zoneScale, zoneTags, colour )
  Log.ModuleTrace( ModuleName, "Add" )

  local zone = Util.GetObjectByTags( { "zone", zoneId } )
  if ( zone == nil ) then
    zone = spawnObject({
      type = "FogOfWarTrigger",
      rotation = { 0.00, 0.00, 0.00 },
      position = zonePosition,
      scale = zoneScale,
      sound = false,
      snap_to_grid = false
    })
    local tags = Util.Append( zoneTags, zoneId )
    tags = Util.Append( tags, "zone" )
    zone.SetTags( tags )
    zone.setValue( colour )
  end
end

function ZoneManager.Remove( zoneId )
  local zone = Util.GetObjectByTags( { "zone", zoneId } )
  destroyObject( zone )
end

return ZoneManager
