local CounterToken = {}

local ModuleName = "CounterToken"
local Log = require("SHRedux/Log")
local Util = require("SHRedux/Util")

local DigitUrls = {
  ["0"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084917419/B53E4F51906520B38C4DA919563C994F039DC5C8/",
  ["1"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084918302/A401F98F276383BA8996CB81758C5A412B951B68/",
  ["2"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084918998/C30872E4191F26C901ED7775232E0D0B8D6C8204/",
  ["3"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084919589/BFD70CD719C5AA17EE16C0D922226FCDDE6016D0/",
  ["4"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084920267/48C5AC3E9A3EAFBBA4743B12C4E08BF76231EA19/",
  ["5"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084920935/006E45CCE871D8C838DA003958A0F89F87E13662/",
  ["6"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084921564/6330AD601F3AC3CF37006462182F9F512795175C/",
  ["7"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084922162/1BD4842253667042009828D99D40BF740A175AC8/",
  ["8"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084922745/59D234ECE259905B28049FE97DC7626F03CBF8C4/",
  ["9"] = "https://steamusercontent-a.akamaihd.net/ugc/1785091242084923378/4D457B22ADE573B36DD5C65C6D8CF1419BE9618A/"
}

function CounterToken.Layout( tokenId, tokenPosition, tokenRotation, tokenUrl, tokenColour, tags, script, stackable, stackValue, shape, tokenScale )
  Log.ModuleTrace( ModuleName, "Layout" )

  local token = Util.GetObjectByTag( tokenId )
  if (token == nil) then
    Log.ModuleTrace( ModuleName, "Spawning tile" )
    token = spawnObject({
      type = "Custom_Tile",
      position = tokenPosition,
      rotation = tokenRotation,
      scale = tokenScale or { 0.25, 1.00, 0.25 },
      sound = false,
      snap_to_grid = false
    })
    Log.ModuleTrace( ModuleName, "Setting custom data" )
    token.setCustomObject({
      image = tokenUrl,
      type = shape or 3,
      thickness = 0.1,
      stackable = stackable
    })
    Log.ModuleTrace( ModuleName, "Setting misc" )
    if ( tokenId ~= nil ) then
      local tokenTags = Util.Append( tags, tokenId )
      token.setTags( tokenTags )
    else
      token.setTags( tags )
    end
    token.setColorTint( tokenColour )
    token.setLuaScript( script )
    if ( stackValue ~= nil ) then
      token.value = stackValue
    end
    token.setLock( true )
  end

  return token
end

function CounterToken.SetText( token, digits )
  Log.ModuleTrace( ModuleName, "SetText" )

  local decals = {}
  local length = string.len( digits )
  local xOffset = 0.5
  local xPos = 0.00 + (0.25 * ( length - 1 ) )
  for i = 1, length do
      local digit = string.sub(digits, i, i)
      local digitUrl = DigitUrls[digit]
      local decal = {
        name             =  token.guid .. "_digit_" .. digit,
        url              =  digitUrl,
        position         =  { xPos, 0.11, 0.00 },
        rotation         =  { 90.00, 180.00, 0.00 },
        scale            =  { 2.00, 2.00, 1.00 }
      }
      xPos = xPos - xOffset
      table.insert( decals, decal )
  end

  token.setDecals( decals )
end

return CounterToken
