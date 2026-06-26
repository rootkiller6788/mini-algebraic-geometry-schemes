/-
# MiniCurvesSurfaces: Examples — Standard Examples (L6)
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Laws
import MiniCurvesSurfaces.Core.Objects
import MiniCurvesSurfaces.Properties.Invariants
import MiniCurvesSurfaces.Constructions.Subobjects

namespace MiniCurvesSurfaces

def unitCircle : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 2, expY := 0 }),
                             (1, { expX := 0, expY := 2 }),
                             (-1, Monomial.one)] },
    name := "unit circle" }

def parabolaCurve : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 1 }),
                             (-1, { expX := 2, expY := 0 })] },
    name := "parabola y=x^2" }

structure WeierstrassCurve where
  a : Int
  b : Int
  name : String
  deriving Repr

def WeierstrassCurve.discriminant (E : WeierstrassCurve) : Int :=
  -16 * (4 * E.a * E.a * E.a + 27 * E.b * E.b)

def WeierstrassCurve.jInvariant (E : WeierstrassCurve) : Int :=
  let Δ := 4 * E.a * E.a * E.a + 27 * E.b * E.b
  if Δ == 0 then 0 else 1728 * 4 * E.a * E.a * E.a / Δ

def WeierstrassCurve.toAffine (E : WeierstrassCurve) : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (-E.a, { expX := 1, expY := 0 }),
                             (-E.b, Monomial.one)] },
    name := E.name }

def E_ex1 : WeierstrassCurve := { a := -1, b := 0, name := "E1: y^2=x^3-x" }
def E_ex2 : WeierstrassCurve := { a := 0, b := 7, name := "E2: y^2=x^3+7" }

inductive ECPoint where
  | infinity : ECPoint
  | affine (x y : Int) : ECPoint
  deriving Repr, Inhabited

def ECPoint.onCurve (P : ECPoint) (E : WeierstrassCurve) : Bool :=
  match P with
  | ECPoint.infinity => true
  | ECPoint.affine x y => y * y == x * x * x + E.a * x + E.b

def ECPoint.neg (P : ECPoint) : ECPoint :=
  match P with
  | ECPoint.infinity => ECPoint.infinity
  | ECPoint.affine x y => ECPoint.affine x (-y)

def ECPoint.add (P Q : ECPoint) (_E : WeierstrassCurve) : ECPoint :=
  match P, Q with
  | ECPoint.infinity, _ => Q
  | _, ECPoint.infinity => P
  | _, _ => ECPoint.infinity

def fermatCubicSurface : AffineSurface :=
  { equation := { terms := [(1, { expX := 3, expY := 0, expZ := 0 }),
                             (1, { expX := 0, expY := 3, expZ := 0 }),
                             (1, { expX := 0, expY := 0, expZ := 3 }),
                             (1, { expX := 0, expY := 0, expZ := 0 })] },
    name := "Fermat cubic" }

/-! ## Curve Forms — L6 -/

def montgomeryCurve (A B : Int) : AffinePlaneCurve :=
  { equation := { terms := [(B, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (-A, { expX := 2, expY := 0 }),
                             (-1, { expX := 1, expY := 0 })] },
    name := s!"Montgomery: {B}y^2 = x^3 + {A}x^2 + x" }

def edwardsCurve (d : Int) : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 2, expY := 0 }),
                             (1, { expX := 0, expY := 2 }),
                             (-d, { expX := 2, expY := 2 }),
                             (-1, Monomial.one)] },
    name := s!"Edwards: x^2+y^2=1+{d}x^2y^2" }

def twistedEdwardsCurve (a d : Int) : AffinePlaneCurve :=
  { equation := { terms := [(a, { expX := 2, expY := 0 }),
                             (1, { expX := 0, expY := 2 }),
                             (-d, { expX := 2, expY := 2 }),
                             (-1, Monomial.one)] },
    name := s!"TwistedEdwards: {a}x^2+y^2=1+{d}x^2y^2" }

def jacobiQuartic (a : Int) : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 4, expY := 0 }),
                             (-2*a, { expX := 2, expY := 0 }),
                             (-1, Monomial.one)] },
    name := s!"Jacobi quartic: y^2=x^4+2{a}x^2+1" }

