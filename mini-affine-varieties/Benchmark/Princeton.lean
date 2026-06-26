/-
Benchmark: Princeton MAT 520/560 Algebraic Geometry
- Affine and projective varieties ✓
- Birational geometry ✓
- Schemes (beyond scope)
- Cohomology (beyond scope)
-/
import MiniAffineVarieties

open MiniAffineVarieties

def princeton_coverage : List String := [
  "L1: Affine varieties ✓",
  "L2: Birational equivalence ✓",
  "L3: Products and fiber products ✓",
  "L4: Nullstellensatz ✓",
  "L5: Classification of conics/cubics ✓",
  "L7: Elliptic curve cryptography ✓"
]