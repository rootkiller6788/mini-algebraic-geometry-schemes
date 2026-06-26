/-
Benchmark: ETH 401-3146 Algebraic Geometry
- Commutative algebra foundation ✓
- Affine and projective varieties ✓
- Sheaves and cohomology (beyond scope)
-/
import MiniAffineVarieties

open MiniAffineVarieties

def eth_coverage : List String := [
  "L1: Ring-theoretic foundations ✓",
  "L2: Ideals and algebraic sets ✓",
  "L3: Affine varieties ✓",
  "L4: Hilbert Basis + Nullstellensatz ✓",
  "L5: Proof techniques ✓",
  "L6: Classical examples ✓"
]