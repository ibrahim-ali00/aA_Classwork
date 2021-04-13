def bad_two_sum?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  return false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def ok_two_sum?(arr, target)
  arr.sort!
  half = target/2
  (0...arr.length).each do |i|
    ((binary_search(arr[i+1..-1], half))...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
return false
end



def binary_search(arr, target)
  return nil if arr.length <= 1
  mid  = arr.length/2
  if target == arr[mid]
    return mid
  elsif target < arr[mid]
    binary_search(arr[0...mid], target)
  else
    search_result = binary_search(arr[mid+1..-1], target)
    search_result.nil? ? nil : search_result + (arr[0...mid]).length
  end
end

# arr = (0..20).to_a
# p binary_search(arr, 13)

arr = [0, 1, 5, 7]
p ok_two_sum?(arr, 10) # => should be false
p ok_two_sum?(arr, 6) # => should be true