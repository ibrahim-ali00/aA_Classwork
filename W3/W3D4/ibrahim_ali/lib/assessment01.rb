class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    self.each do |ele|
      accumulator = prc.call(ele)
    end
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 1
  return false if num == 1
  (2...num).each do |ele|
    return false if num % ele == 0
  end
  true
end

def primes(num)
  return [] if num == 0
  new_arr = (0..20).to_a
  primes = []
  new_arr.each do |ele|
    if is_prime?(ele)
      primes << ele
    end
  end
    primes.take(num)
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [] if num == 0
  return [1] if num == 1
  return [1, 1] if num == 2
  factorials = [1, 1]
  i = 0
  while i < num
    factorials << num * factorials_rec(num -1)
    i += 1
  end
  factorials
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings(sub1, sub2)
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
