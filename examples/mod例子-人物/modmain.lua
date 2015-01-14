PrefabFiles = {
	"wod",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/wod.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/wod.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/wod.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wod.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/wod_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wod_silho.xml" ),

    Asset( "IMAGE", "bigportraits/wod.tex" ),
    Asset( "ATLAS", "bigportraits/wod.xml" ),

}


-- strings! Any "WOD" below would have to be replaced by the prefab name of your character.

-- The character select screen lines
-- note: these are lower-case character name
GLOBAL.STRINGS.CHARACTER_TITLES.wod = "The Template"
GLOBAL.STRINGS.CHARACTER_NAMES.wod = "Wod"  -- Note! This line is especially important as some parts of the game require
                                            -- the character to have a valid name.
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.wod = "* An example of how to create a mod character."
GLOBAL.STRINGS.CHARACTER_QUOTES.wod = "\"I am a blank slate.\""

-- You can also add any kind of custom dialogue that you would like. Don't forget to make
-- categores that don't exist yet using = {}
-- note: these are UPPER-CASE charcacter name
GLOBAL.STRINGS.CHARACTERS.WOD = {}
GLOBAL.STRINGS.CHARACTERS.WOD.DESCRIBE = {}
GLOBAL.STRINGS.CHARACTERS.WOD.DESCRIBE.EVERGREEN = "A template description of a tree."

-- Let the game know Wod is a male, for proper pronouns during the end-game sequence.
-- Possible genders here are MALE, FEMALE, or ROBOT
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "wod")


AddModCharacter("wod")

