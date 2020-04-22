require './graph'
require './DFS'
require './BFS'
require './A_star'

require 'benchmark'

=begin
nodes={}
nodes[:goal]=Graph::Node.new 5
graph=Graph.new nodes
=end

#graph={names:['S', 'K', 'A', 'L', 'B'], data: [4, 5, 2, 6, 3], costs:[[2,2,1], [1], [2], [], [3,2]], adj_lists: [['A', 'K', 'F'], ['L'], ['B'], [], ['G', 'C']]}
#edges=[['A'], ['B'], ['C', 'G']]
#graph=Graph.new graph

graph=[Node.new('S', 4, 0, '', ['A', 'K', 'F']),
       Node.new('K', 5, 2, 'S', ['L']),
       Node.new('A', 2, 2, 'S', ['B']),
       Node.new('L', 6, 1, 'K', []),
       Node.new('B', 3, 2, 'A',['G', 'C']),
       Node.new('F', 4, 1, 'S', ['H']),
       Node.new('H', 3, 1, 'F', ['I']),
       Node.new('I', 2, 1, 'H', ['J']),
       Node.new('J', 1, 1, 'I', ['G']),
       Node.new('G', 0, 1, 'J', []),
       Node.new('G', 0, 5, 'D', []),
       Node.new('D', 5, 2, 'C', ['E', 'G']),
       Node.new('E', 6, 1, 'D', []),
       Node.new('G', 0, 3, 'B', []),
       Node.new('C', 4, 2, 'B', ['D'])]

time=Benchmark.measure {DFS graph}
puts "DFS time: #{time.real.round 5} ms"
time=Benchmark.measure {BFS graph, 'G'}
puts "BFS time: #{time.real.round 5} ms"
time=Benchmark.measure {A_search graph, 'G'}
puts "A* time: #{time.real.round 5} ms"
