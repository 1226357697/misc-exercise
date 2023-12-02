function ArrayEuqal(array1, array2)

    if type(array1) ~= "table" or type(array2) ~= "table" then
        return false
    end

    if #array1 ~= #array2 then
        return false
    end

    for i = 1, #array1 do
        if array1[i] ~= array1[i] then
            return false
        end
    end

    return true
end

function CopyArray(src, dest)
    if type(src) ~= "table" or type(dest) ~= "table" then
        return 
    end

    if #src == 0 then
        return
    end

    for i = 1, #src do
        dest[i] = src[i]
    end

end

function PrintArray(array, division)
    if division == nil then
        division = ' '
    end

    for i=1, #array do
        io.write(array[i])
        io.write(division)
    end
    io.write('\n')
end

function ArrayCompare(array, array2 )
    if type(array) ~= "table" or type(array2) ~= "table" then
        return  false
    end

    if #array ~=  #array2 then
        return false
    end

    for i = 1, #array do
        if type(array[i]) ~= type(array2[i]) then
            return false
        end

        if array[i] ~= array2[i] then
            return false
        end

    end

    return true            
end

function Arrayfind(array, index, ele)
    if type(array) ~= "table" then
        return -1
    end

    if #array == 0 then
        return -1
    end

    if type(ele) == "nil" then
        return -1
    end

    if type(array[1]) ~= type(ele) then
        return -1
    end

    if type(ele) == "table" then
        for i = index, #array do
            if ArrayCompare(array[i], ele) then
                return i
            end

        end

    else
        for i = index, #array do
            if array[i] == ele then
                return i
            end
        end
    end


    return -1
end

function Premutation(array, k, m, results)
    if k == m then
        local rsult = {}
        CopyArray(array, rsult)
        table.insert(results, rsult)

    else
        for i = k, m do
            array[i], array[k] = array[k], array[i]

            Premutation(array, k + 1, m, results)

            array[i], array[k] = array[k], array[i]
        end
    end
end

function ArrayRemoveDuplicates(array)
    local count = 0
    if type(array) ~= "table" then
        return count
    end

    for i = 1, #array do
        while true do
            local index = Arrayfind(array, i + 1, array[i])
            if index == -1 then
                break
            end
            table.remove(array, index)
            count = count + 1
        end
    end

    return count
end

function AllPremutation(array)
    local allrsult = {}
    Premutation(array, 1, #array, allrsult)
    ArrayRemoveDuplicates(allrsult)
    return allrsult
end

function PrintAllPremutation(results)
    print(#results)
    if type(results) ~= "table" or type(results[1]) ~="table" then
        return
    end

    for i, eles in ipairs(results) do
        PrintArray(eles)
    end
    
end

function StringToArray(str, array)
    array = {}
    for i = 1, string.len(str) do
        table.insert(array, tonumber(string.char(string.byte(str, i))))
    end
    return array
end

local str = io.read()
local array  = StringToArray(str)
local allpremutation = AllPremutation(array)
PrintAllPremutation(allpremutation)


