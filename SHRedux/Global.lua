local Util = require("SHRedux/Util")
local Log = require("SHRedux/Log")
local FactionTokenManager = require("SHRedux/Managers/FactionTokenManager")
local GameSetup = require("SHRedux/GameSetup")
local SetupManager = require("SHRedux/Managers/SetupManager")
local TerraformValueManager = require("SHRedux/Managers/TerraformValueManager")
local ExploreValueManager = require("SHRedux/Managers/ExploreValueManager")
local GameState = require("SHRedux/GameState")
local GameUi = require("SHRedux/GameUi")
local FactionData = require("SHRedux/Data/FactionData")

function API_StartGame()
  GameState.StartGame()
  GameUi.Hide()
  GameSetup.StartGame( GameState.GetFactions() )
end

function API_IncreaseCounter( token )
  ExploreValueManager.Modify( token, 1 )
end

function API_DecreaseCounter( token )
  ExploreValueManager.Modify( token, -1 )
end

function API_IncreaseTerraform( token )
  TerraformValueManager.Modify( token, 1 )
end

function API_DecreaseTerraform( token )
  TerraformValueManager.Modify( token, -1 )
end

function onObjectEnterZone( zone, object )
  if ( GameState.HasStarted() ) then
    return
  end

  if ( Util.Length( object.getZones() ) > 0 ) then
    local factionId = Util.FindMatch( FactionData, object.getTags() )
    if ( zone.hasTag( "playerboard" ) == true ) then
      if ( GameState.HasFaction( factionId ) == false ) then
        GameState.AddFaction( factionId )
        FactionTokenManager.SetupFaction( factionId, zone )
      end
    end
  end
end

function onObjectLeaveZone( zone, object )
  if ( GameState.HasStarted() ) then
    return
  end

  if ( object.hasTag( "playerboard" ) == true ) then
    local factionId = Util.FindMatch( FactionData, object.getTags() )

    if ( GameState.HasFaction( factionId ) == true ) then
      GameState.RemoveFaction( factionId )
      FactionTokenManager.TeardownFaction( factionId, zone )
    end
  end
end

function onLoad( save_state )
  local saveState = JSON.decode( save_state ) or {}

  GameSetup.LayoutTable()
  SetupManager.LayoutTable()

  Wait.frames(
    function()
      GameState.Load( saveState.GameState )
      ExploreValueManager.Load( saveState.ExploreValues )
      TerraformValueManager.Load( saveState.TerraformValues )

      if (GameState.HasStarted() == false) then
        GameUi.Layout()
      end

      Log.Mandatory( "Initialization Complete" )
    end,
    10
  )
end

function onSave()
  local state = {
    GameState = GameState.Save(),
    ExploreValues = ExploreValueManager.Save(),
    TerraformValues = TerraformValueManager.Save()
  }

  local json = JSON.encode( state )
  return json
end
