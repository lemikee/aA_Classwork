require_relative "./card.rb"

class Board
    attr_reader :size, :grid
    attr_accessor :round
    def initialize(size)
        @grid = Array.new(size) { Array.new(size, " ") }
        @size = size
        @round = 1
        self.populate
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def populate
        pairs = (size ** 2) / 2
        deck = Card.assign(pairs).shuffle

        @grid[0][0] = Card.new("0", true) if self.size.odd?

        @grid.each_with_index do |row, i|
            row.each_with_index do |el, j|
                unless i == 0 && j == 0 && self.size % 2 != 0
                    pos = [i, j]
                    self[pos] = deck.pop
                end
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
        system("clear")
        if @round == 1
            puts "Welcome to Memory Puzzle!"
            puts "Written by Mike Le and Yu-Huan Wu"
            puts
            @round += 1
        else
            puts "Round #{self.round}"
            puts
        end
        puts "  #{(0...size).to_a.join(" ")}"
        @grid.each_with_index { |row, i| puts "#{i} #{row.join(" ")}" }
        puts
    end
end