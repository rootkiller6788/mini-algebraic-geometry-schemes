import MiniCohomologyOfSchemes.Core.Basic
/-! Cohomology of algebraic surfaces. -/
namespace MiniCohomologyOfSchemes
def P2_surface_H0 (d : Int) : Nat := P2_h0_O_d d
def P2_surface_H2 (d : Int) : Nat := P2_h2_O_d d
def K3_H0 : Nat := 1
def K3_H1 : Nat := 0
def K3_H2 : Nat := 1
def abelian_H1 : Nat := 2
def enriques_H2 : Nat := 0
def noetherFormula (K2 eTop : Int) : Int := (K2 + eTop) / 12
def RR_surface (chiOX D2 DK : Int) : Int := chiOX + (D2 - DK) / 2
def P3_H0_O1 : Nat := 4
def P3_H0_O2 : Nat := 10
#eval K3_H0
#eval K3_H1
#eval K3_H2
#eval abelian_H1
#eval enriques_H2
#eval P3_H0_O1
#eval P3_H0_O2
#eval P2_surface_H0 0
#eval P2_surface_H0 1
#eval P2_surface_H2 (-3)


end MiniCohomologyOfSchemes