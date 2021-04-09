def my_min1
  # arr = [0, 3, 5, 4, -5, 10, 1, 90]
  arr = (1..9999).to_a.shuffle
  arr.each do |ele1|
    if (arr - [ele1]).all? { |ele2| ele1 < ele2 }
      return ele1
    end
  end
end

# [ 7, 2 , 4 , 1, 11]
p my_min1

# def my_min2

# end
