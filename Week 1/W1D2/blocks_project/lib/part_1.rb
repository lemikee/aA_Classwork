def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |subArray| subArray.sum > 0 }
    
    # arr_sum = arr.map do |subArray|
    #     subArray.inject { |acc, num| acc + num }
    # end

    # arr_sum.count { |sum| sum > 0 }
end

def aba_translate(str)
    chars = str.chars
    vowels = "aeiou"
    translated = ""

    chars.each do |char|
        if vowels.include?(char)
            translated += char + "b" + char
        else 
            translated += char
        end
    end

    translated
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end