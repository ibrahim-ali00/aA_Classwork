class Piece
    attr_reader :pos, :color, :board

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos
    end

    def moves
        self.valid_moves
    end

    def to_s
        self.class.to_s
    end

    def empty?
        return false
    end

    def valid_moves
        moves = self.move_dirs #array type
        moves.select {|pos| self.empty?}
    end

    def pos=(val)
        @pos = val
    end

    def symbol

    end

    private

    def move_into_check?(end_pos)

    end

end
