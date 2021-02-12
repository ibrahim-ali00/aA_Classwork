require "byebug"
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

#Phase 1 : O(n^3) because using .sum on sub_arr, which is n^2

def largest_contiguous_subsum_one(list)
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

# O(n) time b/c interation done once
def largest_contiguous_subsum_two(list)
  largest_sum = list[0]
  current_sum = 0
  # list.inject {|acc, ele| acc + ele}
  list.each do |ele|
    current_sum = [ele, current_sum + ele].max
    largest_sum = [largest_sum, current_sum].max
  end
  largest_sum
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_two(list)
