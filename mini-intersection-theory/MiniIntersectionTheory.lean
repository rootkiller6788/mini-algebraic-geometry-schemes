/-
# MiniIntersectionTheory

Intersection theory in algebraic geometry: Chow groups, intersection
products, Chern classes, and fundamental theorems following
Fulton's "Intersection Theory".

## Sub-packages
- `Core`         -- Varieties, subvarieties, divisors, rational functions
- `Chow`         -- Cycles, Chow groups, rational equivalence
- `Intersection` -- Intersection product, multiplicities, excess formula
- `Chern`        -- Chern classes, Chern character, characteristic classes
- `Theorems`     -- Bezout, projection formula, Riemann-Roch
- `Proofs`       -- Deformation, diagonal reduction, blow-ups
- `Examples`     -- Projective space, curves on surfaces, Grassmannians
- `Applications` -- Enumerative geometry, singularity theory
- `Advanced`     -- Gromov-Witten theory, virtual fundamental classes

## Nine-Level Knowledge Coverage
- L1: Definitions -- Variety, Cycle, ChowGroup, ChernClass
- L2: Core Concepts -- Rational equivalence, proper intersection
- L3: Math Structures -- Chow ring, graded ring, characteristic classes
- L4: Fundamental Theorems -- Bezout, Riemann-Roch, projection formula
- L5: Proof Techniques -- Deformation to normal cone, reduction to diagonal
- L6: Canonical Examples -- Chow ring of P^n, curves on surfaces
- L7: Applications -- Enumerative geometry, singularity theory
- L8: Advanced Topics -- Gromov-Witten invariants, virtual classes
- L9: Research Frontiers -- Documented in Advanced.lean
-/

import MiniIntersectionTheory.Core.Basic
import MiniIntersectionTheory.Core.Objects
import MiniIntersectionTheory.Chow
import MiniIntersectionTheory.Intersection
import MiniIntersectionTheory.Chern
import MiniIntersectionTheory.Theorems
import MiniIntersectionTheory.Proofs
import MiniIntersectionTheory.Examples
import MiniIntersectionTheory.Applications
import MiniIntersectionTheory.Advanced

/-- Total module: ~3000 lines of intersection theory formalism. -/


/- Intersection theory module loaded -/

