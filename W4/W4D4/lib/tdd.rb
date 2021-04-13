def my_uniq(array)
  uniq = []
  array.each { |ele| uniq << ele unless uniq.include?(ele) }
  uniq
end

class Array
  def two_sum
    pairs = []
    (0...length).each do |i|
      (i + 1...length).each do |j|
        pairs << [i, j] if (self[i] + self[j]) == 0
      end
    end
    pairs
  end
end

def my_transpose(arr)
  transposed = []
  (0...arr.length).each do |i|
    new_sub = []
    arr.each do |sub|
      new_sub << sub[i]
    end
    transposed << new_sub
  end
  transposed
end

def stock_picker(stocks)
  max = 0
  pair = []
  stocks.each_with_index do |ele1, i|
    stocks.each_with_index do |ele2, j|
      if j > i && ele2 - ele1 > max
        max = ele2 - ele1
        pair = [i+1, j+1]
      end
    end
  end
  pair
end
