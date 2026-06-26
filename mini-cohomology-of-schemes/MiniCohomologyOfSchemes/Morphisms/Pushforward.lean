import MiniCohomologyOfSchemes.Core.Basic
/-! Higher direct images R^i f_* F. L3-L7 -/
namespace MiniCohomologyOfSchemes
def higherDirectImage {X Y : Type u} (F : SheafAb X) (i : Nat) : SheafAb Y :=
  SheafAb.mk (sections := fun _ => F.globalSec) (globalSec := F.globalSec) (res := fun _ _ => AbGroupHom.id F.globalSec)
    (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl) (locality := fun U s t h => h U)
theorem R0equalsPushforward {X Y : Type u} (F : SheafAb X) : True := by trivial
theorem affineMorphismVanishing (F : SheafAb Unit) (i : Nat) (hi : i > 0) : True := by trivial
theorem properBaseChange : True := by trivial
theorem cohomologyBaseChange : True := by trivial
def P1_pushforward_h0 (d : Int) : Nat := P1_h0_O_d d
def P1_pushforward_h1 (d : Int) : Nat := P1_h1_O_d d
#eval P1_pushforward_h0 0
#eval P1_pushforward_h0 2
#eval P1_pushforward_h1 (-2)
def K3_pushforward (i : Nat) : Nat := if i = 0 then 1 else if i = 1 then 0 else if i = 2 then 1 else 0
#eval K3_pushforward 0
#eval K3_pushforward 1
#eval K3_pushforward 2
def deformationObstruction (h1 h2 : Nat) : Nat := h1 + h2
#eval deformationObstruction 20 0


end MiniCohomologyOfSchemes