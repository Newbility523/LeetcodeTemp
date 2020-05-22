package.path = package.path ..';E:\\LuaTest\\?.lua';
-- print(package.path)
local q = require("example")
local q = require("example")

local size = 1000
local testSize = 100000

-- if q then
--     print("module include")
--     q.new(5)
--     print("i - input\no - output\nl - length\nf - find\ne - exit")
--     while true do
--         local type = io.read(1)
--         if type == "i" then
--             print("input:")
--             local input = io.read("*n")
--             if input then
--                 q.Enqueue(input)
--                 q.print()
--             end
--         elseif type == "o" then
--             q.Dequeue()
--             q.print()
--         elseif type == "l" then
--             print("lenght = ", q.Count())
--         elseif type == "f" then
--             print("find:")
--             local input = io.read("*n")
--             if input then
--                 print("exit = ", q.Contains(input))
--             end
--         elseif type == "e" then
--             break
--         end

--         print("\n---------------------------")
--     end
-- else
--     print("module empty")
-- end
print(collectgarbage("collect"))
q.new(size)
local t1 = os.time()
local t2 = false
for i = 1, testSize do
    for j = 1, size do
        q.Enqueue(1)
    end

    for j = 1, size do
        q.Dequeue()
    end
end

t2 = os.time()

print("queue", collectgarbage("count"))
print("queue", t2 - t1)

q = nil
print(collectgarbage("collect"))

local oriQueue = {}
t1 = os.time()
local cur = 1
for i = 1, testSize do
    for j = cur, cur + size - 1 do
        oriQueue[j] = i
    end

    for j = cur, cur + size - 1 do
        oriQueue[j] = nil
    end

    cur = cur + size
end
t2 = os.time()

print("oriQueue", collectgarbage("count"))
print("oriQueue", t2 - t1)
