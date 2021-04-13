
module Stepable

    def moves
        if self.is_a?(King)
            steps = [ [1,0],[1,1],[0,1],[-1,0],[-1,1],[0,-1],[-1,-1],[1,-1] ]
            moves = []
            x, y = self.pos
            steps.each do |step_arr|
                new_x = x + step_arr[0]
                new_y = y + step_arr[1]
                new_pos = [new_x, new_y]
                moves << new_pos if @board.valid_pos?(new_pos)
            end
            moves
        end

        if self.is_a?(Knight)
            x, y = self.pos
            moves = [ [x-2,y-1], [x-2,y+1], [x-1,y-2], [x-1,y+2], [x+1,y-2], [x+1,y+2], [x+2,y-2], [x+2,y+1] ]
            moves.select {|move| @board.valid_pos?(move)}
        end
    end

    

    private

    def move_diffs #overwritten by subclass
        
    end

end