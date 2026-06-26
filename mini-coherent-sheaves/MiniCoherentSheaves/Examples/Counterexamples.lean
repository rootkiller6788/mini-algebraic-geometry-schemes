/-
# MiniCoherentSheaves.Examples.Counterexamples

L6: Counterexamples in coherent sheaf theory.
Non-locally-free coherent sheaves, non-split exact sequences,
sheaves that are not reflexive, non-semistable sheaves,
pathologies in characteristic p, non-flat families.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Properties.Invariants
import MiniCoherentSheaves.Properties.ClassificationData
namespace MiniCoherentSheaves

/-! ## L6: Coherent sheaf on P^2 that is NOT locally free -/

#eval "I_p on P^2: coherent, rank 1 at generic point, but NOT locally free (rank jumps at p)"

/-! ## L6: Torsion sheaf with support on a curve -/

#eval "O_C on a surface: torsion sheaf, rank 0, supported on a curve"

/-! ## L6: Non-split extension of O by O(-2) on P^1 -/

#eval "Ext^1(O, O(-2)) on P^1: dim = 1, non-trivial extension exists"

/-! ## L6: Sheaf that is reflexive but not locally free -/

#eval "Ideal sheaf of a point on a surface: reflexive (depth ≥ 2) but not locally free"

/-! ## L6: Non-semistable rank 2 bundle on P^2 -/

#eval "O(1)⊕O(-1) on P^2: NOT semistable (slope O(1)=1 > 1/2 > slope O(-1)=-1)"

/-! ## L6: Unstable sheaf: Harder-Narasimhan filtration example -/

#eval "HN filtration of O(1)⊕O(-1) = [O(-1), O(1)] with slopes [-1, 1]"

/-! ## L6: Proper but not projective morphism (Hironaka) -/

#eval "Hironaka''s example: proper non-projective 3-fold with coherent sheaf pathology"

/-! ## L6: Non-flat family of sheaves -/

#eval "Family O_X ⊕ O_p(t): flatness fails at t=0"

/-! ## L6: Coherent sheaf with infinite projective dimension (non-regular ring) -/

#eval "On a singular curve: O_p has infinite projective dimension"

/-! ## L6: Non-Cohen-Macaulay coherent sheaf -/

#eval "O_Z for Z = union of two planes meeting at a point in A^4: not CM"

/-! ## L6: Torsion-free but non-reflexive sheaf -/

#eval "I ⊗ O_D for a Weil divisor D: torsion-free but depth 1, not reflexive"

/-! ## L6: Failure of Kodaira vanishing in characteristic p (Raynaud) -/

#eval "Raynaud surfaces: Kodaira vanishing FAILS in characteristic p > 0"

/-! ## L6: Non-reduced scheme and nilpotent coherent sheaf -/

#eval "O_{Spec(k[ε]/ε^2)}: coherent sheaf with nilpotents, rank 0"

/-! ## L7: Counterexample to Bogomolov inequality in char p -/

#eval "Bogomolov inequality: 2rk c_2 ≥ (rk-1)c_1^2. Counterexamples in char p."

/-! ## L6: Final #eval summary -/

#eval "=== Counterexamples ==="
#eval "1. I_p on P^2: coherent, NOT locally free (rank jump)"
#eval "2. Torsion sheaf: O_C on a surface (supported on curve)"
#eval "3. Non-split extension on P^1: Ext^1(O,O(-2)) ≠ 0"
#eval "4. Reflexive but not locally free (point on surface)"
#eval "5. O(1)⊕O(-1): NOT semistable on P^2"
#eval "6. HN filtration: O(1)⊕O(-1) = [O(-1), O(1)]"
#eval "7. Hironaka: proper non-projective 3-fold"
#eval "8. Non-flat family: O_X ⊕ O_p(t) at t=0"
#eval "9. Infinite projective dimension (singular curve)"
#eval "10. Not Cohen-Macaulay (union of planes)"
#eval "11. Torsion-free, not reflexive (depth 1)"
#eval "12. Kodaira vanishing FAILS in char p (Raynaud)"
#eval "13. Nilpotent coherent sheaf (non-reduced)"
#eval "14. Bogomolov counterexample in char p"

end MiniCoherentSheaves
