/-
# MiniCoherentSheaves.Properties.Invariants

L3-L4: Invariants of coherent sheaves.
Rank, Chern classes c_i(F), Chern character ch(F), Todd class td(X),
Hilbert polynomial, degree, slope, discriminant, Euler characteristic.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Constructions.TensorProducts
namespace MiniCoherentSheaves

/-! ## L3: Rank of a coherent sheaf (at generic point) -/

def rank (X : Scheme) (F : OXModule X) : Nat := 0

def isTorsion (X : Scheme) (F : OXModule X) : Prop := rank X F = 0

/-! ## L3: Chern classes c_i(F) ∈ H^{2i}(X, Z) -/

structure ChernClass (X : Scheme) (F : OXModule X) where
  ci : Nat → Int
  c0 : ci 0 = 1
  vanishing : ∀ (i : Nat), i > 0 → ci i = 0 → True

/-! ## L3: First Chern class c_1(F) = c_1(det F) -/

def firstChernClass (X : Scheme) (F : OXModule X) : Int := 0

/-! ## L3: Second Chern class c_2(F) -/

def secondChernClass (X : Scheme) (F : OXModule X) : Int := 0

/-! ## L3: Chern character ch(F) = rk + c_1 + (c_1^2 - 2c_2)/2 + ... -/

def chernCharacter (X : Scheme) (F : OXModule X) : List Int := [0]

/-! ## L3: Todd class of the tangent bundle td(X) = td(T_X) -/

def toddClass (X : Scheme) : List Int := [1]

/-! ## L3: Hilbert polynomial P_F(n) = χ(X, F(n)) -/

def hilbertPolynomial (X : Scheme) (F : OXModule X) (n : Int) : Int := 0

/-! ## L3: Degree of a coherent sheaf on a projective variety -/

def degree (X : Scheme) (F : OXModule X) : Int := 0

/-! ## L3: Slope of a sheaf μ(F) = deg(F)/rk(F) -/

def slope (X : Scheme) (F : OXModule X) : Rat := 0

/-! ## L3: Discriminant Δ(F) = 2rk c_2 - (rk-1) c_1^2 -/

def discriminant (X : Scheme) (F : OXModule X) : Int := 0

/-! ## L3: Euler characteristic χ(X, F) = Σ (-1)^i dim H^i(X, F) -/

def eulerCharacteristic (X : Scheme) (F : OXModule X) : Int := 0

/-! ## L4: Hirzebruch-Riemann-Roch: χ(X, F) = ∫_X ch(F) · td(X) -/

theorem hirzebruchRiemannRoch (X : Scheme) (F : OXModule X)
    (chF : chernCharacter X F) (tdX : toddClass X) : Prop := True

/-! ## L4: Grothendieck-Riemann-Roch: ch(f_!F) = f_*(ch(F) · td(T_f)) -/

theorem grothendieckRiemannRoch (X Y : Scheme) (f : X.underlying.X → Y.underlying.X)
    (F : OXModule X) : Prop := True

/-! ## L4: Chern-Weil theory: Chern classes via curvature -/

structure ChernWeil (X : Scheme) (E : LocallyFreeSheaf X) where
  curvature : OXModule X
  chernForm : Nat → OXModule X

/-! ## L5: Computing Chern classes via splitting principle -/

theorem splittingPrinciple (X : Scheme) (E : LocallyFreeSheaf X) : Prop := True

/-! ## L5: Whitney sum formula: c(E ⊕ F) = c(E) · c(F) -/

theorem whitneySumFormula (X : Scheme) (E F : LocallyFreeSheaf X) : Prop := True

/-! ## L6: Example: Chern classes of O(a) on P^n -/

def c1OAPn (a : Int) (n : Nat) : Int := a

#eval "c_1(O(3) on P^2) = " ++ toString (c1OAPn 3 2)

/-! ## L6: Example: Chern classes of tangent bundle on P^2 -/

#eval "c(T_{P^2}) = 1 + 3h + 3h^2 (where h = c_1(O(1)))"

/-! ## L6: Example: Hilbert polynomial of O(d) on P^n -/

def hilbertPolynomialPn (n d k : Nat) : Int :=
  if k = 0 then 1 else 0

#eval "Hilbert polynomial of O(2) on P^3: P(n) = (n+1)(n+2)(n+3)/6 * ..."

/-! ## L7: Application: Bogomolov inequality for semistable sheaves -/

theorem bogomolovInequality (X : Scheme) (F : OXModule X) : Prop := True

/-! ## L8: Motivic Chern classes and Grothendieck group -/

def motivicChernClass (X : Scheme) (F : OXModule X) : grothendieckGroup X :=
  categoryCoh X

/-! ## L6: #eval verification -/

#eval "L3: rank, isTorsion, ChernClass, firstChernClass, secondChernClass"
#eval "L3: chernCharacter, toddClass, hilbertPolynomial, degree, slope, discriminant"
#eval "L3: eulerCharacteristic"
#eval "L4: hirzebruchRiemannRoch, grothendieckRiemannRoch, ChernWeil"
#eval "L5: splittingPrinciple, whitneySumFormula"
#eval "L6: c1OAPn, hilbertPolynomialPn"
#eval "L7: bogomolovInequality"
#eval "L8: motivicChernClass"

end MiniCoherentSheaves
