
module Slideable
    HORIZONTAL_DIRS = [[1,0],[0,1],[-1,0],[0,-1]]
    DIAGONAL_DIRS = [[1,1][1,-1],[-1,1],[-1,-1]]
    
    def horizontal_dirs
        start_pos = self.pos
        horz_arr = [start_pos, start_pos, start_pos, start_pos]

        horz_arr.each do |i|
            while @board[horz_arr[i]].valid_pos?
                x, y = horz_arr[i]
                x += HORIZONTAL_DIRS[0]
                y += HORIZONTAL_DIRS[1]
                horz_arr[i] = [x, y]
            end
        end
        horz_arr.reject { |pos| pos == start_pos }
    end

    def diagonal_dirs
        start_pos = self.pos
        diag_arr = [start_pos, start_pos, start_pos, start_pos]

        diag_arr.each do |i|
            while @board[diag_arr[i]].valid_pos?
                x, y = diag_arr[i]
                x += DIAGONAL_DIRS[0]
                y += DIAGONAL_DIRS[1]
                diag_arr[i] = [x, y]
            end
        end
        diag_arr.reject { |pos| pos == start_pos }
    end

    def moves
        if self.is_a?(Rook)
            return horizontal_dirs
        end

        if self.is_a?(Bishop)
            return diagonal_dirs
        end

        if self.is_a?(Queen)
            return horizontal_dirs + diagonal_dirs
        end
    end

    private

    def move_dirs #overwritten by subclasss

    end

    def grow_unblocked_moves_in_dir(dx, dy)

    end

end