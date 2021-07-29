require 'first_tdd'

describe Array do
  describe "#uniq" do
    it "should remove duplicates from an array" do
      expect([1, 2, 1, 3, 3].uniq).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions who elements sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#tranpose" do
    let(:array) {
      rows = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ] 
    }
    it "switches the rows and columns of two-dimensional array" do
      let(:tranposed) {
        rows = [
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8]
        ]
      }
      expect(array.tranpose)to eq(tranposed)
    end
    it "all rows should be of equal length" do
      
    end
  end
end