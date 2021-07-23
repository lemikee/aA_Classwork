# require_relative "./game.rb"


class HumanPlayer
    attr_accessor :invalid_move_counter

    def initialize
        @invalid_move_counter = 0
    end

    def get_input
        puts "Enter a position in format '0 3' (or 'q' to exit the game)" if invalid_move_counter == 0
        move = gets.chomp
        num_of_integers = move.count('0123456789')

        exit (0) if move == "q" || move == "Q"

        formatted_move = move.split.map(&:to_i)
        valid_range = formatted_move.all? { |num| num.between?(0, 3) }

        if formatted_move.length != 2 || num_of_integers != 2 || !valid_range
            self.invalid_move_counter += 1
            puts "Invalid format. Please try again below."

            get_input
        else
            self.invalid_move_counter = 0
            formatted_move
        end
    end
end