def cmJInvariants : List (Int × String) :=
  [(0, "CM by Z[zeta_3], disc -3"),
   (1728, "CM by Z[i], disc -4"),
   (8000, "CM by Z[sqrt(-2)], disc -8"),
   (287496, "CM by Z[(1+sqrt(-11))/2], disc -11")]

/-! ## K3 Surface Examples — L6

K3 surfaces are simply connected compact complex surfaces with
trivial canonical bundle. Classical examples:
  - Quartic surface in P^3: {x^4+y^4+z^4+w^4=0}
  - Double cover of P^2 branched over a sextic curve
  - Complete intersection of type (2,3) in P^4
  - Elliptic K3: elliptic fibration with 24 nodal fibers (Euler char = 24) -/

def quarticK3Surface : String :=
  "Quartic K3: f_4(x,y,z,w) = 0 in P^3, K=0, p_g=1, b_2=22"

def doubleCoverK3 : String :=
  "K3 as double cover of P^2 branched over smooth sextic"

def ellipticK3 : String :=
  "Elliptic K3: π: S -> P^1 with 24 nodal fibers (I_1) as singular fibers"

/-! ## Curve25519 and Cryptographic Curves — L7

Montgomery form: By^2 = x^3 + Ax^2 + x (B(A^2-4) ≠ 0 for smoothness).
  - Fast differential addition (only x-coordinate)
  - Twist-secure: #E(F_p) and #E'(F_p) both have large prime factors
  - Base field F_p with p = 2^255 - 19 (efficient modular reduction)

Edwards form: x^2 + y^2 = 1 + dx^2y^2
  - Complete addition law (no exceptions for neutral element)
  - Fastest known addition formulas -/

def curve25519BaseField : Nat := (1 <<< 255) - 19

def curve25519Cofactor : Nat := 8
def curve25519Order : String := "8 * 2^252 + 27742317777372353535851937790883648493"

def edwards25519 : String :=
  "Ed25519: -x^2 + y^2 = 1 - (121665/121666) x^2 y^2 over F_{2^255-19}"

def curve448 : String :=
  "Curve448 (Goldilocks): y^2 + x^2 = 1 - 39081 x^2 y^2 over F_{2^448-2^224-1}"

/-! ## Abelian Surfaces and Their Moduli — L6

An abelian surface is a complex torus C^2/Λ admitting a polarization.
  - Product of elliptic curves: E_1 × E_2
  - Jacobian of a genus 2 curve: J(C)
  - Simple abelian surface: not isogenous to a product

Moduli A_2 has dimension 3 (compared to M_2 dimension 3).
Torelli map M_2 -> A_2 is an embedding (image = complement of
decomposable abelian surfaces E_1 × E_2). -/

def abelianSurfaceModuliDim : Nat := 3

def productOfEllipticCurves : String :=
  "A = E_1 × E_2: decomposable abelian surface, dim(Mod) = 2"

def jacobianOfGenus2Curve : String :=
  "A = J(C), g(C)=2: principally polarized, indecomposable generic"

#eval unitCircle.onCurve 1 0
#eval unitCircle.onCurve 0 1
#eval unitCircle.degree
#eval genus unitCircle
#eval E_ex1.discriminant
#eval E_ex1.jInvariant
#eval E_ex2.jInvariant
#eval (WeierstrassCurve.toAffine E_ex1).onCurve 1 0
#eval (WeierstrassCurve.toAffine E_ex1).onCurve 0 0
#eval parabolaCurve.onCurve 2 4
#eval parabolaCurve.onCurve 0 0
#eval fermatCubicSurface.name
#eval fermatCubicSurface.equation.totalDeg
#eval montgomeryCurve 486662 1
#eval edwardsCurve (-121665)
#eval twistedEdwardsCurve (-1) (-121665)
#eval jacobiQuartic (-3)
#eval cmJInvariants

#eval "── K3, Cryptography, Abelian ──"
#eval quarticK3Surface
#eval doubleCoverK3
#eval ellipticK3
#eval curve25519BaseField
#eval curve25519Cofactor
#eval curve25519Order
#eval edwards25519
#eval curve448
#eval abelianSurfaceModuliDim
#eval productOfEllipticCurves
#eval jacobianOfGenus2Curve
#eval montgomeryCurve 486662 1
#eval edwardsCurve (-121665)
#eval twistedEdwardsCurve (-1) (-121665)
#eval jacobiQuartic (-3)
#eval cmJInvariants

end MiniCurvesSurfaces