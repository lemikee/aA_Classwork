require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count, :store

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if count == num_buckets
    if !include?(key)
      bucket(key).append(key, val)
      self.count += 1
    else
      bucket(key).first.val = val
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      self.count -= 1
    end
  end

  def each
    store.each do |bucket|
      bucket.each { |node| yield [node.key, node.val] }
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k} => #{v}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias [] get
  alias []= set

  private

  def num_buckets
    @store.length
  end

  def resize!
    store_clone = store
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    self.count = 0
    store_clone.flatten.each do |list|
      list.each { |node| set(node.key, node.val) }
    end
  end

  def bucket(key)
    store[key.hash % num_buckets]
  end
end
