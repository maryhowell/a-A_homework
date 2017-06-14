require 'byebug'

module Searchable

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
     current_node = queue.shift
     return current_node if current_node.value == target_value
     queue.concat(current_node.children)
    end
    nil
  end
end

class PolyTreeNode
  include Searchable
  attr_accessor :children, :parent, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if self.parent
      self.parent.children.delete(self)
    end
    @parent = node
    unless node.nil?
      node.children.push(self) unless node.children.include?(self)
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'NameError' if child_node.parent.nil?
    child_node.parent = nil
  end
end
