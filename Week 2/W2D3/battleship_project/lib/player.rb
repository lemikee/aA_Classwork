class Player
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        guess = gets.chomp.split(" ").map(&:to_i)
        raise "invalid input" if guess.length != 2
        row = guess.first
        col = guess.last
        [row, col]
    end
end
