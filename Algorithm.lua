-- ============================================================================
-- Algorithm.lua | dam | 2026-10-07
-- ============================================================================

local Algorithm = {}
Algorithm.__index = Algorithm

function Algorithm:new(ps)
    local obj = setmetatable({}, self)
    obj.ps = ps
    return obj
end

function Algorithm:is_sorted()
    if #self.ps.pile_b.data > 0 then
        return false
    end
    local a = self.ps.pile_a.data
    for i = 1, #a - 1, 1 do
        if (a[i] > a[i + 1]) then
            return false
        end
    end
    return true
end

function Algorithm:sort()
    error("sort: this function must be rewritten by the inheritance class.")
end

return Algorithm
