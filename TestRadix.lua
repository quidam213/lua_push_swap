-- ============================================================================
-- TestRadix.lua | dam | 2026-10-19
-- ============================================================================

local lu = require("luaunit")
local Pile = require("Pile")
local Pushswap = require("Pushswap")
local Radix = require("Radix")

TestRadix = {}

-- construit un Pushswap avec la liste dans a, lance le radix, renvoie le Pushswap
local function sort_with_radix(list)
    local ps = Pushswap:new()
    ps.pile_a = Pile:new_from(list)
    Radix:new(ps):sort()
    return ps
end

local function sorted_copy(list)
    local copy = {table.unpack(list)}
    table.sort(copy)
    return copy
end

function TestRadix:test_empty()
    local ps = sort_with_radix({})
    lu.assertEquals(ps.pile_a.data, {})
    lu.assertEquals(ps.pile_b.data, {})
end

function TestRadix:test_positives()
    local list = {42, 7, 19, 3, 88, 56, 21, 64, 1, 30}
    local ps = sort_with_radix(list)
    lu.assertEquals(ps.pile_a.data, sorted_copy(list))
    lu.assertEquals(ps.pile_b.data, {})
end

function TestRadix:test_negatives()
    local list = {10, -5, 0, -42, 33, -1, 7, -19, 100, -100}
    local ps = sort_with_radix(list)
    lu.assertEquals(ps.pile_a.data, sorted_copy(list))
    lu.assertEquals(ps.pile_b.data, {})
end

if arg and arg[0]:match("TestRadix%.lua$") then
    os.exit(lu.LuaUnit.run())
end
