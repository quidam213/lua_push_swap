-- ============================================================================
-- Main.lua | dam | 2026-10-07
-- ============================================================================

require("Parser")
local Pushswap = require("Pushswap")
local Radix = require("Radix")

local list = ParseArguments(arg)
local ps = Pushswap:new_from(list, {})
local algo = Radix:new(ps)
algo:sort()

print(ps.logger:count())
print(ps.logger:to_string())

os.exit(0)
