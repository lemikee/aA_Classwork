class HumanPlayer

    def get_input
        puts "Enter a position in format '0 3'"
        move = gets.chomp.split.map(&:to_i)
    end

end
