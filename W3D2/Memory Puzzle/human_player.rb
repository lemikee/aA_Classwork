# require_relative "./game.rb"


class HumanPlayer
    @@INVALID_INPUT_COUNTER = 0

    def self.increment_counter
        @@INVALID_INPUT_COUNTER += 1
    end

    def self.reset_counter
        @@INVALID_INPUT_COUNTER = 0
    end

    def get_input
        puts "Enter a position in format '0 3' (or 'q' to exit the game)" if @@INVALID_INPUT_COUNTER == 0
        move = gets.chomp
        num_of_integers = move.count('0123456789')

        exit (0) if move == "q" || move == "Q"

        formatted_move = move.split.map(&:to_i)
        valid_range = formatted_move.all? { |num| num.between?(0, 3) }

        if formatted_move.length != 2 || num_of_integers != 2 || !valid_range
            HumanPlayer.increment_counter
            puts "Invalid format. Please try again below."

            get_input
        else
            HumanPlayer.reset_counter
            formatted_move
        end
    end
end
