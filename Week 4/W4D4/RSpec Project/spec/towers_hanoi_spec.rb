require 'towers_hanoi'

describe TowersHanoi do
  let(:tower) { TowersHanoi.new(3) }

  describe "#initialize" do
    it "creates an instance variable num_discs and sets to given arg" do
      expect(tower.num_discs).to eq(3)
    end

    it "creates instance variable for stacks of size 3" do
      expect(tower.stacks).to eq( [[3, 2, 1], [], []] )
    end

    it "creates instance variable for stacks of size 5" do
      tower5 = TowersHanoi.new(5)
      expect(tower5.stacks).to eq( [[5, 4, 3, 2, 1], [], []] )
    end

    
  end

  describe "#play" do
    
    it "calls on #won?" do
      expect(tower).to receive(:won?)
      tower.play
    end

    it "calls on #move?" do
      expect(tower).to receive(:move)
      tower.play
    end
  end
end
