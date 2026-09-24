# Dominance Shadow Topology — MATLAB implementation

MATLAB code accompanying the paper **"Dominance Shadow Topology"**
(Shahad T. Akram, Alyasaa Jasim), submitted to TMREES 2026.

Computes the subbase, basis, and generated topology (tau_shadow) for
an arbitrary simple graph, based on the dominance rule:
a vertex `u` lies in the shadow of `v` iff `deg(u) >= d(v,u)`.

## Files
- `dominanceShadowTopology.m` — main routine: builds the shadow subbase,
  closes it to a basis under intersection, then to a topology under union.
- `fixedPointClosure.m` — shared fixed-point closure subroutine used for
  both steps (with `&` for intersection, `|` for union).
- `printSets.m` — pretty-prints a set of indicator rows as vertex lists.
- `run_demo.m` — interactive script: enter a vertex count and edge list.

## Usage
```matlab
G = graph([1 2 3], [2 3 4]);   % path graph P4
T = dominanceShadowTopology(G);
printSets('Subbase',  T.Subbase,  T.Vertices);
printSets('Basis',    T.Basis,    T.Vertices);
printSets('Topology', T.Topology, T.Vertices);
```

Or run `run_demo.m` and enter the graph interactively. Entering
`n = 4`, `edgeList = [1 2; 2 3; 3 4]` reproduces the worked P4 example
in the paper.

## Citation
If you use this code, please cite the paper (details to be updated
upon publication).
