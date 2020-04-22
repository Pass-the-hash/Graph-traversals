require_relative 'priority_queue'

=begin
def traverse_bfs queue, graph
  node=queue.pop
  return if node.nil?
  #index=graph[:names].index node[:name]
  print "\t-(#{node.cost})-> \t#{node.name}  Data: #{node.data}"
  node.adj_list.each do |name|
    #print "#{node.name}\tData: #{node.data} -(#{node.costs[index]})-> "
    obj=graph.select {|i| i.name==name && i.parent==node.name}[0]
    #hash={name: name, data: graph[:data][index], adj_list: graph[:adj_lists][index], cost: graph[:costs][index]}
    queue.push obj, node.cost unless obj.nil?
  end
  traverse_bfs queue, graph
end
=end

def BFS graph, goal
  #queue=PriorityQueue.new
  open_list=PriorityQueue.new
  closed_list=PriorityQueue.new
  node=graph[0]
  open_list.push node, node.cost
  print "#{node.name}  Data: #{node.data}"
  until open_list.empty?
    node=open_list.pop
    print "\t-(#{node.cost})-> \t#{node.name}  Data: #{node.data}" unless node==graph[0]
    if node.name==goal
      puts
      return
    end
    node.adj_list.each do |name|
      obj=graph.select {|i| i.name==name && i.parent==node.name}[0]
      next if obj.nil?
      next if closed_list.include?(obj) || open_list.include?(obj)
      open_list.push obj, obj.cost
    end
    closed_list.push node, node.cost
  end

  #traverse_bfs queue, graph
  puts
end
