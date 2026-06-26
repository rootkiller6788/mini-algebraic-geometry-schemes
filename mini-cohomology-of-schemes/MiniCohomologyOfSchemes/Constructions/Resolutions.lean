import MiniCohomologyOfSchemes.Core.Basic
/-! Resolution techniques for sheaf cohomology. -/
namespace MiniCohomologyOfSchemes
structure Complex (X : Type u) where
  C : Nat -> SheafAb X
  d : forall n : Nat, AbGroupHom ((C n).globalSec) ((C (n+1)).globalSec)
def godementResolution (X : Type u) (F : SheafAb X) : Complex X :=
  Complex.mk (C := fun _ => F) (d := fun _ => AbGroupHom.id F.globalSec)
def deRhamComplex (k : CommRing) : Complex k.carrier :=
  Complex.mk (C := fun _ => SheafAb.mk (sections := fun _ => k.toAbGroup) (globalSec := k.toAbGroup)
    (res := fun _ _ => AbGroupHom.id k.toAbGroup) (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl)
    (locality := fun U s t h => h U)) (d := fun _ => AbGroupHom.id k.toAbGroup)
def flasqueResolution (X : Type u) (F : SheafAb X) : Complex X := godementResolution X F
#eval "Resolutions defined"


end MiniCohomologyOfSchemes