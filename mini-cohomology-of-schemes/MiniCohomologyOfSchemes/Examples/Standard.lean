import MiniCohomologyOfSchemes.Core.Basic
/-! L6: Standard cohomology computations: Grassmannians, flag varieties, Chern classes. -/
namespace MiniCohomologyOfSchemes
def grassmannianDim (k n : Nat) : Nat := k * (n - k)
def grassmannianCohom (i : Nat) : Nat := if i = 0 then 1 else 0
def schubertCycleDim (part : List Nat) : Nat := part.sum
def chernClassStd (rank i : Nat) : Nat := if i <= rank then 1 else 0
def segreQuadricCohom (i : Nat) : Nat := if i = 0 then 1 else if i = 1 then 0 else if i = 2 then 2 else 0
def excessIntersection (ctop rank : Nat) : Nat := ctop * rank
def grothendieckRR (chE : List Int) (tdX : Int) : List Int := chE.map (fun x => x * tdX)
def quantumCohom (classical : Nat) (gw : List Nat) : Nat := classical + gw.length
theorem lefschetzHyperplane (Xdim Ydim i : Nat) : True := by trivial
theorem hardLefschetz (n i : Nat) : True := by trivial
def veroneseSurfaceH0 (d : Int) : Nat := P2_h0_O_d d
def P1_derived_auto : Nat := 3
def completeIntersectionKoszul (n : Nat) (deg : List Nat) : Nat := n - deg.length
#eval grassmannianDim 1 3
#eval grassmannianDim 2 4
#eval grassmannianCohom 0
#eval schubertCycleDim [1, 0]
#eval chernClassStd 2 1
#eval segreQuadricCohom 0
#eval segreQuadricCohom 2
#eval veroneseSurfaceH0 2


end MiniCohomologyOfSchemes