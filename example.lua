local Q = {
    data = {},
    maxLenght = 0,
    head = 0,
    tail = 0,
    preTail = 0,
}

function Q:new(lenght)
    self.data = {}
    self.maxLenght = lenght
    self.head = 1
    self.tail = 1
    self.preTail = 1
end

function Q:Enqueue(item)
    self.data[self.tail] = item
    if (self.preTail % self.maxLenght + 1 ~= self.head) or  then
        self.preTail = self.tail
        self.tail = self.tail % self.maxLenght + 1
        print("normal add, head, preTail, tail", self.head, self.preTail, self.tail)
    else
        self.preTail = self.tail
        self.tail = self.tail % self.maxLenght + 1
        self.head = self.head % self.maxLenght + 1
        print("special add, head, preTail, tail", self.head, self.preTail, self.tail)
    end
end

function Q:Dequeue()
    if self.head ~= self.tail then
        print("removing at ", self.head)
        local item = self.data[self.head]
        self.data[self.head] = false
        self.head = self.head % self.maxLenght + 1
        print("now head, preTail, tail", self.head, self.preTail, self.tail)
        return item
    end

    return false
end

function Q:print()
    local result = ""
    for i = 1, self.maxLenght do
        local item = self.data[i]
        local output = item and item or "X"
        result = result .. output .. " "
    end

    print(result)
end

------

Q:new(5)

print("i - input\no - output\ne - exit")

while true do
    local type = io.read(1)
    if type == "i" then
        print("input:")
        local input = io.read("*n")
        if input then
            Q:Enqueue(input)
            Q:print()
        end
    elseif type == "o" then
        Q:Dequeue()
        Q:print()
    elseif type == "e" then
        break
    end

    print("\n---------------------------")
end






