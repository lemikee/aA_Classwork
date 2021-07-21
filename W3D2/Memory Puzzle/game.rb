require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"

class Game
    attr_reader :prev_guess

    def initialize(size=4)
        @board = Board.new(size)
        @player = HumanPlayer.new
        @prev_guess = nil
        @previous_pos = []
    end

    def make_guess(pos)
        if @prev_guess == nil
            @prev_guess = @board[pos]
            @prev_guess.face = true

        else
            if @board[pos].value.to_s == @prev_guess.value.to_s
                @board[pos].face = true
                @prev_guess.face = true
                # @board.render
            else
                @board[pos].face = true
                @board.render

                puts "Try again!"
                sleep(0.75)
                print "...in 2 seconds"
                sleep(0.75)
                print "...in 1 second"
                sleep(0.75)

                @board[pos].face = false
                @prev_guess.face = false
            end
            @prev_guess = nil
        end

    end

    def play
        until @board.won?
            @board.render
            pos = @player.get_input
            self.make_guess(pos)
        end
        puts
        @board[pos].face = true
        @board.render
        puts "You win!"
    end
end

Game.new(4).play