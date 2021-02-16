class DynamicDeque < Deque

  attr_reader :max_volume

  def initialize(max)
    super()
    @max_volume = max
  end

  def middle
    return [] if self.blank?
    size.odd? ? [@concealed_array[size/2]] : [@concealed_array[(size/2) - 1], @concealed_array[size/2]]
  end

  def push_back(*items)
    if size + items.length > max_volume
      raise "deque is full" 
    else
      items.each { |item| super(item) }
    end
    size
  end

  def pop_front(n=1)
    popped = []
    n.times do
      popped << super()
    end
    popped
  end

end