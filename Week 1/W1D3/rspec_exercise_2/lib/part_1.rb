# require "byebug"

def partition(arr, num)
    result_1 = []
    result_2 = []


    arr.each do |ele|
        if ele < num
            result_1.push(ele)
        else
            result_2.push(ele)
        end
    end

    [result_1, result_2]
end

def merge(hash_1, hash_2)
    merged = {}

    hash_1.each { |key, value| merged[key] = value }
    hash_2.each { |key, value| merged[key] = value }

    merged
end

def censor(sentence, curse_words)
    words = sentence.split(" ")
  

    censored = words.map do |word|
        if curse_words.include?(word.downcase)
            replace_vowels(word)
        else
            word
        end
    end

    censored.join(" ")
end

def replace_vowels(word)
    vowels = "aeiouAEIOU"
    no_vowels = ""

    word.each_char do |char|
        if vowels.include?(char)
            no_vowels += "*"
        else
            no_vowels += char
        end
    end

    no_vowels
end

def power_of_two?(num)

    (0...num).each do |i|
        if 2 ** i == num
            return true
        end
    end

    false
end

