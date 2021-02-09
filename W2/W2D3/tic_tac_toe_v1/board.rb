class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def valid?(pos)
    row, col = pos
    return false if @grid[row][col] == nil
    true
  end

  def empty?(pos)
    row, col = pos
    @grid[row][col] == "_"
  end

  #   def place_mark(pos, mark)
  #     raise "invalid mark" if !valid?(pos) || !empty?(pos)
  #     self[pos] = mark
  #   end

  def place_mark(pos, mark)
    if self.empty?(pos) && self.valid?(pos)
      self[pos] = mark
    else
      raise "error"
    end
  end

  def print
    @grid.each do |ele|
      puts ele.join(" ")
    end
  end

  def win_row?(mark)
    @grid.any? { |ele| ele.all?(mark) }
  end
end
