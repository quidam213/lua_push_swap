-- ============================================================================
-- Logger.lua | dam | 2026-10-19
-- ============================================================================

local LogData = {}
LogData.__index = LogData

function LogData:new(data)
    local obj = setmetatable({}, LogData)
    obj.timestamp = os.time(os.date("!*t"))
    obj.data = data
    return obj
end

local Logger = {}
Logger.__index = Logger

function Logger:new()
    local obj = setmetatable({}, Logger)
    obj.entries = {}
    return obj
end

function Logger:add(data)
    table.insert(self.entries, LogData:new(data))
end

function Logger:display()
    for i = 1, #self.entries, 1 do
        local entry = self.entries[i]
        print("[" .. entry.timestamp .. "] - " .. entry.data)
    end
end

function Logger:clear()
    self.entries = {}
end

function Logger:to_string()
    local tmp = {}
    for i = 1, #self.entries, 1 do
        tmp[i] = self.entries[i].data
    end
    return table.concat(tmp, " ")
end

function Logger:count()
    return #self.entries
end

return Logger
