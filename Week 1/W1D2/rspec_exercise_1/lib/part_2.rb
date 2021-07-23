def hipsterfy(word)
    vowels = "aeiou"

    (0..word.length - 1).to_a.reverse_each do |i| # range DOESN'T have a reverse method, but arrays do
        char = word[i]                             # can also just do 200.downto(1)
                                                    # can also just do a while loop if you want, go for clean/simple/elegant soln. Can't figure out then do while loop
        if vowels.include?(char)
            return word[0...i] + word[(i + 1)..-1]
        end
    end

    word
end

def vowel_counts(str)
    str.downcase!
    counter = Hash.new(0)

    str.each_char { |char| counter[char] += 1 }

    counter
end

def caesar_cipher(message, n)
    newStr = ''
    alphabets = 'abcdefghijklmnopqrstuvwxyz'
    message.each_char do |char|
        alphaIdx = alphabets.index(char) # char is not guarenteed to be in alphabets, if it is not then alphaIdx = nil
        newIdx = n # nil + number
        newChar = alphabets[newIdx % alphabets.length]
        if alphabets.include?(char)
            newStr += newChar
        else
            newStr += char
        end
    end
    newStr
end