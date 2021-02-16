class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    output = 1
    self.each_with_index do |ele, idx|
      output *= (ele * idx + 1) ** (self.sum + idx)
    end
    output
  end
end

class String
  def hash
    output = 0
    arr = self.split("").map!(&:ord)
    arr.hash * self.length
    # arr.each_with_index do |ele, idx|
    #   output += (ele * idx + 1) ** (arr.sum + idx) if idx.even?
    # end
    #output
  end
end


class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
