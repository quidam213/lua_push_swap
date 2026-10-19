-- ============================================================================
-- RunTests.lua | dam | 2026-10-06
-- ============================================================================

local lu = require("luaunit")

require("TestPile")
require("TestPushswap")
require("TestRadix")
require("TestLogger")

os.exit(lu.LuaUnit.run())
