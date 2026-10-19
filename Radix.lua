-- ============================================================================
-- Radix.lua | dam | 2026-10-07
-- ============================================================================

local Algorithm = require("Algorithm")

local Radix = setmetatable({}, {__index = Algorithm})
Radix.__index = Radix

function Radix:get_min()
    local pile = self.ps.pile_a.data
    local min = pile[1]
    for i = 2, #pile, 1 do
        if min > pile[i] then
            min = pile[i]
        end
    end
    return min
end

function Radix:get_max()
    local pile = self.ps.pile_a.data
    local max = pile[1]
    for i = 2, #pile, 1 do
        if max < pile[i] then
            max = pile[i]
        end
    end
    return max
end

function Radix:set_offset(offset)
    assert(type(offset) == "number")
    for i = 1, #self.ps.pile_a.data, 1 do
        self.ps.pile_a.data[i] = self.ps.pile_a.data[i] + offset
    end
end

function Radix:setup()
    local min = self:get_min()
    self.offset = min < 0 and -min or 0
    self:set_offset(self.offset)
    self.max = self:get_max()
end

function Radix:sort()
    self:setup()
    local pa = self.ps.pile_a
    local pb = self.ps.pile_b
    local bit_idx = 0
    while (not self:is_sorted()) do
        for _ = 1, #pa.data, 1 do
            local val = pa:get_first()
            local bit = (val >> bit_idx) & 1
            if bit == 1 then
                self.ps:ra()
            else
                self.ps:pb()
            end
        end
        while #pb.data > 0 do
            self.ps:pa()
        end
        bit_idx = bit_idx + 1
    end
    self:set_offset(-self.offset)
end

return Radix
