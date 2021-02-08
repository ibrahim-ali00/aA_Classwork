require "byebug"

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if !prc.call(ele)
    end
    new_arr
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    counter = 0
    self.my_each do |ele|
      counter += 1 if prc.call(ele)
    end
    return true if counter == self.length
    false
  end

  def my_flatten
    #return [self] if !self.kind_of?(Array)
    new_arr = []
    # debugger
    self.my_each do |ele|
      if ele.kind_of?(Array)
        new_arr += ele.my_flatten
      else
        new_arr << ele
      end
    end
    new_arr
  end

  def my_zip(*sub_arrs)
    new_arr = [self] + sub_arrs

    output_arr = []
    i = 0
    while i < self.length
      sub_arr = []
      new_arr.my_each do |arr|
        sub_arr << arr[i]
      end
      output_arr << sub_arr
      i += 1
    end
    output_arr
  end

  # def my_rotate(val = 1)
  #     new_arr = []
  #     new_val = val % self.length
  #     self.my_each do |ele|
  #         new_arr << self[new_val]
  #         (new_val = (new_val + 1) % self.length)
  #     end
  #     return new_arr
  # end

  def my_rotate(val = 1)
    new_arr = self
    if val > 0
      val.times do
        new_arr << new_arr.shift
        # p new_arr
      end
    else
      val.abs.times do
        new_arr.unshift(new_arr.pop)
        # p new_arr
      end
    end
    new_arr
  end

  def my_join(new_char = "")
    new_str = ""
    self.my_each do |char|
      new_str += char + new_char
    end
    if new_char == ""
      return new_str[0...new_str.length]
    else
      new_str[0..(new_str.length - 2)]
    end
  end
end

a = ["a", "b", "c", "d"]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

a = ["a", "b", "c", "d"]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"
