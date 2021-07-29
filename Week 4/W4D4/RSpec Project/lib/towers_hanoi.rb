class TowersHanoi
  attr_reader :num_discs, :stacks

  def initialize(num_discs)
    @num_discs = num_discs
    stack1 = (1..num_discs).to_a.reverse
    @stacks = [ stack1, [], [] ]
  end

  def play
    won?
    move
  end

  def won?
    ""
  end

  def move
    ""
  end
end