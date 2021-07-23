require_relative "./code.rb"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        puts @secret_code.num_exact_matches(instance)
        puts @secret_code.num_near_matches(instance)
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess = gets.chomp
        chars_arr = Code.from_string(guess)
        puts @secret_code.num_near_matches(chars_arr)
        puts @secret_code.num_exact_matches(chars_arr)
        chars_arr == @secret_code
    end
end
