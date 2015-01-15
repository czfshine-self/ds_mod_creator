name = "boxlock 1"
author = "czfshine"
version = "alpha-0.0.1"


description = ("boxlock")

dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

all_clients_require_mod = true
clients_only_mod = false

forumthread = ""

api_version = 6

-- This is used by the packaging system.
dst_api_version = 10


--[[
icon_atlas = "favicon/upandaway.xml"
icon = "upandaway.tex"
]]

priority = -1



--[[
------------------------------------------------------------------------
-- CFG
------------------------------------------------------------------------

local function NamedSwitch(on_desc, off_desc)
	return function(name, label, default_value)
		return {
			name = name,
			label = label,
			options = {
				{description = on_desc, data = true},
				{description = off_desc, data = false},
			},
			default = default_value and true or false,
		}
	end
end

local EnableSwitch = NamedSwitch("Enabled", "Disabled")
local OnSwitch = NamedSwitch("On", "Off")
local YesSwitch = NamedSwitch("Yes", "No")

------------------------------------

configuration_options = {
	EnableSwitch("DEBUG", "Debugging Mode", true),
	EnableSwitch("UP_SPLASH.ENABLED", "Custom Menu", true),
	EnableSwitch("CLOUD_LIGHTNING.ENABLED", "Ground Lightning", true),
	EnableSwitch("CLOUD_MIST.ENABLED", "Mist", true),
	EnableSwitch("RAM.SPARKS", "Storm Ram Sparks", true),
}
]]