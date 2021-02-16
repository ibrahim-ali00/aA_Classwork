class Array
  def my_uniq
    new_array = []
    self.each do |ele|
      new_array << ele if !new_array.include?(ele)
    end
    new_array
  end

  def two_sum
    results = []

    (0...self.length - 1).each do |i|
      (i + 1...self.length).each do |j|
        results << [i, j] if self[i] + self[j] == 0
      end
    end
    results
  end
end

def my_transpose(arr)
  results = Array.new(arr.length) { Array.new(arr.length) }
  arr.each_with_index do |sub, i|
    sub.each_with_index do |ele, j|
      results[j][i] = ele
    end
  end
  results
end


def stock_picker(arr)
  results = []
  i = 0
  first = arr.min
  last = arr.max

  results.push(arr.index(first), arr.index(last))
  results
end