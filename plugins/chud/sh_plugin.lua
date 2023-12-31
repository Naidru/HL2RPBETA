local PLUGIN = PLUGIN

PLUGIN.name = "Combine Improvements V2"
PLUGIN.author = "Scotnay"
PLUGIN.description = "A set of improvements for Universal Union factions"

-- This is only needed if you're going to use taglines
PLUGIN.divisions = {
                     -- CCA --
                     "UNION",
                     "HELIX",
                     "GRID",
                     "JURY",
                     "GHOST",
                     "PRESSURE",
                     -- EPU --
                     "SWORD",
                     "APEX",
                     "BLADE",
                     "JUDGE",
                     "ANVIL",
                     "SAVAGE",
                     "WRAITH",
                     -- SeC --
                     "SeC",
                     "ION",
                     -- OTA --
                     "ECHO",
                     "KING",
                     "DAGGER",
                     "PHANTOM",
                     "HURRICANE",
                     "X-RAY",
                     "XRAY",
                     "RANGER",
                     "DEFENDER"
                   }

-- Key is rank and bool is whether or not they can use HC Terminal
PLUGIN.ranks = {
                   [ "RCT" ] = false,
                   [ "i5" ] = false,
                   [ "i4" ] = false,
                   [ "i3" ] = false,
                   [ "i2" ] = false,
                   [ "i1" ] = false,
                   [ "OfC" ] = false,
                   [ "EpU" ] = false,
                   [ "DvL" ] = true,
                   [ "CmD" ] = true,
                   [ "SeC" ] = true
               }

PLUGIN.SocioColors = {
  [ "GREEN" ] = Color( 0, 255, 0 ),
  [ "BLUE" ] = Color( 0, 0, 255 ),
  [ "YELLOW" ] = Color( 255, 255, 0 ),
  [ "RED" ] = Color( 255, 0, 0 ),
  [ "BLACK" ] = Color( 0, 0, 0 ) -- This only exists for checks
}

-- This is used to determine what factions should be considered citizens
-- and therefore show up in the terminals.
PLUGIN.civFactions = {
  [ FACTION_CITIZEN ] = true,
  [ FACTION_CIC ] = true,
  [ FACTION_CMU ] = true,
  [ FACTION_CMUDIRECTOR ] = true,
  [ FACTION_CWU ] = true,
  [ FACTION_CWUDIRECTOR ] = true,
  [ FACTION_ULM ] = true
}

ix.util.Include( "cl_hooks.lua" )
ix.util.Include( "cl_plugin.lua" )
ix.util.Include( "sv_hooks.lua" )
ix.util.Include( "sv_plugin.lua" )
ix.util.Include( "meta/sh_char.lua" )
ix.util.Include( "meta/sh_player.lua" )

ix.config.Add( "CP ID Offset", 11, "Set the offset for CP names, if the numbers are wrong make this higher or lower", nil,
  { data = {min = 0, max = 50 },
  category = "Combine Improvements"
} )

ix.config.Add( "Use Taglines", false, "Whether or not to use taglines in unit names", nil,
  {
  category = "Combine Improvements"
} )
