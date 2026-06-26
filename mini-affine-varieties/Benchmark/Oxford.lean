/-
Benchmark: Oxford C2.5 Scheme Theory / C3.4 Algebraic Geometry
- Affine schemes as Spec of rings
- Sheaves and locally ringed spaces
- Our coverage: affine varieties (more classical)
-/
import MiniAffineVarieties

open MiniAffineVarieties

def oxford_coverage : List String := [
  "L1: Spec-like constructions (MaximalSpectrum) ✓",
  "L3: Category theory bridge ✓",
  "L4: Nullstellensatz ✓",
  "L8: Dimension theory ✓"
]