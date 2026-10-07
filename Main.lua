-- ============================================================================
-- Main.lua | dam | 2026-10-07
-- ============================================================================

require("Parser")
local Pushswap = require("Pushswap")

local list = ParseArguments(arg)
local ps = Pushswap:new_from(list, {})

ps:display()

