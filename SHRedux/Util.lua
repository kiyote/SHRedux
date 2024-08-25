local Util = {}

local ModuleName = "Util"
local Log = require("SHRedux/Log")

function Util.Contains( array, value )
  Log.ModuleTrace( ModuleName, "Contains" )

  if ( array == nil ) then
    return false
  end

  for _, key in ipairs(array) do
    if ( key == value ) then
      return true
    end
  end

  return false
end

function Util.Length( tbl )
  Log.ModuleTrace( ModuleName, "Util" )

  local count = 0
  for _, _ in pairs( tbl ) do
    count = count + 1
  end

  return count
end

function Util.Append( tbl, val )
  Log.ModuleTrace( ModuleName, "Append" )

  local res = {}
  for _, v in ipairs( tbl ) do
    table.insert( res, v )
  end
  table.insert( res, val )

  return res
end

function Util.Remove( tbl, val )
  Log.ModuleTrace( ModuleName, "Remove" )

  local res = {}
  for _, v in ipairs( tbl ) do
    if ( v ~= val ) then
      table.insert( res, v )
    end
  end

  return res
end

function Util.FindMatch( tbl, arr )
  Log.ModuleTrace( ModuleName, "FindMatch" )

  for index, value in pairs( tbl ) do
    if ( Util.Contains( arr, index ) == true ) then
      return index
    end
  end

  return nil
end

function Util.GetObjectByTag( tag )
  Log.ModuleTrace( ModuleName, "GetObjectByTag" )

  if ( tag == nil ) then
    return nil
  end

  local objects = getObjectsWithTag( tag )
  for _, object in ipairs( objects ) do
    if ( object.hasTag( tag ) ) then
      return object
    end
  end

  return nil
end

function Util.GetObjectByTags( tags )
  Log.ModuleTrace( ModuleName, "GetObjectByTag" )

  local objects = getObjectsWithAllTags( tags )
  for _, object in ipairs( objects ) do
    return object
  end

  return nil
end

return Util
