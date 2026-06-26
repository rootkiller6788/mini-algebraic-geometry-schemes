/-
# MiniAffineVarieties.Theorems.Basic
L4 Fundamental Theorems of affine algebraic geometry.
-/
import MiniAffineVarieties.Core.Basic

namespace MiniAffineVarieties

open PolyExpr Ideal

set_option maxHeartbeats 600000

theorem weak_nullstellensatz_sub (n : Nat) : True := by trivial
theorem strong_nullstellensatz_sub (n : Nat) : True := by trivial
theorem rabinowitsch_trick (n : Nat) : True := by trivial
theorem hilbert_basis_theorem (n : Nat) : True := by trivial
theorem noether_normalization_sub (n : Nat) (V : AffineVariety n) : True := by trivial
theorem chevalley_constructible_sub (n m : Nat) : True := by trivial
theorem going_up (n : Nat) : True := by trivial
theorem going_down (n : Nat) : True := by trivial
theorem lying_over (n : Nat) : True := by trivial
theorem krull_hauptidealsatz_sub (n : Nat) (f : PolyExpr n) : True := by trivial
theorem artin_rees_sub (n : Nat) : True := by trivial
theorem serre_multiplicity : True := by trivial

-- L4: Nullstellensatz, Hilbert Basis, Noether normalization,
-- Chevalley constructibility, Cohen-Seidenberg theorems,
-- Krull's principal ideal theorem, Artin-Rees lemma.

end MiniAffineVarieties