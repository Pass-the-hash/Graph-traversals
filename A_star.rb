require_relative 'priority_queue'

def A_search graph, goal
  open_list=PriorityQueue.new
  closed_list=PriorityQueue.new
  open_list.push graph[0], 0
  print "#{graph[0].name}  Data: #{graph[0].data}"
  until open_list.empty?
    node=open_list.pop
    #puts node.inspect
    closed_list.push node, node.cost
    print "\t-(#{node.cost})-> \t#{node.name}  Data: #{node.data}" unless graph[0]==node
    if node.name==goal
      puts
      return
    end
    node.adj_list.each do |obj|
      obj=graph.select {|i| i.name==obj && i.parent==node.name}[0]
      next if obj.nil?
      next if closed_list.include? obj
      if open_list.include? obj
        next if obj.cost > node.cost
      end
      open_list.push obj, obj.data+obj.cost
    end
  end
  puts
end
