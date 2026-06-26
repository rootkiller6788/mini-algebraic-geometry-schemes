import MiniCohomologyOfSchemes.Core.Basic
/-! L9: Grothendieck motives, Voevodsky motives, Standard Conjectures. Research frontiers. -/
namespace MiniCohomologyOfSchemes
structure GrothendieckMotive where variety : Type u
def chowMotiveCategory : Type := Nat
def motivicCohomDim (p q : Int) : Nat := 0
def voevodskyMotives : Type := Nat
def Pn_motivicDecomposition (n : Nat) : List String :=
  List.range (n+1) |>.map (fun i => "Z(" ++ toString i ++ ")[2*" ++ toString i ++ "]")
def standardConjectures : List String :=
  ["Kunneth: diagonal classes are algebraic",
   "Hodge: positivity of intersection pairing",
   "Numerical equivalence = homological equivalence"]
def motivicGaloisGroup : String := "G_mot (Tannakian)"
def mixedMotiveExtensions : String := "Ext^1(Q(0), Q(1)) = k^*"
def lefschetzMotive : String := "L = Z(-1)[-2]"
def curveMotive (g : Nat) : String := "Z + h^1(C) (dim 2*" ++ toString g ++ ") + Z(1)[2]"
def surfaceMotive (rho h20 : Nat) : String :=
  "Z + NS(rho=" ++ toString rho ++ ") + T(dim=" ++ toString h20 ++ ") + Z(2)[4]"
def beilinsonConjecture (Lval : Int) (rank : Nat) : Bool := Lval = (Int.ofNat rank)
def blochBeilinsonFiltration : String := "F^0 CH^i ... F^{i+1} CH^i = 0"
def motivicHomotopyCategory : Type := Nat
def motivicSteenrodAlgebra : String := "M_2"
def researchMotives : String := "Construct MM(Z) with motivic t-structure on DM(Z)"
#eval Pn_motivicDecomposition 2
#eval standardConjectures
#eval curveMotive 1
#eval researchMotives


end MiniCohomologyOfSchemes