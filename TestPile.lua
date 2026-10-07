-- ============================================================================
-- TestPile.lua | dam | 2026-10-06
-- ============================================================================

local lu = require("luaunit")
local Pile = require("Pile")

TestPile = {}

function TestPile:test_new()
    local empty_pile = Pile:new()
    lu.assertEquals(empty_pile.data, {})
end

function TestPile:test_new_from()
    local list = {-2, 0, 42, 3, 100}
    local filled_pile = Pile:new_from(list)
    lu.assertEquals(filled_pile.data, list)
end

function TestPile:test_add()
    local test_pile = Pile:new()
    test_pile:add(4)
    test_pile:add(8)
    test_pile:add(67)
    lu.assertEquals(test_pile.data, {67, 8, 4})
end

function TestPile:test_pop()
    local list = {4, 3, 2, 1}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile:pop(), 4)
    lu.assertEquals(test_pile:pop(), 3)
    lu.assertEquals(test_pile:pop(), 2)
    lu.assertEquals(test_pile:pop(), 1)
end

function TestPile:test_empty_pop()
    local empty_pile = Pile:new()
    lu.assertNil(empty_pile:pop())
end

function TestPile:test_get_at()
    local list = {4, 3, 2, 1}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile:get_at(3), 2)
    lu.assertEquals(test_pile:get_at(2), 3)
end

function TestPile:test_get_at_out_of_range()
    local list = {4, 3, 2, 1}
    local test_pile = Pile:new_from(list)
    local success, _ = pcall(test_pile.get_at, test_pile, -10)
    assert(not success, "TestPile:test_get_at_out_of_range: failed")
end

function TestPile:test_get_first()
    local list = {4, 3, 2, 1}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile:get_first(), 4)
end

function TestPile:test_get_last()
    local list = {4, 3, 2, 1}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile:get_last(), 1)
end

function TestPile:test_swap()
    local list = {4, 3, 2, 1}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile:get_first(), 4)
    lu.assertEquals(test_pile:get_at(2), 3)
    test_pile:swap(1, 2)
    lu.assertEquals(test_pile:get_first(), 3)
    lu.assertEquals(test_pile:get_at(2), 4)
end

function TestPile:test_swap_empty()
    local empty_pile = Pile:new()
    lu.assertEquals(empty_pile.data, {})
    empty_pile:swap(1, 2)
    lu.assertEquals(empty_pile.data, {})
end

function TestPile:test_rotate()
    local list = {4, 3, 2, 1}
    local r_list = {3, 2, 1, 4}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile.data, list)
    test_pile:rotate()
    lu.assertEquals(test_pile.data, r_list)
end

function TestPile:test_rotate_empty()
    local empty_pile = Pile:new()
    lu.assertEquals(empty_pile.data, {})
    empty_pile:rotate()
    lu.assertEquals(empty_pile.data, {})
end

function TestPile:test_reverse_rotate()
    local list = {4, 3, 2, 1}
    local r_list = {1, 4, 3, 2}
    local test_pile = Pile:new_from(list)
    lu.assertEquals(test_pile.data, list)
    test_pile:reverse_rotate()
    lu.assertEquals(test_pile.data, r_list)
end

function TestPile:test_reverse_rotate_empty()
    local empty_pile = Pile:new()
    lu.assertEquals(empty_pile.data, {})
    empty_pile:reverse_rotate()
    lu.assertEquals(empty_pile.data, {})
end

if arg and arg[0]:match("TestPile%.lua$") then
    os.exit(lu.LuaUnit.run())
end
