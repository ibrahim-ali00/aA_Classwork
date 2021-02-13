# factorial
def first_anagram?(str1, str2)
  letters = str1.split("")
  new_words = letters.permutation(str1.length).to_a
  new_words.map! { |words| words.join("") }
  new_words.include?(str2)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")

# possibly n^2 because include? is a loop
def second_anagram?(str1, str2)
  
  str1.each_char do |char|
    # str2.each_char.with_index do |char2, i|
    str2.slice!(str2.index(char)) if str2.include?(char)  
  end
  
  return str2.empty?
end
#iterate over 1st string 
#find index 

# p second_anagram?("elvis", "lives")
# p second_anagram?("gizmo", "sally")

# log linear?
def third_anagram?(str1, str2)
  str1.split("").sort.join("") == str2.split("").sort.join("")
end

p third_anagram?("elvis", "lives")
p third_anagram?("gizmo", "sally")

def fourth_anagram?(str1, str2)
  counter = Hash.new(0)
  str1 << str2

  


end

