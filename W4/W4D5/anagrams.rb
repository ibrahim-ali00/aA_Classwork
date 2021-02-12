def first_anagram?(str1, str2)
  letters = str1.split("")
  new_words = letters.permutation(str1.length).to_a
  new_words.map! { |words| words.join("") }
  new_words.include?(str2)
  #   anagrams = []
  #   letters.each_index do |i|
  #     (i + 1...letters.length).each do |j|
  #       words = str1[i..j]
  #       anagrams << words
  #     end
  #   end
  #   anagrams.include?(str2)
  #new_words
end

p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives")
