local ExploreValueManager = {}

local ModuleName = "ExploreValueManager"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")
local CounterToken = require("SHRedux/CounterToken")

local TokenUrls = {
  ["Biology"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084844834/7376569FCE519347B3794A6FD7D01C5409349506/",
  ["Physics"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242085093927/9D51578D43A8C78D3450E22A89DEB2C0371F1507/",
  ["Engineering"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242085093189/ECA620E70F85158CE7676426D913216493750454/",
  ["Research"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091452718904210/8E099FD7B0FCCE7D79AEE106BED2C6F890F1452A/"
}

local Colours = {
  ["Physics"] = Color( 0.73, 0.89, 0.96 ),
  ["Biology"] = Color( 0.67, 0.78, 0.52 ),
  ["Engineering"] = Color( 0.33, 0.33, 0.33 ),
  ["Research"] = Color( 0.99, 0.94, 0.86 )
}

local Script = [[
local Script = {}

function Script.IncreaseCounter()
  Global.call( "API_IncreaseCounter", self )
end

function Script.DecreaseCounter()
  Global.call( "API_DecreaseCounter", self )
end

function onLoad( state )
  self.addContextMenuItem( "Increase", Script.IncreaseCounter )
  self.addContextMenuItem( "Decrease", Script.DecreaseCounter )
end

return Script
]]

local Tokens = {}

function ExploreValueManager.Save()
  Log.ModuleTrace( ModuleName, "Save" )

  return Tokens
end

function ExploreValueManager.Load( saveState )
  Log.ModuleTrace( ModuleName, "Load" )

  if ( saveState == nil ) then
    Log.Warning( "ExploreValueManager.Load - No save state" )
    return
  end

  for exploreValueId, data in pairs( saveState ) do
    Tokens[exploreValueId] = data
    local token = Util.GetObjectByTag( exploreValueId )
    if ( token ~= nil ) then
      ExploreValueManager.SetTokenValue( token, data.type, data.value )
    end
  end
end

function ExploreValueManager.FormatName( researchType, value )
  Log.ModuleTrace( ModuleName, "FormatName" )

  return researchType .. " - " .. tostring( value )
end

function ExploreValueManager.SetTokenValue( token, researchType, value )
  Log.ModuleTrace( ModuleName, "SetTokenValue" )

  CounterToken.SetText( token, tostring( value ) )
  local name = ExploreValueManager.FormatName( researchType, value )
  token.setName( name )
end

function ExploreValueManager.SetupToken( planet, explorevalue )
  Log.ModuleTrace( ModuleName, "SetupToken" )

  local exploreValueId = "explorevalue_" .. planet
  local token = CounterToken.Layout(
    exploreValueId,
    explorevalue.position,
    explorevalue.rotation,
    TokenUrls[ explorevalue.type ],
    Colours[ explorevalue.type ],
    {},
    Script,
    false,
    0
  )
  if (token ~= nil) then
    ExploreValueManager.SetTokenValue( token, explorevalue.type, explorevalue.value )
  end

  Tokens[exploreValueId] = { value = explorevalue.value, type = explorevalue.type }

  return exploreValueId
end

function ExploreValueManager.Modify( token, value )
  Log.ModuleTrace( ModuleName, "Modify" )

  local exploreValueId = Util.FindMatch( Tokens, token.getTags() )
  if ( exploreValueId == nil ) then
    Log.Error( "Unable to locate explore value." )
    return
  end

  local oldValue = Tokens[ exploreValueId ].value
  local newValue = oldValue + value
  if ( newValue < 0 ) then
    return oldValue
  elseif ( newValue > 999 ) then
    return oldValue
  end

  Tokens[ exploreValueId ].value = newValue
  ExploreValueManager.SetTokenValue( token,  Tokens[ exploreValueId ].type, newValue )
  return newValue
end


return ExploreValueManager
