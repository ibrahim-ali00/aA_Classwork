require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        #render board color
        @board.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                ((i.even? && j.even?) || (i.odd? && j.odd?)) ? ele.colorize(:background => :white) : ele.colorize(:background => :black) 
            end
        end
    end
end