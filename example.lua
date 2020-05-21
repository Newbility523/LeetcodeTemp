
local OPERA_IN = 0
local OPERA_OUT = 1

local Q = {
    data = {},
    maxLength = 0,
    head = 0,
    tail = 0,
    lastOpera = 0,

    -- func
    new = false,
    Init = false,
    Enqueue = false,
    Dequeue = false,
    Clear = false,
    Peek = false,
    Count = false,
    Contains = false,
    Contains = false,
    print = false,
}

local mt = {
    __index = function (t, k)
        print("not support index not exit value", k)
        return false
    end,

    __newindex = function (t, k, v)
        print("not support index not exit value 2", k)
        return false
    end
}

setmetatable(Q, mt)

function Q:new(lenght)
    self.maxLength = lenght
    self:Init()
end

function Q:Init()
    self.data = {}
    self.head = 1
    self.tail = 1 
    self.lastOpera = OPERA_OUT
end

function Q:Enqueue(item)
    self.data[self.tail] = item
    if self.head == self.tail and self.lastOpera == OPERA_IN then
        self.tail = self.tail % self.maxLength + 1
        self.head = self.head % self.maxLength + 1
        -- print("special add, head, tail", self.head, self.tail)
    else
        self.tail = self.tail % self.maxLength + 1
        -- print("normal add, head, tail", self.head, self.tail)
    end

    self.lastOpera = OPERA_IN
end

function Q()
    if self.head ~= self.tail or self.lastOpera == OPERA_IN then
        -- print("removing at ", self.head)
        local item = self.data[self.head]
        self.data[self.head] = false
        self.head = self.head % self.maxLength + 1
        -- print("now head, preTail, tail", self.head, self.tail)
        self.lastOpera = OPERA_OUT

        return item
    end

    return false
end

function Q:Clear()
    self:Init()
end

function Q:Peek()
    if self.head ~= self.tail or self.lastOpera == OPERA_IN then
        local item = self.data[self.head]

        return item
    end

    return false
end

function Q:Count()
    if self.head ~= self.tail then
        local length = self.tail - self.head
        length = length % self.maxLength

        return length
    else
        return self.lastOpera == OPERA_IN and self.maxLength or 0
    end
end

function Q:Contains(item)
    local length = self:Count()
    if length == 0 then
        return false
    else
        for k = 0, length - 1 do
            local realK = (self.head - 1 + k) % self.maxLength + 1
            if self.data[realK] == item then
                return true
            end
        end
    end

    return false
end

function Q:Contains(compare)
    local length = self:Count()
    if length == 0 then
        return false
    else
        local type = type(compare)
        local compareType = false
        if type == "table" or "number" then
            compareType = 0
        elseif type == "function" then
            compareType = 1
        end

        if not compareType then
            print("Error: wrong compare type")
            return 
        end

        for k = 0, length - 1 do
            local realK = (self.head - 1 + k) % self.maxLength + 1
            local item = self.data[realK]
            if compareType == 0 then
                if item == compare then
                    return true
                end
            elseif compareType == 1 then
                if compare(item) then
                    return true
                end
            end
        end
    end

    return false
end

function Q:print()
    local result = ""
    for i = 1, self.maxLength do
        local item = self.data[i]
        local output = item and item or "X"
        result = result .. output .. " "
    end

    print(result)
end

------

-- Q:new(5)

Q.a = 0
Q.maxLength = 1

-- print("i - input\no - output\nl - length\nf - find\ne - exit")

-- while true do
--     local type = io.read(1)
--     if type == "i" then
--         print("input:")
--         local input = io.read("*n")
--         if input then
--             Q:Enqueue(input)
--             Q:print()
--         end
--     elseif type == "o" then
--         Q:Dequeue()
--         Q:print()
--     elseif type == "l" then
--         print("lenght = ", Q:Count())
--     elseif type == "f" then
--         print("find:")
--         local input = io.read("*n")
--         if input then
--             print("exit = ", Q:Contains(input))
--         end
--     elseif type == "e" then
--         break
--     end

--     print("\n---------------------------")
-- end

print("a")






