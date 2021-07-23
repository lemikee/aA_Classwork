def palindrome?(str)
    chars = str.chars

    chars.each_with_index do |char, i|
        str_char = str[-i - 1]
        
        if char != str_char
            return false
        end
    end

    true
end

def substrings(str)
    substrings = []

    (0..str.length - 1).each do |start|
        (start..str.length - 1).each do |ending|
            substrings.push(str[start..ending])
        end
    end

    substrings
end

def palindrome_substrings(string)
    substrings = substrings(string)

    substrings.select do |sub|
        palindrome?(sub) && sub.length > 1
    end
end