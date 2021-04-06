require_relative "tree_node.rb"
require "byebug"

class KnightPathFinder
  attr_reader :considered_positions, :start_pos, :root_node
  attr_accessor :root_node

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @start_pos = start_pos
    @considered_positions = [start_pos]
    build_move_tree
  end

  def self.valid_moves(pos)
    x, y = pos
    moves = [ [x-2,y-1], [x-2,y+1], [x-1,y-2], [x-1,y+2], [x+1,y-2], [x+1,y+2], [x+2,y-2], [x+2,y+1] ]
    moves.select { |ele| (0..7).include?(ele[0]) && (0..7).include?(ele[1]) }
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).reject { |ele| @considered_positions.include?(ele) }
    @considered_positions.concat(new_moves)
    new_moves
  end

  def build_move_tree
    queue = [self.root_node]
    until queue.empty?
      first = queue.shift
      next_moves = new_move_positions(first.value)
      next_moves.each do |each_move|
        move = PolyTreeNode.new(each_move)
        queue << move
        first.add_child(move)
      end
    end
  end

  def find_path(end_pos)
    leaf = root_node.dfs(end_pos)
    p trace_path_back(leaf)
  end

  def trace_path_back(node)
    array_nodes = [node.value]
    until node.parent.nil?
        node = node.parent
        array_nodes.unshift(node.value)
    end
    array_nodes
  end

end

a = KnightPathFinder.new([0, 0])
a.build_move_tree
a.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
a.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]