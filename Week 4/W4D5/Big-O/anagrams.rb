# When we're writing code, we're concerned with how fast it is - but what does it mean to be faster? ie algo A is "faster" than algo B
#   What we can control/optimize for is:
#     (1) number of steps
#     (2) input size - can control


#     def add_ten(num1, num2)
#       suppose num2 is always 10
#       num1 = num1 + num2 #time complexit is O(4) --> O(1)
#     end

#     add_ten(any_num, 10)

#Rules are:
  # constants go to 1
    # 5794375n^2 --> 1 * n^2 --> n^2
  # loops n * number of steps in each loop
    # n represents the input size
    # array.each do |ele| n * ( 3 + 2 ) --> n + 5 --> O(n)
    #   ele = ele + 10 # ( +3 )
    #   ele / 50 # ( +2 )
    # end
  # how to count steps
    # all one step
      # +
      # -
      # *
      # /
      # <, > <=m >=
      # ==, !=, &&, ||
      # memory access and reassignment
        # def say_name(name)
        #   name --. O(1)
        # end

        # say_name("Jim")

# Big(O) Classifications
# O(1) -- constant --> ie, algo adds a number, just calls a value
# O(logn) -- log   --> ie, cutting an array in half, so never iterating over the entire array
# O(n) -- linear   --> ie iterating over an array
# O(nlogn) -- loglinear/super linear --> most sorting algo, merge_sort/quick_sort
# O(n^2) --> quadratic --> two nest loops
# ---------------^ try to stay above this
# O(n^num) --> polynomial --> num number of nested loops
# O(2^n) --> subsets
# O(n!) --> permutations




# str1 = "abcde"
# str2 = "abced"

def anagrams(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2
end

def anagrams(str1, str2)
  hash = Hash.new(0)

  str1.each_char { |char| hash[char] += 1 }
  str2.each_char { |char| hash[char] -= 1 }

  hash1.values.all?(0)
end

# O(n) - because the loops are not nested, so n + n

# def two_sum?(arr, target_sum)
#     arr.each_with_index do |num1, idx1|
#       arr.each_with_index do |num2, idx2|
#         return true if idx1 < idx 2 && num1 + num2 == target_sum
#       end
#     end

#     false
# end


# O(n^2) --> nested loops
arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
  numbers = {}

  # numbers = {
  #   0 => true
  #   1 => true
  #   5 => true
  #   7 => true
  # }

  arr.each { |num| numbers[num] = true } # puts all of our numbers in an array

  arr.each do |num|
    return true if numbers[target_sum - num] # checks if we have the complement of num
  end

  false
end

# O(n)

# hashes are great because we can associated values through key value pairs
# look up/search time is instant, cost us nothing in time complexity

# def palindrome(str)
#   str == str.reverse
#    1 + 1  + ^ O(n)
# end

# def palindrome(str)
#   str_reverse = str.reverse
#   str == str_reverse
# end

# def anagrams(str1, str2)
#   str1.sort == str2.sort
# end


class animal
dfsgsfg
end


class dog < animal
gsfdgsdf
gsfdgsdfg
end

class fidgo < dog
fgfsdg
end

fgfsdg

# super()
# super(arg, arg2)
# super
