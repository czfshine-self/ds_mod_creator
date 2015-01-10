
-----------------------------------
-- Prefab mod example
--
--  AddPrefabPostInit("prefabname", initfn)
--		Use this to modify a prefab by adding, removing, or editing its properties
--		and components.
-----------------------------------

local function Init(prefab)



	prefab:AddComponent("harvestable")

	prefab.components.harvestable:SetUp("honey", 6, 10)
     prefab.components.harvestable:Grow()




end
AddPrefabPostInit("icebox",Init)

