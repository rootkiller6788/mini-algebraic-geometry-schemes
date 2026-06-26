/-
Benchmark: Berkeley Math 256A/B Algebraic Geometry
- Schemes via Hartshorne ✓ (partial)
- Cohomology of sheaves (beyond scope)
- Curves and surfaces ✓
-/
import MiniAffineVarieties

open MiniAffineVarieties

def berkeley_coverage : List String := [
  "L1: Affine varieties ✓",
  "L2: Regular maps and isomorphisms ✓",
  "L3: Products and subvarieties ✓",
  "L4: Nullstellensatz + Noether normalization ✓",
  "L5: Multiple proof methods ✓",
  "L6: Curves, surfaces, singularities ✓",
  "L7: ECC cryptography ✓",
  "L8: Resolution of singularities ✓"
]