require "benchmark"

def my_min1(arr)
  # arr = [0, 3, 5, 4, -5, 10, 1, 90]
  
  arr.each do |ele1|
    if (arr - [ele1]).all? { |ele2| ele1 < ele2 }
      return ele1
    end
  end
end

# [ 7, 2 , 4 , 1, 11]
# puts Benchmark.measure { my_min1}

def my_min2(arr)
  min = arr[0]
  arr.each do |ele|
    min = ele if ele < min
  end
  return min
end
# puts Benchmark.measure { my_min1 }

# arr = (1..9999).to_a.shuffle
# arr = (1..9999).to_a
# arr = (1..9999).to_a.reverse


# Benchmark.bm do |x|
#   x.report { my_min1(arr)}
#   x.report { my_min2(arr)}
# end

def sub_sum1(arr)
  sums = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      sums << arr[i..j]
    end
  end
  sums.map {|ele| ele.sum }.max
end

def sub_sum2(arr)
  max_sum = 0
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      current = arr[i..j].sum
      max_sum = current if max_sum < current
    end
  end
  max_sum
end


def sub_sum3(arr) # [2, 3, -6, 7, -6, 7]
  sum = arr[0]  # 2
  i = 1
  max = arr[0] # 2
  while i < arr.length 
    if sum + arr[i] > arr[i]
      sum += arr[i]
    else
      sum = arr[i]
    end
    max = sum if sum > max
    i += 1
  end
  max
end



# list = [2, 3, -6, 7, -6, 7]
# p sub_sum2(list)


arr = (-500..500).to_a.shuffle

Benchmark.bm do |x|
    x.report { sub_sum1(arr)}
    x.report { sub_sum2(arr)}
    x.report { sub_sum3(arr)}
  end


  


