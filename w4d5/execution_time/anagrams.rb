require "benchmark"

def first_anagram?(str1, str2)
  arr = str1.split("").permutation
  arr2 = str2.split("")
  arr.any? { |ele| ele == arr2 }
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")
  (0...arr1.length).each do |i|
    idx2 = arr2.find_index(arr1[i])
    arr2.delete_at(idx2) unless idx2.nil?
  end
  arr2.empty?
end

# str1 = "basiparachromatin"
# str2 = "marsipobranchiata"

str1 = "mountaineer"
str2 = "enumeration"

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

Benchmark.bm do |x|
  x.report { first_anagram?(str1, str2) }
  x.report { second_anagram?(str1, str2) }
end
