-- ============================================================================
-- Pushswap.lua | dam | 2026-10-05
-- ============================================================================

local Pile = require("Pile")

local Pushswap = {}
Pushswap.__index = Pushswap

function Pushswap:new()
    self = setmetatable({}, Pushswap)
    self.pile_a = Pile.new()
    self.pile_b = Pile.new()
    return self
end

function Pushswap:display()
    self.pile_a:display()
    self.pile_b:display()
end

function Pushswap:sa()
    self.pile_a:swap(1, 2)
end


function Pushswap:sb()
    self.pile_b:swap(1, 2)
end

function Pushswap:ss()
    self:sa()
    self:sb()
end

function Pushswap:pa()
    self.pile_a:add(self.pile_b:pop())
end

function Pushswap:pb()
    self.pile_b:add(self.pile_a:pop())
end

function Pushswap:ra()
    self.pile_a:rotate()
end

function Pushswap:rb()
    self.pile_b:rotate()
end

function Pushswap:rr()
    self:ra()
    self:rb()
end

function Pushswap:rra()
    self.pile_a:reverse_rotate()
end

function Pushswap:rrb()
    self.pile_b:reverse_rotate()
end

function Pushswap:rrr()
    self:rra()
    self:rrb()
end

return Pushswap
