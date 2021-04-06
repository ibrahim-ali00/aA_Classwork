class PolyTreeNode
  def initialize(value=nil)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent != nil
      @parent.children.delete(self)
    end
    @parent = node
    if !node.nil?
      node.children << self unless node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Error!" if child_node.parent == nil
    child_node.parent = nil
  end

  def dfs(target_val)
    return self if self.value == target_val
    return nil if self.children.empty?
    self.children.each do |ele|
      depth = ele.dfs(target_val)
      return depth unless depth.nil?
    end
    nil
  end

  def bfs(target_val)
    queue = []
    queue << self
    until queue.empty?
      first = queue.shift
      return first if first.value == target_val
      first.children.each do |child|
        queue << child
      end
    end
    nil
  end

  attr_reader :parent, :children, :value
end
