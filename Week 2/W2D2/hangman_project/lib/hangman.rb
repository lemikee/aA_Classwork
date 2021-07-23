class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    indices = []

    @secret_word.each_char.with_index {  |str_char, i| indices << i if char == str_char }

    indices
  end

  def fill_indices(char, indices)
      indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char


    indices = get_matching_indices(char)
    fill_indices(char, indices)

    @remaining_incorrect_guesses -= 1 if indices.empty?

    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if guess_word == @secret_word.chars
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
