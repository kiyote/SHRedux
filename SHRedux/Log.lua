-- Trace = 0
-- Debug = 10
-- Normal = 20


local Log = {}

local _level = 0
local _enabled = true
local _modules = { "TerraformValueManager" }

function Append( tbl, val )
  local res = {}
  for _, v in ipairs( tbl ) do
    table.insert( res, v )
  end
  table.insert( res, val )

  return res
end

function Remove( tbl, val )
  local res = {}
  for _, v in ipairs( tbl ) do
    if ( v ~= val ) then
      table.insert( res, v )
    end
  end

  return res
end

function Log.Init( modules )
  logStyle( "trace", { 0.40, 0.40, 0.40 }, "", "" )
  logStyle( "debug", { 0.00, 0.55, 1.00 }, "", "" )
  logStyle( "info", { 1.00, 1.00, 1.00 }, "", "" )
  logStyle( "warning", { 1.00, 0.84, 0.00 }, "", "" )
  logStyle( "error", { 1.00, 0.00, 0.00 }, "", "" )
  logStyle( "mandatory", { 1.00, 1.00, 1.00 }, "", "" )
end

function Log.EnableModule( module )
  Append( _modules, module )
end

function Log.DisableModule( module )
  Remove( _modules, module )
end

function Log.SetEnabled( enabled )
  _enabled = enabled
end

function Log.SetLevel( level )
  _level = level
end

function Log.Trace( message )
  Log.Write( 0, message, "trace" )
end

function Log.ModuleTrace( module, message )
  Log.ModuleWrite( 0, module, message, "trace" )
end

function Log.Debug( message )
  Log.Write( 10, message, "debug" )
end

function Log.Info( message )
  Log.Write( 20, message, "info" )
end

function Log.Warning( message )
  Log.Write( 30, message, "warning" )
end

function Log.Error( message )
  Log.Write( 40, message, "error" )
end

function Log.Mandatory( message )
  Log.Write( 100, message, "mandatory" )
end

function Log.Write( level, message, style )
  if ( _enabled == true ) then
    if ( level >= _level ) then
      log( message, nil, style )
    end
  end
end

function Log.ModuleWrite( level, module, message, style )
  if ( _enabled == true ) then
    if ( level >= _level ) then
      for _, loggingModule in ipairs( _modules ) do
        if ( loggingModule == module ) then
          log( module .. ": " .. message, nil, style )
          return
        end
      end
    end
  end
end

return Log
