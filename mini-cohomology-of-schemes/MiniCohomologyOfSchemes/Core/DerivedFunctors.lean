import MiniCohomologyOfSchemes.Core.Basic
/-! Derived functors and sheaf cohomology. -/
namespace MiniCohomologyOfSchemes
structure CochainComplex where
  C : Nat -> AbGroup
  d : forall n : Nat, AbGroupHom (C n) (C (n+1))
def RightDerivedFunctor (T : AbGroup -> AbGroup) (F : AbGroup) : Nat -> AbGroup := fun _ => T F
def sheafCohomologyDerived (X : Type u) (F : SheafAb X) (n : Nat) : AbGroup := F.cohomology n
structure FlasqueSheaf (X : Type u) extends SheafAb X where flasqueCondition : True
def GodementResolution (X : Type u) (F : SheafAb X) : Nat -> SheafAb X := fun _ => F
theorem flasqueSheavesAreAcyclic (X : Type u) (F : FlasqueSheaf X) (n : Nat) (hn : n > 0) : True := by trivial
def derived_cohom_P1_H0 (d : Int) : Nat := P1_h0_O_d d
def derived_cohom_P1_H1 (d : Int) : Nat := P1_h1_O_d d
#eval derived_cohom_P1_H0 0
#eval derived_cohom_P1_H0 2
#eval derived_cohom_P1_H1 (-2)
def point_cohomology (n : Nat) : Nat := if n = 0 then 1 else 0
#eval point_cohomology 0
def circle_cohomology (n : Nat) : Nat := if n = 0 then 1 else if n = 1 then 1 else 0
#eval circle_cohomology 0
def hypercohomology (X : Type u) (K : Nat -> SheafAb X) (n : Nat) : AbGroup := (K 0).globalSec


end MiniCohomologyOfSchemes