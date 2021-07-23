class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }


  def self.valid_pegs?(chars)
    chars.all? { |char| Code::POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "invalid pegs!"
    end
  end

  def self.random(length)
    new_arr = Array.new (length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(new_arr)
  end

  def self.from_string(peg_str)
    chars = peg_str.chars
    Code.new(chars)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.pegs.length).count { |i| guess.pegs[i] == @pegs[i] }

  end

  def num_near_matches(guess_code)
    code_dup = @pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(instance)
    instance.pegs == self.pegs
  end


end