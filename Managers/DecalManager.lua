local DecalManager = {
}

local ModuleName = "DecalManager"
local Log = require("SHRedux/Log")

function DecalManager.Add( owner, id, url, position, rotation, scale )
  Log.ModuleTrace( ModuleName, "Add" )

  local decal = {
    name             =  id,
    url              =  url,
    position         =  position,
    rotation         =  rotation,
    scale            =  scale
  }

  local decals = owner.getDecals() or {}
  local foundAt = -1
  for index, decal in ipairs(decals) do
    if ( decal.name == id ) then
      foundAt = index
    end
  end
  if (foundAt ~= -1) then
    table.remove( decals, foundAt )
  end

  table.insert( decals, decal )
  owner.setDecals( decals )
end

function DecalManager.Remove( owner, name )
  Log.ModuleTrace( ModuleName, "Remove" )

  local decals = owner.getDecals() or {}
  local foundAt = -1
  for index, decal in ipairs( decals ) do
    if ( decal.name == name ) then
      foundAt = index
    end
  end
  if (foundAt >= 0) then
    table.remove( decals, foundAt )
  end
  owner.setDecals( decals )
end

return DecalManager
