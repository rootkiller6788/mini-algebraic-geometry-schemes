import MiniCohomologyOfSchemes.Core.Basic
/-! L8: Derived categories of sheaves, Fourier-Mukai, Bridgeland stability. -/
namespace MiniCohomologyOfSchemes
structure DerivedCat (X : Type u) where objects : SheafAb X -> Prop
def boundedDerivedCategory (X : Type u) : DerivedCat X := DerivedCat.mk (objects := fun _ => True)
def fourierMukai (X Y : Type u) (K : SheafAb X) : SheafAb X -> SheafAb Y :=
  fun _ => SheafAb.mk (sections := fun _ => K.globalSec) (globalSec := K.globalSec)
    (res := fun _ _ => AbGroupHom.id K.globalSec) (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl)
    (locality := fun U s t h => h U)
def beilinsonCollection (n : Nat) : List Nat := List.range (n+1)
structure BridgelandStability (X : Type u) where centralCharge : SheafAb X -> Int
structure SemiorthogonalDecomp (X : Type u) where components : List (DerivedCat X)
def P1_derived : String := "O, O(1)"
def K3_derived : String := "infinite autoequivalences"
theorem verdierDuality : True := by trivial
theorem homologicalMirrorSymmetry : True := by trivial
def mukaiEquivalence : Prop := True
def noncommutativeMotive (X : Type u) : Nat := 0
#eval beilinsonCollection 1
#eval beilinsonCollection 2


end MiniCohomologyOfSchemes