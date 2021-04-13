class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str = ""
    self.each do |ele|
      str += ele.to_s
    end
    str.to_i
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a 
    arr = []
    self.each_char do |char|
      arr << alphabet.index(char)
    end
    arr.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    copy = self.sort_by { |k, v| k }
    
    new_arr = []
    copy.each do |ele|
      ele.each do |el2|
        new_arr << el2.to_s.hash
      end
    end
      new_arr.hash
  end
  
end
