module Slideable
  HORIZONTAL_DIRS = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  DIAGONAL_DIRS = [[-1,1], [-1, -1], [1, -1], [1, 1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    directions_arr = move_dirs
    all_possible_pos = []

    directions_arr.each do |pos|
      current_pos_arr = grow_unblocked_moves_in_dir(pos[0], pos[1])
      all_possible_pos.concat(current_pos_arr)
    end
    
    all_possible_pos
  end

  private
  def move_dirs
    raise "Need to implement Class#move_dirs!"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    possible_positions = []

    starting_pos = self.pos
    our_color = self.color
    new_position = [starting_pos[0] + dx, starting_pos[1] + dy]

    while @board.valid_pos?(new_position)
      if !@board[new_position].is_a?(NullPiece) #Change to NullPiece after NullPiece is implemented
        possible_positions << new_position
      else
        new_color = @board[new_position].color
        possible_positions << new_position if our_color != new_color
        break
      end
      new_position = [new_position[0] + dx, new_position[1] + dy]
    end

    possible_positions
  end
end