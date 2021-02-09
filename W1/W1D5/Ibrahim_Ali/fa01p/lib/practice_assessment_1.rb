# Define your methods here. 
def first_letter_vowel_count(str)
    vowels="aeiou"
    count = 0
    str.split.each_with_index do |char, idx|
        if vowels.include?(char[0].downcase)
            count +=1
        end
    end
    count
end

def count_true(arr, proc1)
    count = 0
    arr.each do |ele|
        count += 1 if proc1.call(ele)
    end
    count
end

def procformation(arr, proc1, proc2, proc3)
    new_arr = []
    arr.each do |ele|
        if proc1.call(ele)
            new_arr << proc2.call(ele)
        else
            new_arr << proc3.call(ele)
        end
    end
    new_arr
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(str)
    vowels = "aeiou"
    new_arr = []
    words = str.split
    words.each_with_index do |char, idx|
        if vowels.include?(char[0]) || vowels.include?(char[-1])
            new_arr << char
        else
            new_arr << char.reverse
        end
    end
    new_arr.join(" ")
end

def hash_missing_keys(hash, &argues)
    new_arr = []
    argues.each do |ele|
        hash.each do |k, v|
            if hash[k] != ele
                new_arr << ele
            end
        end
    end
    new_arr
end