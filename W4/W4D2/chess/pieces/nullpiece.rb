require 'singleton'
require_relative 'piece.rb'

class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol
    def initialize
        @color = " "
        @symbol = " "
    end

    def moves
        
    end

    def empty?
        return true
    end

    def symbol
       " "
    end

end