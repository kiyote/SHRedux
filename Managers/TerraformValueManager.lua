local TerraformValueManager = {}

local ModuleName = "TerraformValueManager"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")
local CounterToken = require("SHRedux/CounterToken")

local Tokens = {}

function TerraformValueManager.Save()
  Log.ModuleTrace( ModuleName, "Save" )

  return Tokens
end

function TerraformValueManager.Load( saveState )
  Log.ModuleTrace( ModuleName, "Load" )

  Tokens = {}
  Tokens[ "terraform_Venus" ] = 0
  Tokens[ "terraform_Mars" ] = 0
  Tokens[ "terraform_Ganymede" ] = 0
  Tokens[ "terraform_Cerea" ] = 0
  Tokens[ "terraform_Callisto" ] = 0
  Tokens[ "terraform_Europa" ] = 0
  Tokens[ "terraform_Titan" ] = 0
  Tokens[ "terraform_Enceladus" ] = 0

  if ( saveState == nil ) then
    Log.Warning( "TerraformValueManager.Load - No save state" )
    return
  end

  for terraformValueId, value in pairs( saveState ) do
    Tokens[ terraformValueId ] = value
    local token = Util.GetObjectByTag( terraformValueId )
    if ( token ~= nil ) then
      TerraformValueManager.SetTokenValue( token, value )
    end
  end
end

function TerraformValueManager.SetTokenValue( token, value )
  Log.ModuleTrace( ModuleName, "SetTokenValue" )

  CounterToken.SetText( token, tostring( value ) )
end

function TerraformValueManager.Modify( token, value )
  Log.ModuleTrace( ModuleName, "Modify" )

  local terraformValueId = Util.FindMatch( Tokens, token.getTags() )
  if ( terraformValueId == nil ) then
    Log.Error( "Unable to locate explore value." )
    return
  end

  local oldValue = Tokens[ terraformValueId ]
  local newValue = oldValue + value
  if ( newValue < 0 ) then
    return oldValue
  elseif ( newValue > 999 ) then
    return oldValue
  end

  Tokens[ terraformValueId ] = newValue
  TerraformValueManager.SetTokenValue( token,  newValue )
  return newValue
end

return TerraformValueManager
