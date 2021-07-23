def element_count(arr)
    counter = Hash.new(0)

    arr.each { |ele| counter[ele] += 1 }

    counter
end

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash[char]
            new_char = hash[char]
            str[i] = new_char
        end
    end

    str
end

def product_inject(nums)
    nums.inject do |acc, num|
        acc * num
    end
end