class Array
  def uniq
    result = []

    self.each_with_index do |el, i|
      temp = self[0...i] + self[i + 1..-1]
      result << el if temp.include?(el) && !result.include?(el)

    end

    result
  end
end