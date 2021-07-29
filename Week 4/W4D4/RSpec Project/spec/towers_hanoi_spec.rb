require 'towers_hanoi'

describe TowersHanoi do
  let(:tower) { TowersHanoi.new(3) }

  describe "#initialize" do
    it "creates an instance variable num_discs and sets to given arg" do
      expect(tower.num_discs).to eq(3)
    end

    it "creates instance variable for stack 1" do
      expect(tower.stack1).to eq([3, 2, 1])
    end

    
  end
end
