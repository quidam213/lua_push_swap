-- ============================================================================
-- Pile.lua | dam | 2026-10-05
-- ============================================================================

local Pile = {}
Pile.__index = Pile

function Pile:new()
    local self = setmetatable({}, Pile)
    self.data = {}
    return self
end

function Pile:display()
    print(table.concat(self.data, " "))
end

function Pile:add(x)
    table.insert(self.data, 1, x)
end

function Pile:pop()
    local x = table.remove(self.data, 1)
    return x
end

function Pile:get_at(i)
    return self.data[i]
end

function Pile:get_first()
    return self:get_at(1)
end

function Pile:get_last()
    return self:get_at(#self.data)
end

return Pile
