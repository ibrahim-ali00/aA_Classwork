require_relative "piece.rb"
require "singleton"

class NullPiece < Piece

  include Singleton

  attr_reader :color, :symbol

  def initialize
    @color = :grey
    @symbol = :N
  end

  def moves
    possible_pos = []
    @board.each_with_index do |sub_arr, i|
      sub_arr.each_with_index do |ele, j|
        if (!ele.is_a?(Rook) && !ele.is_a?(Knight) && !ele.is_a?(Bishop) && !ele.is_a?(King) && !ele.is_a?(Queen) && !ele.is_a?(Pawn))
          possible_pos << [i, j]
        end
      end
    end
    possible_pos
  end
end