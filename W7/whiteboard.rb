def squares(arr)
  new_arr = []

  i = 0
  while i < arr.length
    if (arr[i] ** 2) < (arr[i - 1] ** 2)
      new_arr.unshift(arr[i] ** 2)
    else
      new_arr << (arr[i] ** 2)
    end
    i += 1
  end
  new_arr
end

p squares([-4, -1, 0, 3, 10]) #[0,1,9,16,100]
p squares([-7, -3, 2, 3, 11]) #[4,9,9,49,121]
