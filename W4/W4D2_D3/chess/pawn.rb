require_relative "piece.rb"

class Pawn < Piece
    def symbol
        :P
    end
    def moves
        directions_arr = [[-1, 0], [-1, -1], [-1, 1]]
        possible_pos = []
        start_pos = self.pos

        directions_arr.each do |curr_dir|
            new_pos = [start_pos[0] + curr_dir[0], start_pos[1] + curr_dir[1]] 
            if @board.valid_pos?(new_pos) && self.color != @board[new_pos].color
                possible_pos << new_pos
            end
        end
        
        possible_pos
    end
end