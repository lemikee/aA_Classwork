require_relative "./card.rb"

class Board
    def initialize(size=4)
        @grid = Array.new(size) { Array.new(size, "") }
    end

    def reveal(guess_pos)
        
    end
end
