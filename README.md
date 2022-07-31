# shortest_path

This algorithm should show to the min waypoints and total min cost between source and target waypoint.


Dijkstra's shortest path algorithm
https://www.freecodecamp.org/news/dijkstras-shortest-path-algorithm-visual-introduction/
* Graphs are used to model connections between objects, people, or entities. 
* They have two main elements: nodes and edges. Nodes represent objects and edges represent the connections between these objects.

According to this problem we can define graph :
Cities = nodes
Costs = edges

Algorithm:
Mark all the waypoints as unvisited, mark all nodes with infinite cost initially except source node
Repeat the following unless all the nodes visited
1- pick up the min value node which is unvisited
2- mark this node as visited
3- update cost => cost[current_node] + cost of edge

We can use Array's for the 3 steps.

On step 3, we are using 2 Array. One of them is parent (previous), when we find a cost less than infinity/current value, we update it with its min value (with the smaller value found).

