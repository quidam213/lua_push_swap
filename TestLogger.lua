-- ============================================================================
-- TestLogger.lua | dam | 2026-10-19
-- ============================================================================

local lu = require("luaunit")
local Logger = require("Logger")

TestLogger = {}

function TestLogger:test_empty()
    local logger = Logger:new()
    lu.assertEquals(logger:count(), 0)
    lu.assertEquals(logger:to_string(), "")
end

function TestLogger:test_one_entry()
    local logger = Logger:new()
    logger:add("sa")
    lu.assertEquals(logger:count(), 1)
    lu.assertEquals(logger:to_string(), "sa")
end

function TestLogger:test_keep_order()
    local logger = Logger:new()
    logger:add("sa")
    logger:add("pb")
    logger:add("ra")
    lu.assertEquals(logger:count(), 3)
    lu.assertEquals(logger:to_string(), "sa pb ra")
end

function TestLogger:test_clear()
    local logger = Logger:new()
    logger:add("sa")
    logger:add("pb")
    logger:clear()
    lu.assertEquals(logger:count(), 0)
    lu.assertEquals(logger:to_string(), "")
end

function TestLogger:test_after_clear()
    local logger = Logger:new()
    logger:add("sa")
    logger:clear()
    logger:add("pb")
    lu.assertEquals(logger:to_string(), "pb")
end

function TestLogger:test_independants_loggers()
    local a = Logger:new()
    local b = Logger:new()
    a:add("sa")
    lu.assertEquals(a:count(), 1)
    lu.assertEquals(b:count(), 0)
end

if arg and arg[0]:match("TestLogger%.lua$") then
    os.exit(lu.LuaUnit.run())
end
