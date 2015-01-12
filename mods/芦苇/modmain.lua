require=GLOBAL.require
GLOBAL.CHEATS_ENABLED = true
require "constants"
AddGameDebugKey=GLOBAL.require( 'debugkeys' )

AddGameDebugKey(108, function()
player=GLOBAL.GetPlayer()
 local pt = GLOBAL.Vector3(player.Transform:GetWorldPosition())

   local spawn = GLOBAL.SpawnPrefab("animal_track")

    spawn.Transform:SetPosition( pt.x,pt.y,pt.z )
end
)
