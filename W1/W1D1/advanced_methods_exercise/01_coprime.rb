# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num1, num2)
    arr1 = []
    arr2 = []
    (2..num1).each do |i|
        if num1 % i == 0
            arr1 << i
        end
    end
    (2..num2).each do |j|
        if num2 % j == 0
            arr2 << j
        end
    end

    arr1.each do |ele1|
        arr2.each do |ele2|
            if ele1 == ele2
                return false
            end
        end
    end
    return true
end





 p coprime?(25, 12)    # => true
 p coprime?(7, 11)     # => true
 p coprime?(30, 9)     # => false
 p coprime?(6, 24)     # => false


