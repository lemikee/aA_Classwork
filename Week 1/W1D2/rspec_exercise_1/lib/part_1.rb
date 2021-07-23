def average(num_1, num_2)
    sum = num_1 + num_2
    return sum / 2.0
end

def average_array(arr)
    arr.sum / (arr.length * 1.0) # better more efficent code. Multiply by 1.0 to turn into decimal 
    # arr.inject() { |acc, ele| acc + (ele * 1.0) } / arr.length
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
    
    capped = words.map.with_index do |word, i|
        if i.even?
            word.upcase
        else
            word.downcase
        end
    end

    capped.join(" ")
end