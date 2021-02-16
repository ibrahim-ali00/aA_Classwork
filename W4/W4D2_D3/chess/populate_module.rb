module Populate
  def populate
    raise "implement Class#populate method in your class"
  end

  def populate_null
    (2..5).each do |i|
      @rows[i].each_with_index do |_, j|
        @rows[i][j] = NullPiece.instance
      end
    end
  end

  def populate_pawn
    i = 1
    @rows[i].each_with_index do |_, j|
        self[[i, j]] = Pawn.new(:white, rows, [i, j])
    end

    i = 6
    @rows[i].each_with_index do |_, j|
      self[[i, j]] = Pawn.new(:black, rows, [i, j])
    end
  end

  def populate_rook
    rook_pos = [[0, 0], [0, 7], [7, 0], [7, 7]]

    rook_pos.each_with_index do |pos, i|
      if i <= 1
        self[pos] = Rook.new(:white, rows, pos)
      else
        self[pos] = Rook.new(:black, rows, pos)
      end
    end
  end

  def populate_knight
    knight_pos = [[0, 1], [0, 6], [7, 1], [7, 6]]

    knight_pos.each_with_index do |pos, i|
      if i <= 1
        self[pos] = Knight.new(:white, rows, pos)
      else
        self[pos] = Knight.new(:black, rows, pos)
      end
    end
  end

  def populate_bishop
    bishop_pos = [[0, 2], [0, 5], [7, 2], [7, 5]]

    bishop_pos.each_with_index do |pos, i|
      if i <= 1
        self[pos] = Bishop.new(:white, rows, pos)
      else
        self[pos] = Bishop.new(:black, rows, pos)
      end
    end
  end

  def populate_queen
    self[[0, 3]] = Queen.new(:white, rows, [0, 3])
    self[[7, 3]] = Queen.new(:black, rows, [0, 3])
  end

  def populate_king
    self[[0, 4]] = King.new(:white, rows, [0, 4])
    self[[7, 4]] = King.new(:black, rows, [7, 4])
  end
end

# def populate
#   hash_white = { 
#     "Rook" => [[0,0], [0,7]],
#     "Pawn" =>,
#     "Queen" =>
#     "King" =>
#     "Knight" =>
#     "Bishop" => 
#   }

#   hash_white.each do |piece, pos|
#     pos.each do |current_pos|
#       self[current_pos] = piece.new(:white, grid, current_pos)
#     end
#   end
# end