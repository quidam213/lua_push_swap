-- ============================================================================
-- Parser.lua | dam | 2026-10-07
-- ============================================================================

function ParseArguments(arg)
    local list = {}
    for i = 1, #arg do
        local value = tonumber(arg[i])
        assert(value ~= nil, "parser: [" .. i .. " - ".. arg[i] .. "] is not a number.")
        table.insert(list, value)
    end
    return list
end
