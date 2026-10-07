-- ============================================================================
-- TestPushswap.lua | dam | 2026-10-06
-- ============================================================================

local lu = require("luaunit")
local Pushswap = require("Pushswap")

TestPushswap = {}

function TestPushswap:test_new()
    local ps = Pushswap:new()
    lu.assertEquals(ps.pile_a.data, {})
    lu.assertEquals(ps.pile_b.data, {})
end

function TestPushswap:test_new_from()
    local list_a = {1, 2, 3, 4}
    local list_b = {5, 6, 7, 8}
    local ps = Pushswap:new_from(list_a, list_b)
    lu.assertEquals(ps.pile_a.data, list_a)
    lu.assertEquals(ps.pile_b.data, list_b)
end

function TestPushswap:test_sa()
    local list_a = {7, 6}
    local list_b = {}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:sa()
    lu.assertEquals(ps.pile_a.data, {6, 7})
end

function TestPushswap:test_sb()
    local list_a = {}
    local list_b = {2, 4}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:sb()
    lu.assertEquals(ps.pile_b.data, {4, 2})
end

function TestPushswap:test_ss()
    local list_a = {3, 1}
    local list_b = {9, 6}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:ss()
    lu.assertEquals(ps.pile_a.data, {1, 3})
    lu.assertEquals(ps.pile_b.data, {6, 9})
end

function TestPushswap:test_pa()
    local list_a = {10, -8}
    local list_b = {0, 40}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:pa()
    lu.assertEquals(ps.pile_a.data, {0, 10, -8})
    lu.assertEquals(ps.pile_b.data, {40})
end

function TestPushswap:test_pb()
    local list_a = {-10, 84}
    local list_b = {4, 21}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:pb()
    lu.assertEquals(ps.pile_a.data, {84})
    lu.assertEquals(ps.pile_b.data, {-10, 4, 21})
end

function TestPushswap:test_ra()
    local list_a = {1, 2, 3, 4}
    local list_b = {}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:ra()
    lu.assertEquals(ps.pile_a.data, {2, 3, 4, 1})
end

function TestPushswap:test_rb()
    local list_a = {}
    local list_b = {4, 3, 2, 1}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:rb()
    lu.assertEquals(ps.pile_b.data, {3, 2, 1, 4})
end

function TestPushswap:test_rr()
    local list_a = {12, 11, 18, 14}
    local list_b = {-4, 2, 0, 4}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:rr()
    lu.assertEquals(ps.pile_a.data, {11, 18, 14, 12})
    lu.assertEquals(ps.pile_b.data, {2, 0, 4, -4})
end

function TestPushswap:test_rra()
    local list_a = {1, 2, 3, 4}
    local list_b = {}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:rra()
    lu.assertEquals(ps.pile_a.data, {4, 1, 2, 3})
end

function TestPushswap:test_rrb()
    local list_a = {}
    local list_b = {4, 3, 2, 1}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:rrb()
    lu.assertEquals(ps.pile_b.data, {1, 4, 3, 2})
end

function TestPushswap:test_rrr()
    local list_a = {12, 11, 18, 14}
    local list_b = {-4, 2, 0, 4}
    local ps = Pushswap:new_from(list_a, list_b)
    ps:rrr()
    lu.assertEquals(ps.pile_a.data, {14, 12, 11, 18})
    lu.assertEquals(ps.pile_b.data, {4, -4, 2, 0})
end

if arg and arg[0]:match("TestPushswap%.lua$") then
    os.exit(lu.LuaUnit.run())
end
