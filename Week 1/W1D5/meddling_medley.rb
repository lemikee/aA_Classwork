# Phase 1: Modest problems.
# ------------------------------------

def duos(str)
    count = 0

    (0..str.length - 2).each do |i|
        count += 1 if str[i] == str[i + 1]
    end

    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence, hash)
    words = sentence.split(" ")
    new_words = []

    words.each do |word|
        if hash[word]
            new_words.push(hash[word])
        else
            new_words.push(word)
        end
    end

    new_words.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &prc_blk)
    result = {}

    hash.each do |key, value|
        new_key = prc_blk.call(key)
        new_value = prc.call(value)
        result[new_key] = new_value
    end

    result
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    multiple = []

    str.each_char do |char|
        multiple.push(char) if (str.count(char)) > 2
    end

    multiple.uniq
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    (0...str.length - 2).each do |i|
        first = str[i]
        second = str[i + 1]
        third = str[i + 2]
        if first == second && first == third
            return true
        end
    end

    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

# def energetic_encoding(str, hash)
#     new_str = ""

#     str.each_char.with_index do |char, i|
#         if hash[char]
#             str[i] = hash[char]
#         elsif char == " "
#             str[i] = " "
#         elsif !hash[char]
#             str[i] = "?"
#         end
#     end

#     str
# end

def energetic_encoding(str, hash)
    new_str = ""

    str.each_char.with_index do |char, i|
        if char == " "
            new_str += " "
        elsif hash[char]
            new_str += hash[char]
        else
            new_str += "?"
        end
    end

    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

# Phase 2: More difficult, maybe?
# ---------------------------------------

# def conjunct_select(arr, *prcs)
#     result = []

#     arr.each do |ele|
#         prcs.each do |prc|
#             if prc.call(ele) == false
#                 break
#             else
#                 result.push(ele) <-- problem is here! if true for just ONE, will push
#             end                  <-- instead, use .all?
#         end
#     end

#     result
# end

# def conjunct_select(arr, *prcs)
#     result = []
#     all_true = true
#     arr.each do |ele|
#         prcs.each do |prc|
#             if prc.call(ele) == false
#                 all_true = false
#                 break
#             end
#         end
#         result.push(ele) if all_true == true
#     end

#   result
# end


def conjunct_select(arr, *prcs)
    result = []

    arr.each do |ele|
        result.push(ele) if prcs.all? { |prc| prc.call(ele) }
    end

    result
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    words = sentence.split(" ")
    new_words = []

    words.each do |word|
        if word.length < 3
            new_words.push(word)
        elsif word[0].upcase == word[0]
            new_words.push(pig_word(word).capitalize)
        else
            new_words.push(pig_word(word))
        end
    end

    new_words.join(" ")
end

def pig_word(word)
    vowels = "aeiouAEIOU"

    if vowels.include?(word[0])
        return word + "yay"
    else
        first_vowel_idx = word.index(/[aeiouAEIOU]/)
        return word[first_vowel_idx..-1] + word[0...first_vowel_idx] + "ay"
    end

end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
    words = sentence.split(" ")
    new_words = []

    words.each do |word|
        if word.length < 3
            new_words.push(word)
        elsif word[0].upcase == word[0]
            new_words.push(reverb_word(word).capitalize)
        else
            new_words.push(reverb_word(word))
        end
    end

    new_words.join(" ")
end

def reverb_word(word)
    vowels = "aeiouAEIOU"

    if vowels.include?(word[-1])
        return word + word
    else
        last_vowel_idx = word.rindex(/[aeiouAEIOU]/, -1)
        return word[0..-1] + word[last_vowel_idx..-1]
    end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    true_eles = []

    arr.each do |ele|
        true_eles.push(ele) if prcs.any? { |prc| prc.call(ele) }
    end

    true_eles
end


longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sentence)
    words = sentence.split(" ")
    new_words = []
    vowels = "aeiouAEIOU"

    words.each_with_index do |word, i|
        if !word.index(/[aeiouAEIOU]/)
            new_words.push(word)
        elsif i.even?
            first_vowel_idx = word.index(/[aeiouAEIOU]/)
            new_word = word[0...first_vowel_idx] + word[first_vowel_idx + 1..-1]
            new_words.push(new_word)
        else
            last_vowel_idx = word.rindex(/[aeiouAEIOU]/, -1)
            new_word = word[0...last_vowel_idx] + word[last_vowel_idx + 1..-1]
            new_words.push(new_word)
        end
    end

    new_words.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    words = sentence.split(" ")

    words.map { |word| silly_word(word) }.join(" ")
end

def silly_word(word)
    vowels = "aeiouAEIOU"
    replacements = {
        "a"=>"aba",
        "e"=>"ebe",
        "i"=>"ibi",
        "o"=>"obo",
        "u"=>"ubu",
        "A"=>"Aba",
        "E"=>"Ebe",
        "I"=>"Ibi",
        "O"=>"Obo",
        "U"=>"Ubu"
    }
    if vowels.include?(word[-1])
        return word + word[-1]
    end

    word.each_char.with_index do |char, i|
        if replacements[char]
            word[i] = replacements[char]
        end
    end

    word
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"