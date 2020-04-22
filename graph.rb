class Node

  attr_accessor :name, :data, :cost, :adj_list, :parent

  def initialize(name, data, cost, parent, adj_list)
    @name = name
    @data=data
    @adj_list = adj_list
    @cost=cost
    @parent=parent
  end

  def add_edge(successor)
    @adj_list << successor
  end

  def to_s
    "#{@name}\n"
  end

end