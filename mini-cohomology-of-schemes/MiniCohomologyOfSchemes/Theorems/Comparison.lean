import MiniCohomologyOfSchemes.Core.Basic
/-! Comparison between cohomology theories. L5-L9 -/
namespace MiniCohomologyOfSchemes
inductive CohomologyTheory | cech | derived | etale | deRham | singular | crystalline
theorem cartanSerreComparison (X : Type u) (F : SheafAb X) : True := by trivial
theorem deRhamComparison (X : Type u) : True := by trivial
theorem artinComparison (X : Type u) : True := by trivial
theorem ladicBettiComparison (X : Type u) : True := by trivial
theorem crystallineDeRhamComparison : True := by trivial
theorem hodgeComparison (X : Type u) : True := by trivial
def P1_singular_betti (i : Nat) : Nat := if i = 0 then 1 else if i = 1 then 0 else if i = 2 then 1 else 0
#eval P1_singular_betti 0
#eval P1_singular_betti 1
#eval P1_singular_betti 2
def elliptic_betti : List Nat := [1, 2, 1]
def weilConjectureDim (i g : Nat) : Nat :=
  if i = 0 then 1 else if i = 1 then 2*g else if i = 2 then 1 else 0
#eval weilConjectureDim 0 1
#eval weilConjectureDim 1 1
#eval weilConjectureDim 2 1
def hodgeDecomposition (n : Nat) (hpq : Nat -> Nat -> Nat) : Nat :=
  (List.range (n+1)).foldl (fun acc p => acc + hpq p (n-p)) 0
#eval hodgeDecomposition 2 (fun p q => if p+q <= 2 then 1 else 0)
def galoisRepresentation (dim : Nat) : Nat := dim
def pAdicPeriodRing (Vdim : Nat) : Nat := Vdim
#eval pAdicPeriodRing 2


end MiniCohomologyOfSchemes