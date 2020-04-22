def DFS graph
  stack=[graph[0]]
  discovered=[graph[0]]
  print graph[0].name + "\tData: #{graph[0].data} "
  until stack.empty?
    node=stack.pop
    print " -> " + node.name + "\tData: #{node.data} " unless discovered.include? node
    discovered << node
    node.adj_list.sort.each do |name|
      obj=graph.select {|i| i.name==name}[0]
      next if obj.nil?
      stack << obj
    end
  end
  puts
end
