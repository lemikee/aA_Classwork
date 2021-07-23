def proper_factors(num)
    nums = []

    (1...num).each do |i|
        nums.push (i) if num % i == 0
    end

    nums
end

def aliquot_sum(num)
    nums = proper_factors(num)

    nums.sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    perfect_nums = []

    i = 1
    while perfect_nums.length < n
        perfect_nums.push(i) if perfect_number?(i)

        i += 1
    end
    perfect_nums
end