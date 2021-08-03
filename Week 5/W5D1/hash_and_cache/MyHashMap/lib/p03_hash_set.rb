class HashSet
  attr_accessor :store, :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if self.count == num_buckets
    if !include?(key)
      self[key.hash] << key
      self.count += 1
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      self.count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
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
