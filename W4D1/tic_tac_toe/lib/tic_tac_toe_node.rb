require_relative "tic_tac_toe"

class TicTacToeNode
  attr_reader :next_mover_mark, :board, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    array = []
    (0...board.rows.length).each do |i|
      (0...board.cols.length).each do |j|
        if board.empty?([i, j])
          duplicate = board.dup
          duplicate[[i, j]] = next_mover_mark
          opposite = (next_mover_mark == :x ? :o : :x)
          prev_move_pos = [i, j]
          array << TicTacToeNode.new(duplicate,opposite, prev_move_pos)
        end
      end
    end
    array
  end
end
