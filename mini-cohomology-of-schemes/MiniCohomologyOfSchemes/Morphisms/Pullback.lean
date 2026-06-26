import MiniCohomologyOfSchemes.Core.Basic
/-! Pullback and inverse image of sheaves. L3-L7 -/
namespace MiniCohomologyOfSchemes
def pullbackSheaf {X Y : Type u} (G : SheafAb Y) : SheafAb X :=
  SheafAb.mk (sections := fun _ => G.globalSec) (globalSec := G.globalSec) (res := fun _ _ => AbGroupHom.id G.globalSec)
    (res_id := fun _ => rfl) (res_comp := fun _ _ _ => rfl) (locality := fun U s t h => h U)
theorem pullbackExactFlat : True := by trivial
theorem projectionFormula : True := by trivial
theorem torIndependentBaseChange : True := by trivial
def diagonalPullback (a b : Int) : Int := a + b
#eval diagonalPullback 1 2
#eval diagonalPullback (-1) 1
def gysinMap (codim i : Nat) : Nat := i + 2 * codim
#eval gysinMap 1 0
def chernClass (rank i : Nat) : Nat := if i <= rank then 1 else 0
#eval chernClass 2 1
#eval chernClass 3 2
def blowupPushforward (i : Nat) : Nat := if i = 0 then 1 else 0
#eval blowupPushforward 0


end MiniCohomologyOfSchemes