module Stepable

  def moves
    possible_pos = []
    starting_pos = self.pos
    move_diffs.each do |next_pos|
      new_pos = [starting_pos[0] + next_pos[0], starting_pos[1] + next_pos[1]]
      if @board.valid_pos?(new_pos) && @board[new_pos].color != self.color
        possible_pos << new_pos
      end
    end
    possible_pos
  end

  private
  def move_diffs
    raise "need to implement Class#move_diffs in your class"
  end
end
