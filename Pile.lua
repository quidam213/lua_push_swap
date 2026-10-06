-- ============================================================================
-- Pile.lua | dam | 2026-10-05
-- ============================================================================

local Pile = {}
Pile.__index = Pile

function Pile:new()
    self = setmetatable({}, Pile)
    self.data = {}
    return self
end

function Pile:newFrom(list)
    self = setmetatable({}, Pile)
    for i = #list, 1, -1 do self:add(list[i]) end
    return self
end

function Pile:display()
    print(table.concat(self.data, " "))
end

function Pile:add(x)
    assert(x ~= nil, "add: nil value entered.")
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
    if i1 < 1 or i1 > #self.data then
        do return end
    end
    if i2 < 1 or i2 > #self.data then
        do return end
    end
    self.data[i1], self.data[i2] = self.data[i2], self.data[i1]
end

function Pile:rotate()
    for i = 1, #self.data - 1, 1 do
        self:swap(i, i + 1)
    end
end

function Pile:reverse_rotate()
    for i = #self.data, 2, -1 do
        self:swap(i, i - 1)
    end
end

return Pile
