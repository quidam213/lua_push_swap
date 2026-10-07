-- ============================================================================
-- RunTests.lua | dam | 2026-10-06
-- ============================================================================

local lu = require("luaunit")

require("TestPile")
require("TestPushswap")

os.exit(lu.LuaUnit.run())
