/-
Benchmark: Cambridge Part III Algebraic Geometry
- Classical algebraic geometry ✓
- Schemes and sheaf cohomology (beyond scope)
- Curves and surfaces ✓
-/
import MiniAffineVarieties

open MiniAffineVarieties

def cambridge_coverage : List String := [
  "L1: Affine varieties ✓",
  "L2: Regular and rational maps ✓",
  "L3: Product varieties ✓",
  "L6: Curves (conics, cubics) ✓",
  "L6: Surfaces (quadrics) ✓",
  "L7: Classical geometry bridge ✓",
  "L8: Singularities ✓"
]