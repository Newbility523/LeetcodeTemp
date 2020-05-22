local mt = {
    __index = function (t, k)
        print("not support index not exit value", k)
        return false
    end,

    __newindex = function (t, k, v)
        print("not support index not exit value 2", k)
    end
}

local OPERA_IN = 0
local OPERA_OUT = 1

local data = {}
local maxLength = 0
local head = 0
local tail = 0
local lastOpera = 0

local Q = {}

function Q.new(lenght)
    maxLength = lenght
    Q.Init()
end

function Q.Init()
    data = {}
    head = 1
    tail = 1 
    lastOpera = OPERA_OUT
end

function Q.Enqueue(item)
    data[tail] = item
    if head == tail and lastOpera == OPERA_IN then
        tail = tail % maxLength + 1
        head = head % maxLength + 1
        -- print("special add, head, tail", head, tail)
    else
        tail = tail % maxLength + 1
        -- print("normal add, head, tail", head, tail)
    end

    lastOpera = OPERA_IN
end

function Q.Dequeue()
    if head ~= tail or lastOpera == OPERA_IN then
        -- print("removing at ", head)
        local item = data[head]
        data[head] = false
        head = head % maxLength + 1
        -- print("now head, preTail, tail", head, tail)
        lastOpera = OPERA_OUT

        return item
    end

    return false
end

function Q.Clear()
    Q.Init()
end

function Q.Peek()
    if head ~= tail or lastOpera == OPERA_IN then
        local item = data[head]

        return item
    end

    return false
end

function Q.Count()
    if head ~= tail then
        local length = tail - head
        length = length % maxLength

        return length
    else
        return lastOpera == OPERA_IN and maxLength or 0
    end
end

function Q.Contains(item)
    local length = Q.Count()
    if length == 0 then
        return false
    else
        for k = 0, length - 1 do
            local realK = (head - 1 + k) % maxLength + 1
            if data[realK] == item then
                return true
            end
        end
    end

    return false
end

function Q.Contains(compare)
    local length = Q.Count()
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
            local realK = (head - 1 + k) % maxLength + 1
            local item = data[realK]
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

function Q.print()
    local result = ""
    for i = 1, maxLength do
        local item = data[i]
        local output = item and item or "X"
        result = result .. output .. " "
    end

    print(result)
end

Q = setmetatable(Q, mt)
-- Q.new(5)

-- print("i - input\no - output\nl - length\nf - find\ne - exit")

-- while true do
--     local type = io.read(1)
--     if type == "i" then
--         print("input:")
--         local input = io.read("*n")
--         if input then
--             Q.Enqueue(input)
--             Q.print()
--         end
--     elseif type == "o" then
--         Q.Dequeue()
--         Q.print()
--     elseif type == "l" then
--         print("lenght = ", Q.Count())
--     elseif type == "f" then
--         print("find:")
--         local input = io.read("*n")
--         if input then
--             print("exit = ", Q.Contains(input))
--         end
--     elseif type == "e" then
--         break
--     end

--     print("\n---------------------------")
-- end

return Q
