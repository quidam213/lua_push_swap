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
    -- pass
end

function Algorithm:sort()
    error("sort: this function must be rewritten by the inheritance class.")
end

return Algorithm
