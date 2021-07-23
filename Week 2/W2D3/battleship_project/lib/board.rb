class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = (n * n)
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, ele)
        row, col = pos
        @grid[row][col] = ele
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(pos)
        row, col = pos

        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        percent = @size / 4

        while num_ships < percent
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            pos = [row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def self.print_grid(arr)
        arr.each { |row| puts row.join(" ") }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end




end
