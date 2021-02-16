class Piece

  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def []=(pos, val)
    row, col = pos
    self[row][col] = val
  end
end

