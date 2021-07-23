def reverser(str, &prc)
    prc.call(str.reverse!)
end

def word_changer(str, &prc)
    words = str.split(" ")
    new_words = []

    words.each { |word| new_words.push(prc.call(word))  }

    new_words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    result_1 = prc_1.call(num)
    result_2 = prc_2.call(num)
    
    if result_1 > result_2
        return result_1
    else
        return result_2
    end
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []

    arr.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            new_arr.push(ele)
        end
    end

    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []

    arr.each_with_index do |ele, i|
        if i.even?
            new_arr.push(prc_1.call(ele))
        else
            new_arr.push(prc_2.call(ele))
        end
    end

    new_arr
end