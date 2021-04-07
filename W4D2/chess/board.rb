require_relative "null_piece"
require_relative "piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.new) }
  end

  def [](pos)
    @grid[pos[0]][pos[-1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[-1]] = val
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "Empty position"
    end
    end_pos.each do |ele|
      raise "Out of bounds" if !ele.between?(0, 7)
    end
    self[start_pos], self[end_pos] = NullPiece.new, self[start_pos]
  end

  def print_board
    printed = []
    @grid.each do |row|
      row.each do |ele|
        print ele.symbol
      end
      puts
    end
  end
end

board = Board.new
piece = Piece.new
board[[0, 0]] = piece
board.move_piece([0, 0], [1, 1])
board.print_board
