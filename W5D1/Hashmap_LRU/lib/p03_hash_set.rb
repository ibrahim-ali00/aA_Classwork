class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    unless self[num].include?(num)
      self[num] << num
      @count += 1
    end
    if @count == num_buckets
      resize!
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(num)
  end

  def remove(key)
    num = key.hash
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  private

  def [](num)
    i = num % num_buckets
    @store[i]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.flatten.each do |ele|
      self.insert(ele)
    end
  end
end
