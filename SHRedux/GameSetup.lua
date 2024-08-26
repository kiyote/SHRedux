local GameSetup = {}

local ModuleName = "GameSetup"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")
local PlanetData = require("SHRedux/Data/PlanetData")
local ExploreValueManager = require("SHRedux/Managers/ExploreValueManager")
local WorldTagDescriptions = require("SHRedux/Data/WorldTagDescriptions")
local MoonData = require("SHRedux/Data/MoonData")
local DecalManager = require("SHRedux/Managers/DecalManager")
local GameTokenData = require("SHRedux/Data/GameTokenData")
local InfiniteToken = require("SHRedux/InfiniteToken")
local FactionData = require("SHRedux/Data/FactionData")
local PlayerSetup = require("SHRedux/PlayerSetup")
local TechnologyData = require("SHRedux/Data/TechnologyData")
local PolicyData = require("SHRedux/Data/PolicyData")
local SnapManager = require("SHRedux/Managers/SnapManager")
local CounterToken = require("SHRedux/CounterToken")
local MissionData = require("SHRedux/Data/MissionData")

local TerraformScript = [[
local Script = {}

function Script.IncreaseTerraform()
  Global.call( "API_IncreaseTerraform", self )
end

function Script.DecreaseTerraform()
  Global.call( "API_DecreaseTerraform", self )
end

function onLoad( state )
  self.addContextMenuItem( "Increase", Script.IncreaseTerraform )
  self.addContextMenuItem( "Decrease", Script.DecreaseTerraform )
end

return Script
]]


local TurnBoardInitiativeSnaps = { -2.43, -1.60, -0.80, 0.00, 0.83, 1.65, 2.45 }
local FactionOrder = {
  "faction_NorthAmerica",
  "faction_Russia",
  "faction_Europe",
  "faction_China",
  "faction_Asia",
  "faction_Japan",
  "faction_SouthAmericaAfrica"
}

local Colours = {
  ["bag_Physics"] = Color( 0.73, 0.89, 0.96 ),
  ["bag_Biology"] = Color( 0.67, 0.78, 0.52 ),
  ["bag_Engineering"] = Color( 0.66, 0.66, 0.66 )
}

function GameSetup.LayoutTable()
  Log.ModuleTrace( ModuleName, "LayoutTable" )

  GameSetup.LayoutTurnBoard()
  GameSetup.LayoutWorlds()
  GameSetup.LayoutTokenTray()
  GameSetup.LayoutPlayerboards()
  GameSetup.LayoutTechnologyBoard()
  GameSetup.LayoutPolicyBoard()
  GameSetup.LayoutExploreBags()
  GameSetup.LayoutMissionBag()
  GameSetup.LayoutNPFBaseBag()
  GameSetup.LayoutTradeTokens()
  GameSetup.LayoutTerraformingTokens()
  PlayerSetup.LayoutPlayers()
end

function GameSetup.StartGame( Factions )
  Log.ModuleTrace( ModuleName, "StartGame" )

  PlayerSetup.StartGame()
  GameSetup.RemoveExtraPlayerboards( Factions )
  GameSetup.LayoutTechnology( Factions )
  GameSetup.LayoutResearchTokens( Factions )
  GameSetup.LayoutPolicies( Factions )
  GameSetup.SetInitiative( Factions )
  GameSetup.LayoutNPFBases( Factions )

  Wait.frames(
    function()
      local worldTileBag = Util.GetObjectByTag( "worldtile_Bag" )
      if ( worldTileBag == nil ) then
        error( "Unable to locate object: worldtile_Bag" )
      end
      worldTileBag.shuffle()

      local biologyBag = Util.GetObjectByTag( "bag_Biology" )
      if ( biologyBag == nil ) then
        error( "Unable to locate object: bag_Biology" )
      end
      biologyBag.shuffle()

      local engineeringBag = Util.GetObjectByTag( "bag_Engineering" )
      if ( engineeringBag == nil ) then
        error( "Unable to locate object: bag_Engineering" )
      end
      engineeringBag.shuffle()

      local physicsBag = Util.GetObjectByTag( "bag_Physics" )
      if ( physicsBag == nil ) then
        error( "Unable to locate object: bag_Physics" )
      end
      physicsBag.shuffle()

      local basesBag = Util.GetObjectByTag( "bag_NPFBases" )
      if ( basesBag == nil ) then
        error( "Unable to locate object: bag_NPFBases" )
      end
      basesBag.shuffle()

      local tradeBag = Util.GetObjectByTag( "bag_TradeTokens" )
      if ( tradeBag == nil ) then
        error( "Unable to locate object: bag_TradeTokens" )
      end
      tradeBag.shuffle()
    end,
  20
  )
end

function GameSetup.RemoveExtraPlayerboards( Factions )
  Log.ModuleTrace( ModuleName, "RemoveExtraPlayerboards" )

  for factionId, factionData in pairs( FactionData ) do
    local playerboard = getObjectsWithAllTags( { "playerboard", factionId } )[1]
    if ( Util.Contains( Factions, factionId ) == false ) then
      destroyObject( playerboard )
    else
      playerboard.setLock( true )
    end
  end
end

