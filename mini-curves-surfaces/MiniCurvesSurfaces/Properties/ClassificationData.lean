/-
# MiniCurvesSurfaces: Properties — Classification Data (L3/L6)
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Properties.Invariants

namespace MiniCurvesSurfaces

inductive CurveClass where | rational | elliptic | generalType
  deriving Repr

def classifyCurve (g : Nat) : CurveClass :=
  match g with | 0 => CurveClass.rational | 1 => CurveClass.elliptic | _ => CurveClass.generalType

def moduliDimension (g : Nat) : Int :=
  match g with | 0 => 0 | 1 => 1 | _ => 3 * (g : Int) - 3

-- hurwitzBound defined in Morphisms/Iso.lean

def gonalityBound (g : Nat) : Nat := (g + 3) / 2

inductive SurfaceClass where
  | rational | ruled | ellipticSurface | abelianSurface | K3surface | enriquesSurface | generalType
  deriving Repr

inductive SurfaceKodairaDim where | negInf | zero | one | two
  deriving Repr

def classifySurfaceByKodaira (P2 P3 P4 : Nat) : SurfaceKodairaDim :=
  if P2 == 0 && P3 == 0 && P4 == 0 then SurfaceKodairaDim.negInf
  else if P2 <= 1 && P3 <= 1 && P4 <= 1 then SurfaceKodairaDim.zero
  else SurfaceKodairaDim.two

structure K3Surface where name : String deriving Repr
def k3IntersectionForm : String := "2*E8 + 3*U (signature 3,19)"
def schlafliDoubleSix : String := "a1..a6 | b1..b6: ai*bj=0 iff i!=j, ai*aj=1, bi*bj=1"

def curveClassificationTable : List (Nat × String × String) :=
  [(0, "Rational", "P^1, all isomorphic, dim(M_0)=0"),
   (1, "Elliptic", "j-invariant in A^1, dim(M_{1,1})=1"),
   (2, "Hyperelliptic (all)", "y^2 = f_5 or f_6, dim(M_2)=3"),
   (3, "Hyperelliptic or quartic", "dim(M_3)=6, hyperelliptic dim 5"),
   (4, "Non-hyperelliptic (general)", "dim(M_4)=9, canonical in P^3"),
   (5, "Petri-general", "dim(M_5)=12, complete intersection of 3 quadrics")]

def surfaceClassificationTable : List (String × String × String) :=
  [("kappa=-inf", "Rational", "P^2, q=p_g=0, Castelnuovo criterion"),
   ("kappa=-inf", "Ruled", "P^1-bundle over curve C, q=g(C)"),
   ("kappa=0", "K3", "K=0, q=0, p_g=1, b_2=22"),
   ("kappa=0", "Enriques", "2K=0, K!=0, pi_1=Z/2, b_2=10"),
   ("kappa=0", "Abelian", "C^2/Lattice, K=0, q=2"),
   ("kappa=0", "Bielliptic", "Quotient of abelian by finite group"),
   ("kappa=1", "Elliptic", "Fibration pi: S->C, general fiber elliptic"),
   ("kappa=2", "General Type", "K ample on minimal model, K^2 <= 9chi")]

def cliffordTheorem (degD r : Nat) : String :=
  s!"Clifford: for special divisor D: r <= deg(D)/2, equality <=> D=0, K, or C hyperelliptic"

def castelnuovoCriterionRational : String :=
  "Surface S is rational iff q(S) = P_2(S) = 0 (Castelnuovo's criterion)"

def geographyBoundsSurfaces (chi : Int) : String :=
  s!"For general type: 2*{chi}-6 <= K^2 <= 9*{chi}"

def bogomolovMiyaokaYau : String :=
  "Bogomolov-Miyaoka-Yau: c_1^2 <= 3*c_2 for surfaces of general type (K^2 <= 9*chi)"

#eval classifyCurve 0
#eval classifyCurve 1
#eval classifyCurve 3
#eval moduliDimension 0
#eval moduliDimension 1
#eval moduliDimension 2
#eval moduliDimension 5
#eval 0  -- hurwitzBound in Iso.lean 2
#eval 0  -- hurwitzBound in Iso.lean 3
#eval gonalityBound 3
#eval gonalityBound 5
#eval classifySurfaceByKodaira 0 0 0
#eval classifySurfaceByKodaira 1 1 1
#eval classifySurfaceByKodaira 2 3 5
#eval curveClassificationTable
#eval surfaceClassificationTable
#eval cliffordTheorem 4 2
#eval geographyBoundsSurfaces 5
#eval geographyBoundsSurfaces 10
#eval castelnuovoCriterionRational
#eval bogomolovMiyaokaYau

end MiniCurvesSurfaces