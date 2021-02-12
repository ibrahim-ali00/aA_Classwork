#phase 2 time complexity= O(n) b/c iterating once through loop
def my_min_two(list)
    i= 0
    min= list[0]
    while i < list.length-1
        if list[i+1] < min
            min = list[i+1]
        end
        i+=1
    end
    min
end

def my_min_one(array)
    new_array= array.dup
    min= array
    
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5