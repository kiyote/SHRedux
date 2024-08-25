local GameUi = {}

local GameState = require("SHRedux/GameState")

function GameUi.Layout()
  if ( GameState.HasStarted() == false ) then
    local xml = [[
    <Button
      offsetXY = "100 -10"
      width="10%"
      height="7.5%"
      rectAlignment="UpperLeft"
      allowDragging="true"
      fontSize="24"
      onClick="API_StartGame"
    >
      Start Game
    </Button>
    ]]

    Global.UI.setXml( xml )
  end
end

function GameUi.Hide()
  Global.UI.setXml( "" )
end


return GameUi
