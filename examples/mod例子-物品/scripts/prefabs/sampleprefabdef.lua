
-- In a prefab file, you need to list all the assets it requires.
-- These can be either standard assets, or custom ones in your mod
-- folder.
local Assets =
{
	Asset("ANIM", "anim/myprefab_build.zip"), -- a standard asset
    Asset("ATLAS", "images/inventoryimages/myprefab.xml"),    -- a custom asset, found in the mod folder
}

-- Write a local function that creats, customizes, and returns an instance of the prefab.
local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("myprefab")
    inst.AnimState:SetBuild("myprefab_build")
    inst.AnimState:PlayAnimation("idle", true)
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/myprefab.xml"

	inst:AddComponent("inspectable")
    
    return inst
end

-- Add some strings for this item
STRINGS.NAMES.MYPREFAB = "My example prefab"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MYPREFAB = "I made an example out of it."


-- Finally, return a new prefab with the construction function and assets.
return Prefab( "common/inventory/myprefab", fn, Assets)

