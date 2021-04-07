require_relative "null_piece"
require_relative "piece"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.new) }
  end

  # def move_piece(start, end)

  # end

  def [](pos)
    @grid[pos[0]][pos[-1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[-1]] = val
  end

  def print_board
    printed = []
    @grid.each do |row|
      row.each do |ele|
        #printed << ele.symbol
        print ele.symbol
      end
      puts
    end
    # p printed.each_slice(8).to_a
  end
end

board = Board.new


piece = Piece.new
board[[0, 0]] = piece

board.print_board
