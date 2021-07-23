

def zip(*arrs)
    length = arrs.first.length
    zipped = Array.new(length, [])

    arrs.each do |subArray|
        subArray.each_with_index do |ele, idx|
            # if subArray.index(ele) == arrs.index(subArray)
            #     zipped[idx] << (ele)
            # end
            zipped[idx].push(ele)
        end
    end

    zipped
end

def prizz_proc(arr, prc_1, prc_2)
    true_eles = []

    arr.each do |ele|
        if (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele))
            true_eles.push(ele)
        end
    end

    true_eles
end

def zany_zip(*arrs)

end

def maximum(arr, &prc)
    largest = arr.first

    arr.each do |ele|
        largest = ele if prc.call(largest) <= prc.call(ele)
    end

    largest
end

def my_group_by(arr, &prc)
    mapping = Hash.new { |h, k| h[k] = [] }

    arr.each do |ele|
        result = prc.call(ele)
        mapping[result].push(ele)
    end

    mapping
end

def max_tie_breaker(arr, prc, &prc_block)
    largest = arr.first

    arr.each do |ele|
        prc_result = prc.call(ele)
        prc_block_result = prc_block.call(ele)

        if prc_block.call(largest) < prc_block.call(ele)
            largest = ele
        elsif prc_block.call(largest) == prc_block.call(ele)
            if prc_block.call(largest) < prc.call(ele)
                largest = ele
            end
        end

    end

    largest
end

def silly_syllables(sentence)
    words = sentence.split(" ")
    new_words = []


    words.each do |word|
        if word.chars.count { |char| "aeiouAEIOU".include?(char) } >= 2
            second_idx = word.rindex(/[aeiou]/, -1)
            first_idx = word.index(/[aeiouAEIOU]/)
            new_word = new_words.push(word[first_idx..second_idx])
        else
            new_words.push(word)
        end
    end

    new_words.join(" ")
end

