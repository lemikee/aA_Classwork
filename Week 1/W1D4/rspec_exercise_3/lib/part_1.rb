def is_prime?(num)
    return false if num < 2

    (2...num).each do |i|
        return false if num % i == 0
    end

    true
end

def nth_prime(n)
    primes = []

    i = 2
    while primes.length < n
        primes.push(i) if is_prime?(i)

        i += 1
    end

    primes.last
end

def prime_range(min, max)
    primes = []

    i = min
    while i <= max
        primes.push(i) if is_prime?(i)

        i += 1
    end

    primes
end