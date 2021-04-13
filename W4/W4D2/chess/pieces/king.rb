require_relative 'stepable'
require_relative 'piece.rb'

class King < Piece
    include Stepable
    def symbol
        if self.color == :black
            :♚
        else
            :♔
        end
    end

    protected

    def move_dirs
        self.moves
    end

end