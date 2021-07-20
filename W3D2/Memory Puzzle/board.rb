require_relative "./card.rb"

class Board
    attr_reader :size
    def initialize(size=4)
        @grid = Array.new(size) { Array.new(size, "") }
        @size = size
        populate
    end

    def [](pos)
        row, col= pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def populate
        pairs = ( size ** 2 ) / 2
        deck = Card.assign(pairs).shuffle

        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                pos = [i, j]
                self[pos] = deck.shift
            end
        end
    end

    def won?
        @grid.flatten.all? {|card| card.face }
    end

    def reveal(guess_pos)
        card = self[guess_pos]
        card.face = true unless card.face
        render
        card.value
    end

    def render
        puts "  #{(0...size).to_a.join(" ")}"
        @grid.each_with_index { |row, i| puts "#{i} #{row.join(" ")}" }
    end
end

b = Board.new
b.render
