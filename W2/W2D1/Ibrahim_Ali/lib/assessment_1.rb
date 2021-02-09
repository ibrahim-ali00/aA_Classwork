# Define your methods here.

def my_map!(arr, &block)
    new_arr = []

    arr.inject do |ele|
        block.call(ele)
    end
end


def two?(arr, &block)
    count = 0

    arr.each do |ele|
        if block.call(ele)
            count += 1
        end
    end

    if count == 2
        return true
    else
        false
    end
end

def nor_select(arr, proc1, proc2)
    new_arr = []

    arr.each do |ele|
        if proc1.call(ele) == false && proc2.call(ele) == false
            new_arr << ele
        end 
    end
    new_arr
end

def array_of_hash_sum(arr)
    sum = 0
    arr.each do |ele|
        ele.each_value do |v|
            sum += v
        end
    end
    sum
end

def slangify(str)
    vowels = "aeiouAEIOU"
    new_str = []

    words = str.split(" ")

    words.each do |word|
        new_str << remove(word)
    end
new_str.join(" ")
end
def remove(word)
    vowels = "aeiouAEIOU"
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[0...i] + word[i+1..-1]
        end
    end
end
def char_counter(str, *chars)
    hash = Hash.new(0)
    count = 0
    str.each_char do |char|
        if char == chars
            count += 1
            hash[char] = count
        end
    end
    hash
end
