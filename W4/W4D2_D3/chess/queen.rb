require_relative "slideable.rb"
require_relative "piece.rb"

class Queen < Piece

  include Slideable
  
  def symbol
    :Q
  end

  private
  def move_dirs
    horizontal_dirs.concat(diagonal_dirs)
  end

end