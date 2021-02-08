class Board
  attr_reader :size
  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
    @grid.each { |row| p row }
  end

  def initialize(size)
    @size = size
    @grid = Array.new(@size) { Array.new(@size) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def complete_row?(mark)
    @grid.any? { |ele| ele.all?(mark) }
  end

  def complete_col?(mark)
    @grid.transpose.any? { |horiz| horiz.all?(mark) }
  end

  def complete_diag?(mark)
    diag1 = (0...@grid.length).all? do |idx|
      pos = [idx, idx]
      self[pos] == mark
    end
    diag2 = (0...@grid.length).all? do |idx|
      row = idx
      col = @grid.length - 1 - idx
      pos = [row, col]
      self[pos] == mark
    end
    diag1 || diag2
  end

  def winner?(mark)
    complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
  end
end
