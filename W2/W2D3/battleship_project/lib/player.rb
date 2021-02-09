require 'byebug'
class Player

  def get_move
    p "enter a position with coordinates separated with a space like '4 7'"
    text1 = gets.chomp
    arr = text1.split(" ")
    arr.map do |ele|
        ele.to_i
    end
  end
end
