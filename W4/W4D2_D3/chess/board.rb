require_relative "piece.rb"
require_relative "rook.rb"
require_relative "knight.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"
require_relative "populate_module.rb"

class Board

  include Populate

  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    self.populate
  end

  def populate
    populate_null
    populate_pawn
    populate_rook
    populate_knight
    populate_bishop
    populate_queen
    populate_king
  end

  def [](pos)
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @rows[row][col] = value
  end

  def valid_pos?(pos)
    row, col = pos
    return false if row < 0 || row >= 8 || col < 0 || col >= 8
    true
  end

  def move_piece(color, start_pos, end_pos)
    if !valid_pos?(start_pos)
      raise "There is no piece at start position!"
    elsif self.color != self[start_pos].color
      raise "Not your piece color!"
    elsif !valid_pos?(end_pos) || self.color != self[end_pos].color
      raise "The piece cannot be moved to this end position!"
    end
    piece = self[start_pos]
    self[start_pos] = @null_piece
    self[end_pos] = piece
  end

  private
  @null_piece = NullPiece.instance
end