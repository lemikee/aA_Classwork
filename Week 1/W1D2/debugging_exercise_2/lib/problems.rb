# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

# require "byebug"

def isPrime?(num)
    return false if num < 2

    (2...num).each { |factor| return false if num % factor == 0}

    true
end

def largest_prime_factor(num)
    (2..num).to_a.reverse_each do |divisor|
        if num % divisor == 0 && isPrime?(divisor)
            return divisor
        end
    end
end

def unique_chars?(str)
    counter = Hash.new(0)

    str.each_char { |char| counter[char] += 1 }

    counter.each { |key, value| return false if value >= 2 }

    true
end

def dupe_indices(arr)
    indicies = Hash.new { |hash, key| hash[key] = [] } # format for creating hashes w/ "complex" default values
    duplicates = {}

    arr.each_with_index do |char, i| # iterate through arr and for each char, we push the indicies as values in the array(default value becaus of L 34)
        indicies[char].push(i)
    end

    indicies.each do |key, value| # better to do Hash.select { |char, arr| arr.length >= 2 }
        if value.length >= 2    # now for each value that has more than 1 indicie (so will be duplicate char), we push key-value to a new Hash, duplicates
            duplicates[key] = value
        end
    end

    duplicates
end

def ana_array(arr_1, arr_2)
    return false if arr_1.length != arr_2.length
    
    arr_dupes_1 = dupe_indices(arr_1)
    arr_dupes_2 = dupe_indices(arr_2)

    arr_dupes_1.each do |key, value|
        if !(arr_dupes_2.has_key?(key) && arr_dupes_2[key].length == value.length)
            return false
        end
    end

    true
end
