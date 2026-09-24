function T = dominanceShadowTopology(G)
% DOMINANCESHADOWTOPOLOGY Compute the Dominance Shadow Topology tau_shadow
%   of an undirected simple graph G (a MATLAB graph object).
%
%   T is a struct with fields Vertices, Subbase, Basis, Topology; the
%   latter three are logical matrices, one indicator row per set.
    if ~isa(G, 'graph')
        error('dominanceShadowTopology:invalidInput', ...
            'Input must be a MATLAB graph object.');
    end
    n = numnodes(G);
    deg = degree(G)';        % 1-by-n degree vector
    D = distances(G);        % n-by-n shortest-path distances (Inf if unreachable)

    % 1. Shadow set for each vertex: Sh(v) = { u : deg(u) >= d(v,u) }
    shadowRows = false(n, n);
    for v = 1:n
        shadowRows(v, :) = (deg >= D(v, :));
    end
    % 2. Subbase: remove duplicate rows
    subbase = unique(shadowRows, 'rows');
    % 3. Basis: close {subbase, V} under pairwise intersection with subbase
    fullRow = true(1, n);
    basis = fixedPointClosure(unique([subbase; fullRow], 'rows'), ...
        subbase, @(a, b) a & b);
    % 4. Topology: close {basis, {}} under pairwise union with basis
    emptyRow = false(1, n);
    topology = fixedPointClosure(unique([basis; emptyRow], 'rows'), ...
        basis, @(a, b) a | b);
    % Sort open sets by cardinality, smallest first
    [~, order] = sort(sum(topology, 2));
    topology = topology(order, :);
    T = struct('Vertices', 1:n, 'Subbase', subbase, ...
        'Basis', basis, 'Topology', topology);
end
