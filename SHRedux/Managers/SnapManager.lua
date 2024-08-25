local SnapManager = {}

local ModuleName = "SnapManager"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

function SnapManager.Exists( owner, snapId )
  Log.ModuleTrace( ModuleName, "IndexOf" )

  local snaps = owner.getSnapPoints() or {}
  for index, snap in pairs( snaps ) do
    local tags = snap.tags
    for index, tag in ipairs( tags ) do
      if ( tag == snapId ) then
        return true
      end
    end
  end

  return false
end

function SnapManager.Remove( owner, snapId )
  Log.ModuleTrace( ModuleName, "Remove" )

  local snaps = owner.getSnapPoints() or {}
  local foundAt = -1
  for index, snap in ipairs( snaps ) do
    if ( Util.Contains( snap.tags, snapId ) == true ) then
      foundAt = index
    end
  end

  if (foundAt ~= -1) then
    table.remove( snaps, foundAt )
    owner.setSnapPoints( snaps )
  end
end

function SnapManager.Add( owner, snapId, snapPosition, snapTags, snapRotation )
  Log.ModuleTrace( ModuleName, "Add" )

  local snaps = owner.getSnapPoints() or {}
  local foundAt = -1
  for index, snap in ipairs( snaps ) do
    if ( Util.Contains( snap.tags, snapId ) == true ) then
      foundAt = index
    end
  end

  if (foundAt ~= -1) then
    return
  end

  local newTags = Util.Append( snapTags, snapId )
  local snap = { position = snapPosition, tags = newTags, rotation = snapRotation, rotation_snap = (snapRotation ~= nil) }
  table.insert( snaps, snap )

  owner.setSnapPoints( snaps )
end

return SnapManager
