/-
Benchmark: MIT 18.725 Algebraic Geometry
- Affine varieties, Hilbert Nullstellensatz ✓
- Projective varieties, sheaves (partial)
- Smoothness, singularities ✓
- Schemes (beyond scope)
-/
import MiniAffineVarieties

open MiniAffineVarieties

def mit_coverage : List String := [
  "L1: Affine algebraic sets ✓",
  "L4: Hilbert Nullstellensatz ✓",
  "L4: Hilbert Basis Theorem ✓",
  "L3: Category of varieties ✓",
  "L6: Classical examples ✓",
  "L8: Smoothness and singularities ✓"
]