require_relative 'piece.rb'

class Pawn < Piece

    def symbol
        if self.color == :black
            :♟ 
        else
            :♙
        end
    end

    def moves
        start_pos = self.pos
        x, y = start_pos
        moves = []
        if at_start_row?
            x += forward_steps
            moves << [x, y]
        else
            x += forward_dir
            moves << [x, y]
        end
        moves += side_attacks
        moves
    end

    private

    def at_start_row?
        if self.color == :white
            @pos[1] == 6
        elsif self.color == :black
            @pos[1] == 1
        end
    end

    def forward_dir
        if self.color == :white
            -1
        else
            +1
        end
    end

    def forward_steps
        if self.color == :white
            -2
        elsif self.color == :black
            +2
        end
    end

    def side_attacks #returns array of valid side attacks
        valid_attacks = []
        start_pos = self.pos
        x, y = start_pos
        if self.color == :white
           if @board[x+1, y+1].color == :black
                valid_attacks << [x+1, y+1]
           end
           if @board[x-1, y+1].color == :black
                valid_attacks << [x-1, y+1]
           end
        else
            if @board[x-1, y-1].color == :white
                valid_attacks << [x-1, y-1]
            end
            if @board[x+1, y-1].color == :white
                valid_attacks << [x+1, y-1]
            end
        end
        valid_attacks
    end

end