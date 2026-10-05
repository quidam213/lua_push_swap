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
    return table.remove(self.data, 1)
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

function Pile:swap(i1, i2)
    self.data[i1], self.data[i2] = self.data[i2], self.data[i1]
end

function Pile:swap_firsts()
    self:swap(1, 2)
end

function Pile:length()
    return #self.data
end

function Pile:rotate()
    -- self:swap(1, #self.data)
    for i = 1, #self.data - 1, 1 do
        self:swap(i, i + 1)
    end
end

function Pile:reverse_rotate()
    for i = #self.data, 2, -1 do
        self:swap(i, i - 1)
    end
end

-- function Pile:reverse_rotate()
--     self:swap(1, #self.data)
--     for i = 2, #self.data - 1, 1 do
--         self:swap(i, j)
--     end
-- end

return Pile
