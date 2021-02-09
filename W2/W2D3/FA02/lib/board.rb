require 'byebug'
class Board

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
    @stacks.each { |stack| p stack }
  end

  def self.build_stacks(num)
    arr = Array.new(num) { Array.new(0) }
  end

  def initialize(num, max)
    @max_height = max
    @stacks = Array.new(num) { Array.new(0) }
    Board.build_stacks(num)
    if num < 4 || max < 4
      raise "rows and cols must be >=4"
    end
  end

  def max_height
    @max_height
  end

  def add(token, index)
    if @stacks[index].length < @max_height
      @stacks[index].push(token)
      return true
    else
      return false
    end
  end

  def vertical_winner?(token)
    @stacks.each do |ele|
      if ele.all? { |tok| tok == token } && ele.length == @max_height
        return true
      end
    end
    false
  end

  def horizontal_winner?(token)
    (0...max_height).each do |row_idx|
      if (0...@stacks.length).all? do |stack_idx|
        @stacks[stack_idx][row_idx] == token
      end
        return true
      end
    end
    false
  end
  def winner?(token)
    self.horizontal_winner?(token) || self.vertical_winner?(token)
  end
end
