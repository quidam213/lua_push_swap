-- ============================================================================
-- Pushswap.lua | dam | 2026-10-05
-- ============================================================================

local Pile = require("Pile")
local Logger = require("Logger")

local Pushswap = {}
Pushswap.__index = Pushswap

function Pushswap:new()
    local obj = setmetatable({}, Pushswap)
    obj.pile_a = Pile:new()
    obj.pile_b = Pile:new()
    obj.logger = Logger:new()
    return obj
end

function Pushswap:new_from(list_a, list_b)
    local obj = Pushswap:new()
    obj.pile_a = Pile:new_from(list_a)
    obj.pile_b = Pile:new_from(list_b)
    return obj
end

function Pushswap:display()
    self.pile_a:display()
    self.pile_b:display()
end

function Pushswap:sa()
    self.pile_a:swap(1, 2)
    self.logger:add("sa")
end

function Pushswap:sb()
    self.pile_b:swap(1, 2)
    self.logger:add("sb")
end

function Pushswap:ss()
    self:sa()
    self:sb()
    self.logger:add("ss")
end

function Pushswap:pa()
    self.pile_a:add(self.pile_b:pop())
    self.logger:add("pa")
end

function Pushswap:pb()
    self.pile_b:add(self.pile_a:pop())
    self.logger:add("pb")
end

function Pushswap:ra()
    self.pile_a:rotate()
    self.logger:add("ra")
end

function Pushswap:rb()
    self.pile_b:rotate()
    self.logger:add("rb")
end

function Pushswap:rr()
    self:ra()
    self:rb()
    self.logger:add("rr")
end

function Pushswap:rra()
    self.pile_a:reverse_rotate()
    self.logger:add("rra")
end

function Pushswap:rrb()
    self.pile_b:reverse_rotate()
    self.logger:add("rrb")
end

function Pushswap:rrr()
    self:rra()
    self:rrb()
    self.logger:add("rrr")
end

function Pushswap:display()
    print("--- PILE_A ---")
    self.pile_a:display()
    print("\n--- PILE_B ---")
    self.pile_b:display()
end

return Pushswap
