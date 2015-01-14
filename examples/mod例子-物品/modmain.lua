--[[

This mod shows how to load custom prefabs and assets so that they are usable
by the game.

--]]


-- The PrefabFiles list is the list of all the files in your <modname>/scripts/prefabs folder
-- that you want to load prefabs from
PrefabFiles = {
	"sampleprefabdef",
}


-- Import things we like into our mod's own global scope, so we don't have 
-- to type "GLOBAL." every time want to use them.
SpawnPrefab = GLOBAL.SpawnPrefab


function SimInit(player)
	print("spawning item")
	local prefab = SpawnPrefab("myprefab")
	player.components.inventory:GiveItem(prefab)
end

AddSimPostInit(SimInit )
