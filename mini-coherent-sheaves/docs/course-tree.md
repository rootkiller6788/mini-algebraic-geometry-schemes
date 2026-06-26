# Course Tree — mini-coherent-sheaves

## Prerequisites

```
Category Theory (module 2)
    ├── Functors, natural transformations, adjunctions
    └── Limits, colimits, abelian categories

Commutative Algebra (module 5)
    ├── Commutative rings, ideals, modules
    ├── Noetherian rings, localization
    └── Integral extensions, dimension theory

Topology (module 10)
    └── Topological spaces, open sets, continuous maps
```

## Internal Dependency Graph

```
Core/Basic.lean (foundations)
├── Core/Objects.lean
│   ├── Morphisms/Hom.lean
│   │   ├── Morphisms/Iso.lean
│   │   ├── Constructions/KernelCokernel.lean
│   │   └── Constructions/DirectSum.lean
│   ├── Core/Laws.lean
│   │   ├── Constructions/TensorProducts.lean
│   │   └── Constructions/CohomologyGroups.lean
│   └── Properties/Invariants.lean
│       ├── Properties/Preservation.lean
│       └── Properties/ClassificationData.lean
├── Theorems/Serre.lean
│   ├── Theorems/RiemannRoch.lean
│   ├── Theorems/Vanishing.lean
│   └── Theorems/MainTheorems.lean
├── Examples/Standard.lean
├── Examples/Counterexamples.lean
├── Bridges/ToAlgebra.lean
├── Bridges/ToGeometry.lean
├── Bridges/ToNumberTheory.lean
├── Bridges/ToPhysics.lean
├── Advanced/Derived.lean
│   ├── Advanced/FourierMukai.lean
│   └── Advanced/Stability.lean
└── Research/Frontiers.lean
```

## Learning Path

### Beginner Path (L1-L3)
1. Core/Basic.lean — Learn fundamental definitions
2. Core/Objects.lean — Learn specialized sheaf types
3. Core/Laws.lean — Learn sheaf operations and laws
4. Morphisms/Hom.lean — Understand homomorphisms
5. Morphisms/Iso.lean — Understand isomorphisms
6. Examples/Standard.lean — See concrete examples

### Intermediate Path (L4-L6)
1. Theorems/Serre.lean — Study foundational theorems
2. Theorems/RiemannRoch.lean — Understand Riemann-Roch
3. Constructions/CohomologyGroups.lean — Compute cohomology
4. Properties/Invariants.lean — Work with invariants
5. Examples/Counterexamples.lean — Study pathologies

### Advanced Path (L7-L9)
1. Bridges/ToAlgebra.lean — Applications in algebra
2. Bridges/ToGeometry.lean — Applications in geometry
3. Advanced/Derived.lean — Derived categories
4. Advanced/FourierMukai.lean — FM transforms
5. Advanced/Stability.lean — Stability conditions
6. Research/Frontiers.lean — Current research
