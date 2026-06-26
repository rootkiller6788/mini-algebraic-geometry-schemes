# Course Dependency Tree: Cohomology of Schemes

## Prerequisites
```
Category Theory (mini-category-theory)
    |
Abelian Categories (mini-homological-algebra)
    |
Commutative Algebra (mini-commutative-algebra)
    |
Scheme Theory (mini-schemes)
    |
Coherent Sheaves (mini-coherent-sheaves)
    |
Cohomology of Schemes (THIS MODULE)
    |
    +-- Intersection Theory (mini-intersection-theory)
    +-- Derived Categories (mini-derived-categories)
    +-- Moduli Spaces (mini-moduli-spaces)
```

## Internal Dependency Tree
```
Core/Basic.lean (foundations: groups, rings, modules, sheaves)
    |
    +-- Core/DerivedFunctors.lean
    +-- Core/CechCohomology.lean
    +-- Core/AffineSchemes.lean
    +-- Core/ProjectiveSpace.lean
    +-- Core/SerreDuality.lean
    |
    +-- Constructions/Sheaves.lean
    +-- Constructions/Resolutions.lean
    +-- Constructions/SpectralSequences.lean
    |
    +-- Morphisms/Pushforward.lean
    +-- Morphisms/Pullback.lean
    |
    +-- Theorems/Vanishing.lean
    +-- Theorems/Finiteness.lean
    +-- Theorems/Comparison.lean
    |
    +-- Examples/Curves.lean
    +-- Examples/Surfaces.lean
    +-- Examples/Standard.lean
    |
    +-- Applications/RiemannRoch.lean
    +-- Applications/DeformationTheory.lean
    |
    +-- Advanced/EtaleCohomology.lean
    +-- Advanced/DerivedCategories.lean
    +-- Advanced/Motives.lean
```

## Knowledge Progression
1. Start with Basic.lean (groups, rings, modules, topology, sheaves)
2. Move to DerivedFunctors.lean and CechCohomology.lean (two cohomology approaches)
3. Apply to AffineSchemes.lean and ProjectiveSpace.lean (concrete computations)
4. Study SerreDuality.lean (duality theorem)
5. Explore Constructions (sheaf operations, resolutions, spectral sequences)
6. Understand Morphisms (pushforward, pullback)
7. Master Theorems (vanishing, finiteness, comparison)
8. Practice with Examples (curves, surfaces, standard)
9. Apply to Applications (Riemann-Roch, deformation theory)
10. Explore Advanced topics (etale, derived, motives)
