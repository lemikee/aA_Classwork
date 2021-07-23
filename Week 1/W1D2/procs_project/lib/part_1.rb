def my_map(arr, &prc)
    new_arr = []
    arr.each do |ele|
        new_arr.push(prc.call(ele))
    end

    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each do |ele|
        if prc.call(ele)
            new_arr.push(ele)
        end
    end

    new_arr
end

def my_count(arr, &prc)
        new_arr = []
    arr.each do |ele|
        if prc.call(ele)
            new_arr.push(ele)
        end
    end

    new_arr.length
end

def my_any?(arr, &prc)
            new_arr = []
    arr.each do |ele|
        if prc.call(ele)
            new_arr.push(ele)
        end
    end

    new_arr.length >= 1
end

def my_all?(arr, &prc)
    new_arr = []
    arr.each do |ele|
        if prc.call(ele)
            new_arr.push(ele)
        end
    end

    new_arr.length == arr.length
end

def my_none?(arr, &prc)
    new_arr = []
    arr.each do |ele|
        if prc.call(ele)
            new_arr.push(ele)
        end
    end

    new_arr.length == 0
end