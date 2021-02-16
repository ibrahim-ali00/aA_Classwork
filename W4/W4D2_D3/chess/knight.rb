require_relative "Piece.rb"
require_relative "stepable.rb"

class Knight < Piece

  include Stepable
  
  def symbol
    :K
  end

  def move_diffs
    [[-1, 2], [1, 2], [-2, 1], [2, 1], [-2, -1], [2, -1], [-1, -2], [1, -2]]
  end
end