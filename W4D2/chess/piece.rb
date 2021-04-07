class Piece

    attr_reader :color, :board, :pos

    def initialize(color, board, pos)
        @color = color  
        @board = Board.new
        @pos = [] 
    end

    def moves 

    end

    def to_s 
        # symbol to string 
        # :K to King 
    end

    def empty?
        # board.empty
        # return a booleen 
        return false 
    end

    def valid_moves 
        # knight or king stepable 
        # queens or bishop slideable 
    end

    def pos=(val)

    end

    def Symbol

    end

    def move_into_check?(end_pos)

    end


end


# slideable class, directions, queen include slideable, queen < piece, moves == valid
# call move piece, move_piece(start, end_pos), check takes color, 