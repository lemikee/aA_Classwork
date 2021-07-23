# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    peaks = []

    (0..arr.length - 1).each do |i|
        point_before = arr[i - 1]
        point = arr[i]
        point_after = arr[i + 1]

        if i == 0 && point > point_after
            peaks << point
        elsif i == arr.length - 1 && point_before < point
            peaks << point
        elsif point_before < point && point > point_after
            peaks << point
        end
    end

    peaks
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
