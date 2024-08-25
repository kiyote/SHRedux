local GameState = {}

local ModuleName = "GameState"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

local GameStarted = false
local Factions = {}

function GameState.Load( saveState )
  Log.ModuleTrace( ModuleName, "Load" )

  if ( saveState ~= nil ) then
    GameStarted = saveState.game_started
    Factions = saveState.factions
  end
end

function GameState.HasStarted()
  return GameStarted
end

function GameState.StartGame()
  GameStarted = true
end

function GameState.GetFactions()
  return Factions
end

function GameState.HasFaction( factionId )
  if (Factions == nil) then
    Log.Debug( "Factions is nil")
  end
  return Util.Contains( Factions, factionId )
end

function GameState.AddFaction( factionId )
  Log.ModuleTrace( ModuleName, "AddFaction" )

  Factions = Util.Append( Factions, factionId )
end

function GameState.RemoveFaction( factionId )
  Log.ModuleTrace( ModuleName, "RemoveFaction" )

  Factions = Util.Remove( Factions, factionId )
end

function GameState.Save()
  Log.ModuleTrace( ModuleName, "Save" )

  return {
    game_started = GameStarted,
    factions = Factions
  }
end

return GameState
