class Array
  def uniq
    result = []

    self.each { |el| result << el unless result.include?(el) }
    result
  end

  def two_sum
    indices = []
    self.each_with_index do |n1, idx1|
      self.each_with_index do |n2, idx2|
        indices << [idx1, idx2] if idx1 < idx2 && (n1 + n2 == 0)
      end
    end
    indices
  end
end