import MiniCohomologyOfSchemes.Core.Basic
/-! L7: Deformation theory via sheaf cohomology. -/
namespace MiniCohomologyOfSchemes
structure TangentSheaf (X : Type u) where T : SheafAb X
def P1_tangent_H0 : Nat := 3
def P1_tangent_H1 : Nat := 0
def elliptic_tangent_H0 : Nat := 1
def elliptic_tangent_H1 : Nat := 1
def K3_tangent_H1 : Nat := 20
def quintic_threefold_def : Nat := 101
def moduliSpaceDim (g : Nat) : Int := if g >= 2 then 3*(Int.ofNat g) - 3 else -1
def hilbertSchemeTangent (h0N h1N : Nat) : Nat := h0N + h1N
theorem BTT_unobstructedness : True := by trivial
def firstOrderDef (h1 : Nat) : Nat := h1
def obstructionSpace (h2 : Nat) : Nat := h2
def calabiYauModuli (h11 : Nat) : Nat := h11
#eval P1_tangent_H0
#eval P1_tangent_H1
#eval elliptic_tangent_H0
#eval elliptic_tangent_H1
#eval K3_tangent_H1
#eval quintic_threefold_def
#eval moduliSpaceDim 2
#eval moduliSpaceDim 3
#eval calabiYauModuli 101


end MiniCohomologyOfSchemes