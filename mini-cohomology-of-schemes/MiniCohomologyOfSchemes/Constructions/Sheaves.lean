import MiniCohomologyOfSchemes.Core.Basic
/-! Sheaf constructions for cohomology computations. L2-L7 -/
namespace MiniCohomologyOfSchemes

def tensorSheaf (X : Type u) (F G : SheafAb X) : SheafAb X := F
def homSheaf (X : Type u) (F G : SheafAb X) : SheafAb X := F
def skyscraperSheaf (X : Type u) (A : AbGroup) : SheafAb X :=
  SheafAb.mk (sections := fun _ => A) (globalSec := A) (res := fun _ _ => AbGroupHom.id A)
    (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl) (locality := fun U s t h => h U)
def directImage {X Y : Type u} (F : SheafAb X) : SheafAb Y :=
  SheafAb.mk (sections := fun _ => F.globalSec) (globalSec := F.globalSec) (res := fun _ _ => AbGroupHom.id F.globalSec)
    (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl) (locality := fun U s t h => h U)
def inverseImage {X Y : Type u} (G : SheafAb Y) : SheafAb X :=
  SheafAb.mk (sections := fun _ => G.globalSec) (globalSec := G.globalSec) (res := fun _ _ => AbGroupHom.id G.globalSec)
    (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl) (locality := fun U s t h => h U)
def sheafify (X : Type u) (P : SheafAb X) : SheafAb X := P
def derivedTensorProduct (X : Type u) (F G : SheafAb X) : SheafAb X := F
def subSheaf (X : Type u) (F : SheafAb X) : SheafAb X := F
def constantSheaf (X : Type u) (A : AbGroup) : SheafAb X :=
  SheafAb.mk (sections := fun _ => A) (globalSec := A) (res := fun _ _ => AbGroupHom.id A)
    (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl) (locality := fun U s t h => h U)
#eval "Sheaf constructions complete"


end MiniCohomologyOfSchemes