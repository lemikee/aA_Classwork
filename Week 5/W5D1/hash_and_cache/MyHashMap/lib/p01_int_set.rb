class MaxIntSet
  attr_reader :max
  attr_accessor :store

  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0, max)
  end

  def validate!(num)
    include?(num) && is_valid?(num)
  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % 20
    store[bucket] << num unless store[bucket].include?(num)
  end

  def remove(num)
    bucket = num % 20
    store[bucket].delete(num)
  end

  def include?(num)
    bucket = num % 20
    store[bucket].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if self.count == num_buckets
    if !include?(num)
      self[num] << num 
      self.count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num) 
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    bucket = num % num_buckets
    store[bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_clone = self.store
    @store = Array.new(num_buckets * 2) { Array.new }
    self.count = 0
    store_clone.flatten.each { |ele| self.insert(ele) }
  end
end
