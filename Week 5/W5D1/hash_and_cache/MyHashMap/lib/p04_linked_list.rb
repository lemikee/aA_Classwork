class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

  def inspect; end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail, :list

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @list = []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    list.each do |node|
      return node.val if node.key == key
    end

    nil
  end

  def include?(key)
    list.any? { |node| node.key == key }
  end

  def append(key, val)
    node = Node.new(key, val)
    list << node
    
    tail.prev.next = node
    node.next = tail
    node.prev = tail.prev

    tail.prev = node
  end

  def update(key, val)
    list.each do |node|
      node.val = val if node.key == key
    end
  end

  def remove(key)
    target = nil
    list.each do |node|
      target = node if node.key == key
    end

    target.prev.next = target.next
    target.next.prev = target.prev
    list.delete(target)
  end

  def each(&block)
    list.each(&block)
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(', ')
  end
end