-- TERRAFORMING TOKENS ---------------------------------------------------------
function GameSetup.LayoutTerraformingTokens()

  local venus = GameSetup.CreateTerraformingToken( { 60.40, 1.23, -2.28 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044006582274/0D9A5C01925567E955FBD49B7D58CEA1C2E8BD6C/", "Venus", 18 )
  local mars = GameSetup.CreateTerraformingToken( { 61.38, 1.23, -1.71 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007602243/021995F0797AF0DA6FDFC2C736DDA5C742737885/", "Mars", 24 )
  local ganymede = GameSetup.CreateTerraformingToken( { 61.37, 1.23, -2.83 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007615209/0CC0F5BDAEAF71BDE52958FF2FE256C28951DF3D/", "Ganymede", 18 )
  local ceres = GameSetup.CreateTerraformingToken( { 62.35, 1.23, -2.27 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007660231/B5B8B1C019A0E714CB6D3F7415DD69BA3F922061/", "Ceres", 22 )

  local callisto = GameSetup.CreateTerraformingToken( { 63.65, 1.23, -2.28 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007660158/E36979383C7A3071F1C96CC5020368BCB1CA3976/", "Callisto", 20 )
  local europa = GameSetup.CreateTerraformingToken( { 64.61, 1.23, -1.72 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007660379/8EB91A3F93C6DE87573F6B1205765DDF4C605AAA/", "Europa", 20 )
  local titan = GameSetup.CreateTerraformingToken( { 64.62, 1.23, -2.84 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007660431/C0DF54610659C2DA32D0B94ECBAE610DF17E4B51/", "Titan", 18 )
  local enceladus = GameSetup.CreateTerraformingToken( { 65.59, 1.23, -2.27 }, "https://steamusercontent-a.akamaihd.net/ugc/1810988044007679277/1CEE943728056AB4DCC3CC4DF7BA43A99345F234/", "Enceladus", 18 )
end

function GameSetup.CreateTerraformingToken( position, url, name, maximum)
  local tokenId = "terraform_" .. name
  local token = Util.GetObjectByTag( tokenId )
  if ( token == nil ) then
    local token = CounterToken.Layout(
      tokenId,
      position,
      { 0.00, 180.00, 0.00 },
      url,
      Color.White,
      { },
      TerraformScript,
      false,
      nil,
      1,
      { 0.60, 1.00, 0.60 }
    )

    CounterToken.SetText( token, "0" )
    token.setName( name )
    token.setDescription( "Maximum: " .. tostring( maximum ) )
  end

  return token
end
-- TERRAFORMING TOKENS ---------------------------------------------------------


-- TRADE TOKENS ----------------------------------------------------------------
function GameSetup.LayoutTradeTokens()
  Log.ModuleTrace( ModuleName, "LayoutTradeTokens" )

  local bagId = "bag_TradeTokens"
  local bag = Util.GetObjectByTag( bagId )
  if (bag == nil) then
    local position = { 66.00, 0.80, -12.50 }
    bag = spawnObject({
      type = "Bag",
      position = position,
      rotation = { 0.00, 0.00, 0.00 },
      scale = { 1.00, 1.00, 1.00 },
      sound = false,
      snap_to_grid = false
    })
    bag.setName( "Trade Tokens" )
    bag.setTags( { bagId } )
    bag.setColorTint( Color( 1.00, 1.00, 1.00) )
    bag.setLock( true )

    position = { position[1], position[2], position[3] - 2.00 }
    for i = 1, 9 do
      -- Supplies
      GameSetup.CreateTradeToken(
        bag,
        { position[1] - 0.00, position[2], position[3] },
        "https://steamusercontent-a.akamaihd.net/ugc/1810988039447625539/F1DAF4B9D319239BE21707CF23C5AA412C672595/",
        "https://steamusercontent-a.akamaihd.net/ugc/1810988039447625665/59C9E37E7D72EBCDC9DDCE81D85EC8FECF5D53FB/"
      )

      -- Fuel
      GameSetup.CreateTradeToken(
        bag,
        { position[1] - 1.00, position[2], position[3] },
        "https://steamusercontent-a.akamaihd.net/ugc/1810988039447625417/DE388C717A8B45F9DC5DDDD45527F6E13FFCB128/",
        "https://steamusercontent-a.akamaihd.net/ugc/1810988039447625578/0B0860D3B92FC349CECA51320911661F4866B52C/"
      )

      -- Ore
      GameSetup.CreateTradeToken(
        bag,
        { position[1] - 2.00, position[2], position[3] },
        "https://steamusercontent-a.akamaihd.net/ugc/1810988039447625478/638A7EE029CD8C08D7A0736911CAD7C986D27FC2/",
        "https://steamusercontent-a.akamaihd.net/ugc/1810988039447625622/49E429BEB5D622DB257376273E5A042809086BD1/"
      )
    end
  end
end

function GameSetup.CreateTradeToken( bag, position, topUrl, bottomUrl )
  local token = spawnObject({
    type = "Custom_Tile",
    position = position,
    rotation = { 0.00, 180.00, 0.00 },
    scale = { 0.33, 1.00, 0.33 },
    sound = false,
    snap_to_grid = false
  })
  token.setCustomObject({
    image = topUrl,
    image_bottom = bottomUrl,
    type = 3,
    thickness = 0.1,
    stackable = false
  })
  token.setTags( { "token_Trade" } )

  bag.putObject( token )
end
-- TRADE TOKENS ----------------------------------------------------------------

-- NPF BASES -------------------------------------------------------------------
function GameSetup.LayoutNPFBaseBag()
  Log.ModuleTrace( ModuleName, "LayoutNPFBaseBag" )

  local bagId = "bag_NPFBases"
  local bag = Util.GetObjectByTag( bagId )
  if (bag == nil) then
    local position = { 63.00, 0.80, -9.50 }
    bag = spawnObject({
      type = "Bag",
      position = position,
      rotation = { 0.00, 0.00, 0.00 },
      scale = { 1.00, 1.00, 1.00 },
      sound = false,
      snap_to_grid = false
    })
    bag.setName( "NPF Bases" )
    bag.setTags( { bagId } )
    bag.setColorTint( Color( 1.00, 0.71, 0.40 ) )
    bag.setLock( true )
  end
end


function GameSetup.LayoutNPFBases( Factions )
  Log.ModuleTrace( ModuleName, "LayoutNPFBases" )

  if ( Util.Length( Factions ) == 7 ) then
    return
  end

  local bagId = "bag_NPFBases"
  local bag = Util.GetObjectByTag( bagId )
  if ( bag == nil ) then
    Log.Error( "Unable to locate NPF bag." )
    return
  end
  local position = bag.getPosition()

  for factionId, factionData in pairs( FactionData ) do
    if ( Util.Contains( Factions, factionId ) == false ) then
      local tokens = FactionData[ factionId ].tokens
      for _, tokenData in ipairs( tokens ) do
        if ( tokenData.type == "Base" ) then
          GameSetup.SpawnNPFBase( bag, { position[1] -2.00, position[2], position[3] }, tokenData.url_front, tokenData.url_back, tokenData.name )
        end
      end
    end
  end
end

function GameSetup.SpawnNPFBase( bag, position, urlFront, urlBack, baseName )
  local token = spawnObject({
    type = "Custom_Tile",
    position = position,
    rotation = { 0.00, 180.00, 0.00 },
    scale = { 0.50, 1.00, 0.50 },
    sound = false,
    snap_to_grid = false
  })
  token.setCustomObject({
    image = urlFront,
    image_bottom = urlBack,
    type = 3,
    thickness = 0.1,
    stackable = false
  })
  token.setName( "NPF Base - " .. baseName )
  token.setTags( { "token_NPFBase" } )

  bag.putObject( token )
end
-- NPF BASES -------------------------------------------------------------------

-- MISSION TOKENS --------------------------------------------------------------
function GameSetup.LayoutMissionBag()
  Log.ModuleTrace( ModuleName, "LayoutMissionBag" )

  local yearOffsets = {}

  local bagId = "bag_Missions"
  local bag = Util.GetObjectByTag( bagId )
  if (bag == nil) then
    local position = { 60.00, 1.00, -9.50 }
    bag = spawnObject({
      type = "Bag",
      position = position,
      rotation = { 0.00, 0.00, 0.00 },
      scale = { 1.00, 1.00, 1.00 },
      sound = false,
      snap_to_grid = false
    })
    bag.setName( "Missions" )
    bag.setTags( { bagId } )
    bag.setColorTint( Color( 0.65, 0.55, 0.38 ) )
    bag.setLock( true )

    for _, missionData in ipairs( MissionData ) do
      if ( missionData.year ~= nil ) then
        position = GameSetup.GetDecadePosition( ( missionData.year - 2030 ) / 10 )
        local yearOffset = yearOffsets[ missionData.year ] or 0.10
        GameSetup.SpawnMissionToken( bag, { position[1], position[2] + yearOffset, position[3] }, missionData.url, missionData.name, missionData.value, missionData.year, missionData.cv_required )
        yearOffset = yearOffset + 0.10
        yearOffsets[ missionData.year ] = yearOffset
      else
        GameSetup.SpawnMissionToken( bag, { position[1], position[2], position[3] + 2.00 }, missionData.url, missionData.name, missionData.value, missionData.year, missionData.cv_required )
      end
    end
  end
end

function GameSetup.SpawnMissionToken( bag, position, topUrl, name, value, year, cv_required )
  local token = spawnObject({
    type = "Custom_Tile",
    position = position,
    rotation = { 0.00, 180.00, 0.00 },
    scale = { 0.25, 1.00, 0.25 },
    sound = false,
    snap_to_grid = false
  })
  token.setCustomObject({
    image = topUrl,
    image_bottom = "https://steamusercontent-a.akamaihd.net/ugc/1810987935838020999/A9A61653B541EC8623AF458AD206404999FE8910/",
    type = 3,
    thickness = 0.1,
    stackable = false
  })
  token.setName( name )
  token.value = value
  token.setTags( { "token_Mission" } )

  local description = ""
  if ( year ~= nil ) then
    description = tostring( year )
  end
  if ( cv_required ~= nil ) then
    if ( string.len( description ) > 1 ) then
      description = description .. "\nCV Required"
    else
      description = description .. "CV Required"
    end
  end

  if (string.len( description ) > 1 ) then
    token.setDescription( description )
  end

  if ( year == nil ) then
    bag.putObject( token )
  end
end
-- MISSION TOKENS --------------------------------------------------------------

-- RESEARCH TOKENS -------------------------------------------------------------
function GameSetup.LayoutResearchTokens( Factions )
  Log.ModuleTrace( ModuleName, "LayoutResearchTokens" )

  local board = Util.GetObjectByTag( "technologyboard" )
  if ( board == nil ) then
    error( "Unable to locate object: technologyboard" )
  end
  local boardPosition = board.getPosition()

  local index = 0
  for _, factionId in ipairs( Factions ) do
    local factionData = FactionData[ factionId ]

    local tokenPosition = { boardPosition[1] + 6.5, boardPosition[2] + 0.10, boardPosition[3] + 7.70 }
    GameSetup.SpawnResearchToken( factionId, factionData.name .. " - Biology", tokenPosition, factionData.research.biology.top_url, factionData.research.biology.bottom_url )
    tokenPosition = { boardPosition[1] + 6.5, boardPosition[2] + 0.20, boardPosition[3] + 7.70 }
    GameSetup.SpawnResearchToken( factionId, factionData.name .. " - Engineering", tokenPosition, factionData.research.engineering.top_url, factionData.research.engineering.bottom_url )
    tokenPosition = { boardPosition[1] + 6.5, boardPosition[2] + 0.30, boardPosition[3] + 7.70 }
    GameSetup.SpawnResearchToken( factionId, factionData.name .. " - Physics", tokenPosition, factionData.research.physics.top_url, factionData.research.physics.bottom_url )

    boardPosition = { boardPosition[1] - 0.50, boardPosition[2], boardPosition[3] }
  end
end

function GameSetup.SpawnResearchToken( factionId, name, position, topUrl, bottomUrl )
  local token = spawnObject({
    type = "Custom_Tile",
    position = position,
    rotation = { 0.00, 180.00, 0.00 },
    scale = { 0.25, 1.00, 0.25 },
    sound = false,
    snap_to_grid = false
  })
  token.setCustomObject({
    image = topUrl,
    image_bottom = bottomUrl,
    type = 3,
    thickness = 0.1,
    stackable = false
  })
  token.setName( name )
end
-- RESEARCH TOKENS -------------------------------------------------------------

-- EXPLORE BAGS ----------------------------------------------------------------
function GameSetup.LayoutExploreBags()
  Log.ModuleTrace( ModuleName, "LayoutExploreBags" )

  local position = { 66.00, 1.00, -6.50 }

  GameSetup.LayoutExploreBag( "bag_Biology", "Biology", { position[1] - 6.00, position[2], position[3] }, "https://steamusercontent-a.akamaihd.net/ugc/1785091242084844834/7376569FCE519347B3794A6FD7D01C5409349506/" )
  GameSetup.LayoutExploreBag( "bag_Engineering", "Engineering", { position[1] - 3.00, position[2], position[3] }, "https://steamusercontent-a.akamaihd.net/ugc/1785091242085093189/ECA620E70F85158CE7676426D913216493750454/" )
  GameSetup.LayoutExploreBag( "bag_Physics", "Physics", { position[1] - 0.00, position[2], position[3] }, "https://steamusercontent-a.akamaihd.net/ugc/1785091242085093927/9D51578D43A8C78D3450E22A89DEB2C0371F1507/" )
end

function GameSetup.LayoutExploreBag( bagId, name, position, tokenUrl )
  local bag = Util.GetObjectByTag( bagId )
  if (bag == nil) then
    bag = spawnObject({
      type = "Bag",
      position = position,
      rotation = { 0.00, 0.00, 0.00 },
      scale = { 1.00, 1.00, 1.00 },
      sound = false,
      snap_to_grid = false
    })
    bag.setName( name )
    bag.setTags( { bagId } )
    bag.setColorTint( Colours[ bagId ] )
    bag.setLock( true )

    -- One
    for i = 1, 14 do
      GameSetup.CreateExploreToken( i, position, 1, name, bag, bagId, tokenUrl )
    end
    -- Two
    for i = 1, 14 do
      GameSetup.CreateExploreToken( i + 14, position, 2, name, bag, bagId, tokenUrl )
    end
    -- Three
    for i = 1, 5 do
      GameSetup.CreateExploreToken( i + 28, position, 3, name, bag, bagId, tokenUrl )
    end
    -- Five
    for i = 1, 3 do
      GameSetup.CreateExploreToken( i + 33, position, 5, name, bag, bagId, tokenUrl )
    end
  end
end

function GameSetup.CreateExploreToken( index, position, value, name, bag, bagId, tokenUrl )
  local token = CounterToken.Layout(
    nil,
    { position[1], position[2], position[3] - 2.00 },
    { 0.00, 180.00, 0.00 },
    tokenUrl,
    Colours[ bagId ],
    { },
    nil,
    false,
    value
  )
  token.setLock( false )
  token.setName( name )
  token.setTags( { "exploretoken_" .. name } )
  CounterToken.SetText( token, tostring( value ) )

  bag.putObject( token )
end
-- EXPLORE BAGS ----------------------------------------------------------------

-- TURN BOARD ------------------------------------------------------------------
function GameSetup.SetInitiative( Factions )

  local index = 1
  local turnboardPosition = Util.GetObjectByTag( "turnboard" ).getPosition()
  for _, factionId in ipairs( FactionOrder ) do
    if ( Util.Contains( Factions, factionId ) ) then
      local flagSourceId = "flagsource_" .. factionId
      local flagSource = Util.GetObjectByTag( flagSourceId )
      if ( flagSource == nil ) then
        error( "Unable to locate object: " .. flagSourceId )
      end
      local xOffset = TurnBoardInitiativeSnaps[index]
      local flagPosition = { turnboardPosition[1] + xOffset, turnboardPosition[2] + 0.10, turnboardPosition[3] - 2.61 }
      local flag = flagSource.takeObject({
        position = flagPosition,
        rotation = { 0.00, 180.00, 0.00 },
        smooth = false
      })
      index = index + 1
    end
  end
end

function GameSetup.GetYearPosition( year )
  local turnBoard = Util.GetObjectByTag( "turnboard" )
  if ( turnBoard == nil ) then
    error( "Unable to locate object: turnboard" )
  end
  local boardPosition = turnBoard.getPosition()
  local turnCenter = { boardPosition[1], boardPosition[2], boardPosition[3] + 1.80 }

  year = year + 8
  year = year % 10

  local spotX = turnCenter[1] + 1.75 * (math.cos( ( ( math.pi * 2 ) / 10 ) * year ) )
  local spotY = turnCenter[3] + 1.75 * (math.sin( ( ( math.pi * 2 ) / 10 ) * year ) )

  return { spotX, boardPosition[2], spotY }
end

function GameSetup.GetDecadePosition( decade )
  local turnBoard = Util.GetObjectByTag( "turnboard" )
  if ( turnBoard == nil ) then
    error( "Unable to locate object: turnboard" )
  end
  local boardPosition = turnBoard.getPosition()
  local turnCenter = { boardPosition[1], boardPosition[2], boardPosition[3] + 1.80 }

  -- The math works from "90 degrees" counter-clockwise, so....
  -- Mirror the decade
  decade = 14 - decade
  -- Swing it around by 4 slots  (0-based)
  decade = decade + 3
  if ( decade < 14 ) then
    decade = decade - 14
  end

  local spotX = turnCenter[1] + 3.15 * (math.cos( ( ( math.pi * 2 ) / 14 ) * decade ) )
  local spotY = turnCenter[3] + 3.15 * (math.sin( ( ( math.pi * 2 ) / 14 ) * decade ) )

  return { spotX, boardPosition[2], spotY }
end

function GameSetup.LayoutTurnBoard()
  Log.ModuleTrace( ModuleName, "LayoutTurnBoard" )

  local turnBoard = Util.GetObjectByTag( "turnboard" )
  if ( turnBoard == nil ) then
    local spawnPosition = { 63.00, 1.13, 2.00 }
    turnBoard = spawnObject({
      type = "Custom_Tile",
      position = spawnPosition,
      rotation = { 0.00, 180.00, 0.00 },
      scale = { 5.50, 1.00, 5.50 },
      sound = false,
      snap_to_grid = false
    })
    turnBoard.setCustomObject({
      image = "https://steamusercontent-a.akamaihd.net/ugc/1810987935837515767/9292229992D9C989D40E32832ACB3EC8FEB2FEFC/",
      type = 0,
      thickness = 0.1,
      stackable = false
    })
    turnBoard.setTags( { "turnboard" } )
    turnBoard.setLock ( true )

    local turnCenter = { spawnPosition[1], spawnPosition[2], spawnPosition[3] + 1.80 }
    -- Year snaps
    for i = 0, 9 do
      local spotX = turnCenter[1] + 1.75 * (math.cos( ( ( math.pi * 2 ) / 10 ) * i ) )
      local spotY = turnCenter[3] + 1.75 * (math.sin( ( ( math.pi * 2 ) / 10 ) * i ) )

      local yearSnapId = "yearsnap" .. tostring( i )
      SnapManager.Add( Global, yearSnapId, { spotX, spawnPosition[2], spotY }, { "token_year" }, { 0.00, 180.00, 0.00 } )

      -- Put the year token on 0
      if ( i == 2 ) then
        local yearToken = spawnObject({
          type = "Custom_Tile",
          position = { spotX, spawnPosition[2] + 0.10, spotY },
          rotation = { 0.00, 180.00, 0.00 } ,
          scale = { 0.33, 1.00, 0.33 },
          sound = false,
          snap_to_grid = false
        })
        yearToken.setCustomObject({
          image = "https://steamusercontent-a.akamaihd.net/ugc/1810987828611278151/C03EAAE097ED6BA03E709DEA26F994F233308FDD/",
          type = 3,
          thickness = 0.1,
          stackable = false
        })
        yearToken.setTags( { "token_year" } )
      end
    end

    -- Decade snaps
    for i = 0, 13 do
      local spotX = turnCenter[1] + 3.15 * (math.cos( ( ( math.pi * 2 ) / 14 ) * i ) )
      local spotY = turnCenter[3] + 3.15 * (math.sin( ( ( math.pi * 2 ) / 14 ) * i ) )

      local decadeSnapId = "decadesnap" .. tostring( i )
      SnapManager.Add( Global, decadeSnapId, { spotX, spawnPosition[2], spotY }, { "token_decade" }, { 0.00, 180.00, 0.00 } )

      -- Put the year token on 2030
      if ( i == 3 ) then
        local yearToken = spawnObject({
          type = "Custom_Tile",
          position = { spotX, spawnPosition[2] + 0.10, spotY },
          rotation = { 0.00, 180.00, 0.00 } ,
          scale = { 0.33, 1.00, 0.33 },
          sound = false,
          snap_to_grid = false
        })
        yearToken.setCustomObject({
          image = "https://steamusercontent-a.akamaihd.net/ugc/1810987828611278094/F754F91FA2E03B15F72FC79E5F08170A24978ADC/",
          type = 3,
          thickness = 0.1,
          stackable = false
        })
        yearToken.setTags( { "token_decade" } )
      end
    end


    -- Initiative Track snaps
    SnapManager.Add( Global, "initiative1", { spawnPosition[1] + TurnBoardInitiativeSnaps[1], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
    SnapManager.Add( Global, "initiative2", { spawnPosition[1] + TurnBoardInitiativeSnaps[2], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
    SnapManager.Add( Global, "initiative3", { spawnPosition[1] + TurnBoardInitiativeSnaps[3], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
    SnapManager.Add( Global, "initiative4", { spawnPosition[1] + TurnBoardInitiativeSnaps[4], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
    SnapManager.Add( Global, "initiative5", { spawnPosition[1] + TurnBoardInitiativeSnaps[5], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
    SnapManager.Add( Global, "initiative6", { spawnPosition[1] + TurnBoardInitiativeSnaps[6], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
    SnapManager.Add( Global, "initiative7", { spawnPosition[1] + TurnBoardInitiativeSnaps[7], spawnPosition[2] + 0.10, spawnPosition[3] - 2.61 }, { "flag" }, { 0.00, 180.00, 0.00 } )
  end
end
-- TURN BOARD ------------------------------------------------------------------

-- STARTING TECHNOLOGY ---------------------------------------------------------
function GameSetup.LayoutTechnology( Factions )
  Log.ModuleTrace( ModuleName, "LayoutTechnology" )

  local boardPosition = Util.GetObjectByTag( "technologyboard" ).getPosition()
  local index = 0
  local playerOffsets = {}
  for _, techData in ipairs( TechnologyData ) do
    local yOffset = 0.11
    for _, factionId in ipairs( Factions ) do
      local spawnPosition = { boardPosition[1] + techData.position[1], 1.03, boardPosition[3] + techData.position[3] }
      local factionData = FactionData[ factionId ]
      if Util.Contains( factionData.start_technology, techData.id ) then
        local playerboard = getObjectsWithAllTags( { "playerboard", factionId } )[1]
        local boardPosition = playerboard.getPosition()
        local playerOffset = playerOffsets[ factionId ] or 0.10
        spawnPosition = { boardPosition[1] + 0.96, boardPosition[2] + playerOffset, boardPosition[3] + 2.17 }
        playerOffsets[ factionId ] = (playerOffset + 0.10)
      else
        spawnPosition = { spawnPosition[1], spawnPosition[2] + yOffset, spawnPosition[3] }
        yOffset = yOffset + 0.11
      end

      local techTile = spawnObject({
        type = "Custom_Tile",
        position = spawnPosition,
        rotation = { 0.00, 180.00, 0.00 },
        scale = { 0.50, 1.00, 0.50 },
        sound = false,
        snap_to_grid = false
      })
      techTile.setCustomObject({
        image = techData.url,
        type = 0,
        thickness = 0.1,
        stackable = true
      })
      techTile.setTags( { "technology", techData.id } )
      techTile.setName( techData.name )
      techTile.setDescription( techData.description )
    end
  end
end
-- STARTING TECHNOLOGY ---------------------------------------------------------

-- STARTING POLICY ---------------------------------------------------------
function GameSetup.LayoutPolicies( Factions )
  Log.ModuleTrace( ModuleName, "LayoutPolicy" )

  local boardPosition = Util.GetObjectByTag( "policyboard" ).getPosition()
  local index = 0
  local playerOffsets = {}
  for _, policyData in ipairs( PolicyData ) do
    local yOffset = 0.11
    for _, factionId in ipairs( Factions ) do
      local spawnPosition = { boardPosition[1] + policyData.position[1], 1.03, boardPosition[3] + policyData.position[3] }
      local factionData = FactionData[ factionId ]
      if Util.Contains( factionData.start_policy, policyData.id ) then
        local playerboard = getObjectsWithAllTags( { "playerboard", factionId } )[1]
        local boardPosition = playerboard.getPosition()
        local playerOffset = playerOffsets[ factionId ] or 0.10
        spawnPosition = { boardPosition[1] + -0.82, boardPosition[2] + playerOffset, boardPosition[3] + 2.22 }
        playerOffsets[ factionId ] = (playerOffset + 0.10)
      else
        spawnPosition = { spawnPosition[1], spawnPosition[2] + yOffset, spawnPosition[3] }
        yOffset = yOffset + 0.11
      end
      local policyTile = spawnObject({
        type = "Custom_Tile",
        position = spawnPosition,
        rotation = { 0.00, 180.00, 0.00 },
        scale = { 0.45, 1.00, 0.45 },
        sound = false,
        snap_to_grid = false
      })
      policyTile.setCustomObject({
        image = policyData.url,
        type = 0,
        thickness = 0.1,
        stackable = true
      })
      policyTile.setTags( { "policy", policyData.id } )
      policyTile.setName( policyData.name )
      policyTile.setDescription( policyData.description )
    end
  end
end
-- STARTING POLICY ---------------------------------------------------------

-- POLICY BOARD ------------------------------------------------------------
function GameSetup.LayoutPolicyBoard()
  Log.ModuleTrace( ModuleName, "LayoutPolicyBoard" )

  local position = { 54.00, 1.03, 3 }
  local policyBoard = Util.GetObjectByTags( { "policyboard" } )
  if ( policyBoard == nil ) then
    policyBoard = spawnObject({
      type = "Custom_Tile",
      position = position,
      rotation = { 0.00, 180.00, 0.00 },
      scale = { 4.70, 1.00, 4.70 },
      sound = false,
      snap_to_grid = false
    })
    policyBoard.setCustomObject({
      image = "https://steamusercontent-a.akamaihd.net/ugc/1810987828611050344/A5CC78637EEEF4F062918345760227B687308512/",
      type = 0,
      thickness = 0.1,
      stackable = false
    })
    policyBoard.setTags( { "policyboard" } )
    policyBoard.setLock( true )

    local position = policyBoard.getPosition()
    for _, policyData in ipairs( PolicyData ) do
      SnapManager.Add( Global, "snap_" .. policyData.id, { position[1] + policyData.position[1], position[2] + policyData.position[2], position[3] + policyData.position[3] }, { policyData.id }, { 0.00, 180.00, 0.00 } )
    end
  end

end
-- POLICY BOARD ------------------------------------------------------------

-- TECHNOLOGY BOARD ------------------------------------------------------------
function GameSetup.LayoutTechnologyBoard()
  Log.ModuleTrace( ModuleName, "LayoutTechnologyBoard" )
  local technologyBoard = Util.GetObjectByTags( { "technologyboard" } )
  if ( technologyBoard == nil ) then
    technologyBoard = spawnObject({
      type = "Custom_Tile",
      position = { -59.00, 1.03, -1.50 },
      rotation = { 0.00, 180.00, 0.00 },
      scale = { 8.50, 1.00, 8.50 },
      sound = false,
      snap_to_grid = false
    })
    technologyBoard.setCustomObject({
      image = "https://steamusercontent-a.akamaihd.net/ugc/1810987828611073438/EA1567710D6E95D483D6536104D659A8613B3588/",
      type = 0,
      thickness = 0.1,
      stackable = false
    })
    technologyBoard.setTags( { "technologyboard" } )
    technologyBoard.setLock( true )

    local position = technologyBoard.getPosition()
    for _, techData in ipairs( TechnologyData ) do
      SnapManager.Add( Global, "snap_" .. techData.id, { position[1] + techData.position[1], position[2] + techData.position[2], position[3] + techData.position[3] }, { techData.id }, { 0.00, 180.00, 0.00 } )
    end
  end

  -- Flags for technology board
  local position = { -67.00, 1.13, -3.25 }
  local index = 0
  for factionId, factionData in pairs( FactionData ) do
    local sourceId = "technologyflag_" .. factionId
    local flagSource = Util.GetObjectByTag( sourceId )
    if ( flagSource == nil ) then
      GameSetup.CreateFlagSource( sourceId, factionId, { position[1], position[2], position[3] - (index * 0.75) } )
    end
    index = index + 1
  end
end
-- TECHNOLOGY BOARD ------------------------------------------------------------

-- PLAYER BOARDS ---------------------------------------------------------------
function GameSetup.LayoutPlayerboards()
  Log.ModuleTrace( ModuleName, "LayoutPlayerboards" )

  local position = { -63.25, 1.00, -14.00 }
  local index = 0
  for factionId, factionData in pairs( FactionData ) do
    local tags = { factionId, "playerboard" }
    local playerboard = Util.GetObjectByTags( tags )
    if ( playerboard == nil ) then
      Wait.frames(
        function()
          playerboard = spawnObject({
            type = "Custom_Tile",
            position = { position[1], position[2] + ( index * 0.5 ), position[3] },
            rotation = { 0.00, 180.00, 0.00 },
            scale = { 3.90, 1.00, 3.90 },
            sound = false,
            snap_to_grid = false
          })
          playerboard.setCustomObject({
            image = factionData.playerboard_url,
            type = 0,
            thickness = 0.1,
            stackable = false
          })
          playerboard.setTags( tags )
        end,
        index + 1
      )
    end
  end
end
-- PLAYER BOARDS ---------------------------------------------------------------

-- TOKEN TRAY ------------------------------------------------------------------
function GameSetup.LayoutTokenTray()
  Log.ModuleTrace( ModuleName, "LayoutTokenTray" )

  local trayPosition = { 54.00, 1.03, -4.00 }
  -- Token tray decal
  DecalManager.Add(
    Global,
    "board_tokens",
    "https://steamusercontent-a.akamaihd.net/ugc/1810987935842111616/205558DC7BBF38DA1114D87D42ABC7D2F9FE997E/",
    trayPosition, --{ 63.00, 1.03, -6.00 },
    { 90, 0, 0 },
    { 8.00, 4.00, 1 }
  )

  -- Tokens for the token tray
  for _, tokenData in ipairs( GameTokenData.Shared ) do
    if ( tokenData.type == "Infinite" ) then
      InfiniteToken.LayoutRelativeSharedJson( tokenData, trayPosition )
    else
      Log.Error( "Unknown token type : " .. tokenData.type )
    end
  end

  local position = { trayPosition[1] - 2.25, trayPosition[2] + 0.10, trayPosition[3] + 1.50 }
  local index = 0
  for factionId, factionData in pairs( FactionData ) do
    local sourceId = "flagsource_" .. factionId
    GameSetup.CreateFlagSource( sourceId, factionId, { position[1] + (index * 0.80), position[2], position[3] } )
    index = index + 1
  end

end

function GameSetup.CreateFlagSource( sourceId, factionId, position )
  local factionData = FactionData[ factionId ]

  InfiniteToken.Layout(
    sourceId,
    "Absolute",
    { position[1], position[2], position[3] },
    { 1.20, 1.00, 0.80 },
    "https://steamusercontent-a.akamaihd.net/ugc/1785091558962133434/3B69C46B64FCF71DA7B97E7D117F82251F95E7B3/",
    factionData.flag_url,
    nil,
    factionData.name,
    nil,
    { 0.2, 1.0, 0.2 },
    false,
    0,
    0,
    "flag"
  )
end
-- TOKEN TRAY ------------------------------------------------------------------

-- WORLD TILES ------------------------------------------------------------------
function GameSetup.LayoutWorlds()
  Log.ModuleTrace( ModuleName, "LayoutWorlds" )

  for name, data in pairs( PlanetData ) do
    GameSetup.LayoutPlanet( name, data )
    GameSetup.SetPlanetDescription( name, data )
  end

  for name, data in pairs(MoonData) do
    GameSetup.LayoutMoon( name, data )
    GameSetup.SetMoonDescription( name, data )
  end
end

function GameSetup.LayoutPlanet( planetName, planetData )
  Log.ModuleTrace( "LayoutPlanet" )

  local planetId = GameSetup.GetOrCreatePlanet( planetName, planetData )
  -- Add the snap for the world tile
  if (planetData.has_worldtile == true) then
    local worldtile = planetData.worldtile
    if (SnapManager.Exists( Global, planetId ) == false) then
      local snapTags = worldtile.tags
      table.insert( snapTags, planetId )
      SnapManager.Add( Global, planetId, worldtile.position, snapTags, { 0, 180, 0 } )
    end
  end

  if ( planetData.has_explorevalue == true) then
    local explorevalue = planetData.explorevalue
    local exploreValueId = ExploreValueManager.SetupToken( planetName, planetData.explorevalue )
    if (SnapManager.Exists( Global, exploreValueId ) == false) then
      SnapManager.Add( Global, exploreValueId, explorevalue.position, { exploreValueId }, explorevalue.rotation )
    end
  end

  return planetId
end

function GameSetup.LayoutMoon( moonName, moonData )
  Log.ModuleTrace( ModuleName, "LayoutMoon" )

  local moonId = GameSetup.GetOrCreateMoon( moonName, moonData )
  -- Create the world tile snap
  if (moonData.has_worldtile == true) then
    local worldtile = moonData.worldtile
    if (SnapManager.Exists( Global, moonId ) == false ) then
      local snapTags = worldtile.tags
      table.insert( snapTags, moonId )
      SnapManager.Add( Global, moonId, worldtile.position, snapTags, { 0, 180, 0 } )
    end
  end

  -- Create the explore value
  local explorevalue = moonData.explorevalue
  local exploreValueId = ExploreValueManager.SetupToken( moonName, explorevalue )
  if ( SnapManager.Exists( Global, exploreValueId ) == false ) then
    SnapManager.Add( Global, exploreValueId, explorevalue.position, { exploreValueId }, explorevalue.rotation )
  end
end

function GameSetup.TagsToDescription( tags )
  Log.ModuleTrace( ModuleName, "TagsToDescription" )

  local description = ""
  for _, tag in ipairs( tags ) do
    local tagDescription = WorldTagDescriptions[ tag ]
    if (tagDescription ~= nil) then
      if (string.len( description ) > 0 ) then
        description = description .. "\n" .. tagDescription
      else
        description = description .. tagDescription
      end
    end
  end

  return description
end

function GameSetup.SetMoonDescription( moonName, moonData )
  Log.ModuleTrace( ModuleName, "SetMoonDescription" )

  local moonId = GameSetup.GetMoonId( moonName )
  local tile = Util.GetObjectByTag( moonId )
  if ( tile == nil ) then
    error( "Unable to locate object: " .. moonId )
  end

  local description = ""
  if ( moonData.has_life ) then
    description = "Life " .. tostring( moonData.life ) .. "%"
  end

  if ( moonData.worldtile ~= nil ) then
    local worldtile = moonData.worldtile
    if ( worldtile.tags ~= nil ) then
      if ( string.len( description ) > 0 ) then
        description = description .. "\n" .. GameSetup.TagsToDescription( worldtile.tags )
      else
        description = GameSetup.TagsToDescription( worldtile.tags )
      end
      tile.setDescription( description )
    end
  end
end

function GameSetup.SetPlanetDescription( planetName, planetData )
  Log.ModuleTrace( "SetPlanetDescription" )

  local planetId = GameSetup.GetPlanetId( planetName )
  local tile = Util.GetObjectByTag( planetId )

  if ( tile == nil ) then
    return
  end

  local description = ""
  if ( planetData.has_life ) then
    description = "Life " .. tostring( planetData.life ) .. "%"
  end

  if ( planetData.worldtile ~= nil ) then
    local worldtile = planetData.worldtile
    if ( worldtile.tags ~= nil ) then
      if ( string.len( description ) > 0 ) then
        description = description .. "\n" ..GameSetup.TagsToDescription( worldtile.tags )
      else
        description = GameSetup.TagsToDescription( worldtile.tags )
      end
    end
  end
  tile.setDescription( description )
end

function GameSetup.GetPlanetId( planetName )
  return "planet_" .. planetName
end

function GameSetup.GetMoonId( moonName )
  return "moon_" .. moonName
end

function GameSetup.GetOrCreatePlanet( planetName, planetData )
  Log.ModuleTrace( ModuleName, "GetOrCreatePlanet" )

  local planetId = GameSetup.GetPlanetId( planetName )
  if (planetData == nil) then
    return planetId
  elseif (planetData.position == nil) then
    return planetId
  end

  local planetToken = Util.GetObjectByTag( planetId )
  if (planetToken == nil) then
    planetToken = spawnObject({
      type = "Custom_Token",
      position = planetData.position,
      rotation = { 0.00, 180.00, 0.00 },
      scale = planetData.scale,
      sound = false,
      snap_to_grid = false,
      name = planetData.name
    })
    planetToken.setCustomObject({
      image = planetData.url,
      thickness = 0.1,
      merge_distance = 15.0,
      stackable = false
    })
    planetToken.setName( planetData.name )
    planetToken.setTags( { planetId } )
    planetToken.setLock( true )
  end

  return planetId
end

function GameSetup.GetOrCreateMoon( moonName, moonData )
  Log.ModuleTrace( ModuleName, "GetOrCreateMoon" )

  local moonId = GameSetup.GetMoonId( moonName )
  local moonTile = Util.GetObjectByTag( moonId )
  -- Create the moon card
  if (moonTile == nil) then
    moonTile = spawnObject({
      type = "Custom_Token",
      position = moonData.position,
      rotation = { 0.00, 180.00, 0.00 },
      scale = { 0.80, 1.00, 0.80 },
      sound = false,
      snap_to_grid = false
    })
    moonTile.setCustomObject({
      image = moonData.url,
      thickness = 0.1,
      merge_distance = 15.0,
      stackable = false
    })
    moonTile.setName( moonData.name )
    moonTile.setTags( { moonId } )
    moonTile.setLock( true )
  end

  return moonId
end
-- WORLD TILES ------------------------------------------------------------------

return GameSetup
