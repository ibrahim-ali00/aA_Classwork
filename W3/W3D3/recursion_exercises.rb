require "byebug"

def range(min, max)
  # array = (min...max).to_a
  return [] if min >= max
  range(min, max - 1) << max - 1
end

def array_sum(arr)
  return 0 if arr.length == 0
  arr[0] + array_sum(arr[1..-1])
end

def array_sum2(arr)
  sum = 0
  arr.each { |num| sum += num }
  sum
end

# robot_parts = [
#     ["nuts", "bolts", "washers",["iron"["steel"]]],
#     [["capacitors", "resistors", "inductors"],"diamond"]]

# robot_parts2 = robot_parts.dup

def exp(b, n)
  return 1 if n == 0
  b * exp(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  if n % 2 == 0
    exp2(b, n / 2) ** 2
  else
    b * (exp2(b, (n - 1) / 2) ** 2)
  end
end

def deep_dup(arr)
  arr.map do |ele|
    # return ele if arr.length == 1
    if ele.is_a?(Array)
      deep_dup(ele)
    else
      ele
    end
  end
end

# robot_parts = [
#     ["nuts", "bolts", "washers",["iron"["steel"]]],
#     [["capacitors", "resistors", "inductors"],"diamond"]]

# p deep_dup(robot_parts)
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# robot_parts_2 = deep_dup(robot_parts)

# p robot_parts[1].object_id
# p robot_parts_2[1].object_id

def fibonacci(num)
  return [0] if num == 1
  return [0, 1] if num == 2
  new_arr = []

  new_arr = fibonacci(num - 1)
  new_arr << new_arr[-1] + new_arr[-2]
end

def bsearch(arr, target)
  #debugger

  return nil if !arr.include?(target)
  mid = arr.length / 2
  return arr.index(arr[mid]) if arr[mid] == target
  if target > arr[mid]
    # sub_arr = arr[mid..-1]
    # bsearch(sub_arr, target)

    new_index = bsearch(arr[mid..-1], target)
    return new_index + mid
  else
    bsearch(arr[0...mid], target)
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3        [4, 5, 9]
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
  # debugger
  mid = array.length / 2
  return array[0] if array.length <= 1 && !array[0].is_a?(Array)
  if array.length > 1
    first = merge_sort(array[0...mid])
    last = merge_sort(array[mid..-1])
  end
  merge(first, last)
end

def merge(left, right)
  if left > right
    [right, left]
  else
    [left, right]
  end
end

# def subsets(arr)
#     return [[]] if arr == []
#     new_arr = []

#     first = arr[0...-1]
#     last = arr[-1]
#     (0...arr.length).each do |i|
#         new_arr << arr[i]
#     end
#     new_arr

# end


p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# [1, 2, 3]

# [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# def subsets(arr)
#   new_arr = [[]]

#   (0...arr.length).each do |num|

#     new_arr <<
#   end
# end
