require_relative 'cursor.rb'
require_relative 'board.rb'

class Display
    attr_accessor :board

    def initialize(board)
        @board = board
        # @cursor
    end

    def render
        @board.rows.each_with_index do |row, i|
            print row.map { |piece| piece.symbol.to_s }.join(" ")
            print "\n"
        end
    end

end

b = Board.new
d = Display.new(b)
d.render
b.move_piece(:black, [0,1], [2,2])
b.move_piece(:black, [1,0], [4,4])
d.render
