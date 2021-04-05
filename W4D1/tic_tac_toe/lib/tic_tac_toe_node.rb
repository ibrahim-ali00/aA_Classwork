require_relative "tic_tac_toe"

class TicTacToeNode
  attr_reader :next_mover_mark, :board, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # how do we get opponent turn?
  # how do we go through each node and check if it is loser or winner?
  # what is evaluator? a TTT node: board, next_mover, prev_pos
  # how do we get current mark?
  def losing_node?(evaluator) #!board.won?
    #base case: board is over and winner is opponent or winner is nil or us
    if board.over? 
      return board.won? && evaluator != board.winner
    end

    if @next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
      # losing_node?(evaluator.children.shift)
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
    #recursive case: player's turn and all children are losers
    #OR opponent's turn and one of the childrens nodes is a losing node for the player
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
          array << TicTacToeNode.new(duplicate,opposite,prev_move_pos)
        end
      end
    end
    array
  end
end
