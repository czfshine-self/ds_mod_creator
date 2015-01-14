--[[
    
***************************************************************
Created by: Jamie Cheng
Date: February 20, 2013
Description: Sample mod that shows how to:
	- add post init functions for prefabs, components, simulation
	- edit tuning values
	- create your own component
***************************************************************

]]

--special post-init function for a particular prefab: pigs in this case
function pigmanpostinit(inst)
	print("hello pigman init!")

	--halve wilson's max hunger on initialization
	inst.components.health:SetMaxHealth(TUNING.PIG_HEALTH*0.5)

	--add your own component, defined in mods/[yourmodname]/scripts/components/myowncomponent.lua
	inst:AddComponent("myowncomponent")
end

function inventorypostinit(component,inst)
	print("hello inventory init!")
end

function simpostinit(player)
	print("hello sim init!")
	print("We are playing as "..player.prefab)
end

function gamepostinit()
	print("hello game init!")
	--if you want to load your own prefabs, this is where you'd do it
end

--add a post init for the pigman
AddPrefabPostInit("pigman", pigmanpostinit)

--add a post init function for the inventory component
AddComponentPostInit("inventory", inventorypostinit)

--add a post init to the sim starting up
AddSimPostInit(simpostinit)

--add a post init to the game starting up
AddGamePostInit(gamepostinit)

--override specific tuning values here!
TUNING.WILSON_HUNGER = 50
