% Prompt for an arbitrary simple graph G and compute its Dominance
% Shadow Topology. Any simple graph works; entering n = 4 and
% edgeList = [1 2; 2 3; 3 4] recovers the P4 topology worked out by
% hand in the paper (Section 2, Example 17).
n = input('Number of vertices n: ');
edgeList = input('Edge list as an m-by-2 matrix, e.g. [1 2; 2 3; 3 4]: ');
G = graph(edgeList(:,1), edgeList(:,2), [], n);
T = dominanceShadowTopology(G);
printSets('Subbase',  T.Subbase,  T.Vertices);
printSets('Basis',    T.Basis,    T.Vertices);
printSets('Topology', T.Topology, T.Vertices);
