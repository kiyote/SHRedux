local InfiniteToken = {}

local ModuleName = "InfiniteToken"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

function InfiniteToken.PutAt( sourceId, tokenPosition )
  Log.ModuleTrace( ModuleName, "PutAt" )

  local container = Util.GetObjectByTag( sourceId )
  if ( container == nil ) then
    error( "Unable to locate object: " .. sourceId )
  end
  local token = container.takeObject({
      position = tokenPosition,
      rotation = { 0.00, 180.00, 0.00 },
      smooth = false
  })
end

function InfiniteToken.LayoutSharedJson( params )
  Log.ModuleTrace( ModuleName, "LayoutSharedJson" )

  InfiniteToken.Layout(
    params.source_id,
    params.position or "Absolute",
    params.source_position,
    params.source_scale,
    params.mesh_url,
    params.front_url,
    params.back_url or nil,
    params.token_name,
    params.token_description,
    params.token_scale,
    params.stackable,
    params.stack_value or 0,
    params.stack_flag or 0,
    params.token_tag,
    params.shape or 3,
    nil
  )
end

function InfiniteToken.LayoutRelativeSharedJson( params, relativePosition )
  Log.ModuleTrace( ModuleName, "LayoutRelativeSharedJson" )

  InfiniteToken.Layout(
    params.source_id,
    params.position or "Relative",
    params.source_position,
    params.source_scale,
    params.mesh_url,
    params.front_url,
    params.back_url or nil,
    params.token_name,
    params.token_description,
    params.token_scale,
    params.stackable,
    params.stack_value or 0,
    params.stack_flag or 0,
    params.token_tag,
    params.shape or 3,
    relativePosition
  )
end

function InfiniteToken.LayoutPerPersonJson( params, relativePosition, idSuffix )
  Log.ModuleTrace( ModuleName, "LayoutJson" )

  InfiniteToken.Layout(
    params.source_id .. idSuffix,
    params.position,
    params.source_position,
    params.source_scale,
    params.mesh_url,
    params.front_url,
    params.back_url or nil,
    params.token_name,
    params.token_description,
    params.token_scale,
    params.stackable,
    params.stack_value or 0,
    params.stack_flag or 0,
    params.token_tag,
    params.shape or 3,
    relativePosition
  )
end

function InfiniteToken.Layout( sourceId, positionType, sourcePosition, sourceScale, meshUrl, frontUrl, backUrl, tokenName, tokenDescription, tokenScale, stackable, stackValue, stackFlag, tokenTag, shape, relativePosition, idSuffix )
  Log.ModuleTrace( ModuleName, "Layout" )

  if ( positionType == "Relative" ) then
    sourcePosition = { relativePosition[1] + sourcePosition[1], relativePosition[2] + sourcePosition[2], relativePosition[3] + sourcePosition[3] }
  end

  local container = Util.GetObjectByTag( sourceId )
  if ( container == nil ) then
    local spawnedContainer = spawnObject({
      type = "Custom_Model",
      position = sourcePosition,
      rotation = { 0.00, 0.00, 0.00 },
      scale = sourceScale,
      sound = false,
      snap_to_grid = false
    })
    spawnedContainer.setCustomObject({
      mesh = meshUrl,
      diffuse = frontUrl,
      type = 7,
      material = 3
    })
    spawnedContainer.setName( tokenName )
    spawnedContainer.setTags( { sourceId } )
    spawnedContainer.setLock( true )
    if ( tokenDescription ~= nil ) then
      spawnedContainer.setDescription( tokenDescription )
    end

    InfiniteToken.CreateToken(
      sourceId,
      sourcePosition,
      tokenScale,
      frontUrl,
      backUrl,
      tokenName,
      tokenDescription,
      stackable,
      stackValue,
      stackFlag,
      tokenTag,
      shape
    )
  end
end

function InfiniteToken.CreateToken( sourceId, sourcePosition, tokenScale, frontUrl, backUrl, tokenName, tokenDescription, stackable, stackValue, stackFlag, tokenTag, shape )
  Log.ModuleTrace( ModuleName, "CreateToken" )

  local objecType = shape or 3
  local token = spawnObject({
    type = "Custom_Tile",
    position = { sourcePosition[1], sourcePosition[2] + 1.00, sourcePosition[3] },
    rotation = { 0.00, 180.00, 0.00 },
    scale = tokenScale,
    sound = false,
    snap_to_grid = false,
    callback_function = function( spawnedObject )
      local container = Util.GetObjectByTag( sourceId )
      if ( container == nil ) then
        Log.Error( "Unable to resolve container: " .. sourceId )
      else
        container.putObject( spawnedObject )
      end
    end
  })
  token.setCustomObject({
    image = frontUrl,
    image_bottom = backUrl,
    type = objecType,
    thickness = 0.1,
    stackable = stackable
  })
  if ( stackable == true ) then
    token.value = stackValue
    token.value_flags = stackFlag
  end
  token.setName( tokenName )
  if ( tokenDescription ~= nil ) then
    token.setDescription( tokenDescription )
  end
  token.setTags( { tokenTag } )
end


return InfiniteToken
