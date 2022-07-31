#lets go to the memphis to the savanna with minimum costs, thanks to the dijsktra
class ShortestPath
  def initialize(graph, city_names_hash, options = {})
    @graph = graph
    @city_names_hash = city_names_hash
    @start_city = options[:start_city]
    @end_city = options[:end_city]
  end

  def call()
    dijkstra(@start_city, @end_city)
  end

  private
  def dijkstra(source, target)
    # init visited nodes as false
    visited = [false] * @graph.size 
    # init cost to infinity unless source node, source node's cost is 0
    cost = [Float::INFINITY] * @graph.size
    cost[source] = 0
    # init parent node to nil
    previous = [nil] * @graph.size
    # while there are nodes to visit
    while true
      min = Float::INFINITY
      min_index = nil
      @graph.size.times do |i|
        if !visited[i] && cost[i] < min
          min = cost[i]
          min_index = i
        end
      end
      break if min_index.nil?
      break if min_index == target
      visited[min_index] = true
      @graph.size.times do |i|
        if !visited[i] && @graph[min_index][i] != 0
          alt = cost[min_index] + @graph[min_index][i] # cost of current node + cost of edge
          if alt < cost[i]  # if cost of current node + cost of edge is less than cost of node
            cost[i] = alt   # update cost of node
            previous[i] = min_index # update previous node
          end 
        end
      end
    end
    path = [] # init path array as empty
    u = target # set u as target 
    while previous[u] # while previous node is not target
      path << u # add node to path
      u = previous[u] # set u as previouds node  
    end
    path << u # add source to path
    puts "The shortest path from #{@city_names_hash[source]} to #{@city_names_hash[target]} is #{path.reverse.map{|i| @city_names_hash[i]}.join(" -> ")} with a cost of #{cost[target]}$" 
  end
end
#example input
city_names_hash = {0 => "Memphis", 1 => "Nashville",2 => "New Orleans", 3 => "Mobile", 4 => "Atlanta",5 => "Savanna"}
graph = [[0, 15, 3, 7, 10, 0], [15, 0, 0, 0, 2, 0], [3, 0, 3, 0, 0, 0], [7, 0, 3, 0, 2, 6], [10, 2, 0, 2, 0, 1], [0, 0, 0, 6, 1, 0] ]
#example output
s = ShortestPath.new(graph, city_names_hash, {start_city: 0, end_city: 5}).call
puts s
