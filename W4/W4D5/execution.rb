#phase 2 time complexity= O(n) b/c iterating once through loop
def my_min(list)
  i = 0
  min = list[0]
  while i < list.length - 1
    if list[i + 1] < min
      min = list[i + 1]
    end
    i += 1
  end
  min
end

def largest_contiguous_subsum(list)
  sub_arr = []
  sum = 0
  list.each_with_index do |ele, i|
    (i...list.length).each do |i2|
      sub_arr << list[i..i2]
    end
  end
  sub_arr.each do |arr|
    if arr.sum > sum
      sum = arr.sum
    end
  end
  sum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

list = [5, 3, -7]
p largest_contiguous_subsum(list)
