module Slideable
  HORIZONTIAL_VERITCAL = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def horizontal_dirs
    HORIZONTIAL_VERITCAL
  end

  def diagonal_dirs
    DIAGONAL
  end

  def moves
    arr
  end

  private

  def move_dirs
    
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    arr = []
    move = [self.pos[0] + dx, self.pos[1] + dy]
    until !self.valid_moves.include?(move)
        arr << move
        break if !self.board[move].empty?
        move = [self.pos[0] + dx, self.pos[1] + dy]
    end
    arr
  end
end
