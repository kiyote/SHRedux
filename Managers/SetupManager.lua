local SetupManager = {}

local ModuleName = "SetupManager"
local Log = require("SHRedux/Log")
local WorldTileManager = require("SHRedux/Managers/WorldTileManager")

function SetupManager.LayoutTable()
  Log.ModuleTrace( ModuleName, "LayoutTable")

  WorldTileManager.LayoutTable()
end


return SetupManager
