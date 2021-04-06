class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  #   return_value = [1, 2, 3].my_each do |num|
  #     puts num
  #   end.my_each do |num|
  #     puts num
  #   end
  #   # => 1
  #   2
  #   3
  #   1
  #   2
  #   3

  #   p return_value  # => [1, 2, 3]
  def my_select(&prc)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  #   p a = [1, 2, 3]
  #   p a.my_select { |num| num > 1 } # => [2, 3]
  #   p a.my_select { |num| num == 4 } # => []
  def my_reject(&prc)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if !prc.call(ele)
    end
    new_arr
  end

  def my_any?(&prc)
    self.my_each { |ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.my_each { |ele| return false if !prc.call(ele) }
    true
  end

  #   a = [1, 2, 3]
  #   p a.my_any? { |num| num > 1 } # => true
  #   p a.my_any? { |num| num == 4 } # => false
  #   p a.my_all? { |num| num > 1 } # => false
  #   p a.my_all? { |num| num < 4 } # => true

  def my_flatten
    new_arr = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        new_arr += ele.my_flatten
      else
        new_arr << ele
      end
    end
    new_arr
  end

  # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
  def my_zip(*arg)
    new_arr = []
    final_arr = []
    (0...self.length).each do |idx|
      new_arr = [self[idx]]
      arg.my_each do |arr|
        if arr[idx].nil?
          new_arr << nil
        else
          new_arr << arr[idx]
        end
      end
      final_arr << new_arr
    end
    final_arr
  end

  def my_rotate(num = 1)
    result = self.dup
    # self.my_each do |ele|
    num.abs.times do
      if num > 0
        rev = result.reverse
        rev.unshift(rev.pop)
        result = rev.reverse
      else
        result.unshift(result.pop)
      end
    end
    # end
    # (0..num).each do |idx|
    #     self[idx],self[idx+1]
    return result
  end

  def my_join(separator = "")
    joined = ""
    self.each do |ele|
      joined += ele + separator
    end
    if separator != ""
      return joined[0...joined.length - 1]
    end
    joined
  end

  def my_reverse
    reverse = []
    i = self.length - 1
    while i >= 0
      reverse << self[i]
      i -= 1
    end
    reverse
  end
end
