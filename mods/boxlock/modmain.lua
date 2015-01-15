local MMScreen=GLOBAL.require("widgets/mmscreen")
local KEY_CTRL = GLOBAL.KEY_CTRL
local Vector3 = GLOBAL.Vector3
local TheInput = GLOBAL.TheInput
local table = GLOBAL.table
local require = GLOBAL.require
local unpack = GLOBAL.unpack





local function SilkPostInit(inst)

local function onopenmm (inst,data)

	local can=inst.components.container
	local canopen =	can.canopen

	if canopen then

		inst.AnimState:PlayAnimation("open")
	    inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
	print("canopenopen")

	elseif not can.MM then


	inst.AnimState:PlayAnimation("close")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")

	controls.MM:Setting(can,data.doer,true)


	else


	inst.AnimState:PlayAnimation("close")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")

	controls.MM:Setting(can,data.doer,false)
	end
 print("open")
end


inst:ListenForEvent("onopen", onopenmm)


local function onclosemm(inst)
	inst.components.container.canopen=false
	end
inst:ListenForEvent("onclose", onclosemm)


end



local function AddMM(self)
	controls = self

	controls.MM = controls:AddChild(MMScreen())

	--local screenwidth, screenheight = GLOBAL.TheSim:GetScreenSize()
	--controls.MM:SetPosition(screenwidth/2,screenheight/2,0)
	--controls.MM.inst.UITransform:SetScale(STARTSCALE, STARTSCALE, 1)

	controls.MM:Hide()

	--[[
	GLOBAL.TheInput:AddKeyDownHandler(ToggleButton, ShowGestureWheel)
	GLOBAL.TheInput:AddKeyUpHandler(ToggleButton, HideGestureWheel)
]]


	local OldOnUpdate = controls.OnUpdate
	local function OnUpdate(...)
		OldOnUpdate(...)

			self.MM:OnUpdate()

	end

	controls.OnUpdate = OnUpdate
end

AddClassPostConstruct( "widgets/controls", AddMM )

AddPrefabPostInit('pandoraschest',SilkPostInit)
AddPrefabPostInit('treasurechest',SilkPostInit)
AddPrefabPostInit('skullchest',SilkPostInit)
AddPrefabPostInit('minotaurchest',SilkPostInit)

