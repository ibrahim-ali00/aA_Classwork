require_relative 'slideable'
require_relative 'piece.rb'

class Rook < Piece
    include Slideable
    def symbol
        if self.color == :black
            :♜
        else
            :♖
        end
    end
    
    private

    def move_dirs
        self.moves
    end

end

