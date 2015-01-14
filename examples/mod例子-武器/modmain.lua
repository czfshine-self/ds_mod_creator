PrefabFiles = {
    "wand",
}


-- Import things we like into our mod's own global scope, so we don't have
-- to type "GLOBAL." every time want to use them.
SpawnPrefab = GLOBAL.SpawnPrefab


function SimInit(player)
	print("spawning item")
	local prefab = SpawnPrefab("wand")
	player.components.inventory:GiveItem(prefab)
end

AddSimPostInit(SimInit )
