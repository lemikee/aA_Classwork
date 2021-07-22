# Recursion Exercises

def range(min, max)
    return [] if max <= min
    range(min, max - 1) << max - 1
end

# p range(5, 10)

def exp1(base, power)
    return 1 if power == 0
    base * exp1(base, power - 1)
end

def exp2(base, power)
    return 1 if power == 0
    return base if power == 1

    if power.even?
        base * exp2(base, power / 2) ** 2
    else
        base * (exp2(base, (power - 1) / 2) ** 2)
    end
end

def deep_dup(arr)
    return [arr] unless arr.is_a?
    deep_copy = []

    arr.each do |ele|
        deep_copy << deep_dup(ele)
    end

    deep_copy
end


# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# print robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

def fib(n)
    return [0] if n == 1
    return [0, 1] if n == 2
    return [] if n == 0

    previous_fib = fib(n - 1)
    last_fib = previous_fib[-1] + previous_fib[-2]
    previous_fib << last_fib
end

# puts fib(5)

def bsearch(array, target)
    return nil if arr.length < 1

    mid_idx = array.length / 2
    lower_half = array[0...mid_idx]
    upper_half = array[mid_idx + 1..-1]

    return mid_idx if array[mid_idx] == target

    if target < array[mid_idx]
        bsearch(lower_half, target)
    else
        result = bsearch(upper_half, target)

        if result.nil?
            return nil
        else
            lower_half.length + 1 + result
        end
    end
end

def merge_sort(arr)
    return arr if arr.length <= 1

    mid_idx = arr.length / 2
    left_side = arr[0...mid_idx]
    right_side = arr[mid_idx..-1]

    left = merge_sort(left_side)
    right = merge_sort(right_side)

    merge(left, right)
end

def merge(left, right)
    sorted = []

    until left.empty? || right.empty?
        if left.first < right.first
            sorted << left.shift
        else
            sorted << right.shift
        end
    end

    if left.empty?
        sorted.concat(right)
    else
        sorted.concat(left)
    end

    sorted
end

# p merge_sort([38,27,43,3,9,82,10])

def subsets(arr)
    return [[]] if arr.empty?
    return [ [], arr] if arr.length == 1

    subs = subsets(arr.take(arr.length - 1))
    subs += subs.map { |sub| sub + [arr.last] }
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(arr)
    return [arr] if arr.length <= 1

    result = []
    last_ele = arr.pop
    sub_perms = permutations(arr)

    sub_perms.each do |sub|
        (0..sub.length) do |i|
            result << sub[0...i] + [last_ele] + sub[i..-1]
    end

    result
end

p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
