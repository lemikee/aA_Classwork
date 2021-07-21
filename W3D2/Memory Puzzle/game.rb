require_relative "board.rb"
require_relative "card.rb"
require_relative "human_player.rb"

class Game
    attr_reader :prev_guess

    def initialize(size=4)
        @board = Board.new(size)
        @player = HumanPlayer.new
        @prev_guess = nil
    end

    def make_guess(pos)
        # pos = @player.get_input
        if prev_guess == nil
            @prev_guess = @board[pos] # haven't made a guess before, so prev_guess is = to card instance at pos
            @prev_guess.face = true
            # @board.render
        else
            if @board[pos].value.to_s == @prev_guess.value.to_s # if they have made a guess before, then prev_guess = card_instance
                @board[pos].face = true
                @prev_guess.face = true
                # @board.render
            else
                @board[pos].face = true
                @board.render
                sleep(2)
                @board[pos].face = false
                @prev_guess.face = false
                # @board.render

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

        puts "You win!"
    end
end

Game.new(4).play