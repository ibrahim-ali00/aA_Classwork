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

def third_anagram?(str1, str2)

  str1.split("").sort == str2.split("").sort
end

def forth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash2[char] += 1
  end
  hash1 == hash2
end


def fifth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash1[char] -= 1
  end
  hash1.values.any? {|ele| ele != 0}
end



# str1 = "basiparachromatin"
# str2 = "marsipobranchiata"

str1 = "mountaineer"
str2 = "enumeration"

# p third_anagram?("elvis", "lives")    #=> true
# p third_anagram?("gizmo", "sally")    #=> false

Benchmark.bm do |x|
  x.report { first_anagram?(str1, str2) }
  x.report { second_anagram?(str1, str2) }
  x.report { third_anagram?(str1, str2) }
  x.report { forth_anagram?(str1, str2) }
  x.report { fifth_anagram?(str1, str2) }
end
