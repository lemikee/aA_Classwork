class HumanPlayer

    def get_input
        puts "Enter a position in format '4 7'"
        move = gets.chomp.split.map(&:to_i)
    end

end
