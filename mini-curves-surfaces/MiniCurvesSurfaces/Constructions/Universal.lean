/-
# MiniCurvesSurfaces: Constructions — Universal Properties (L3)

Jacobian variety J(C), Albanese variety, Picard scheme,
and the Abel-Jacobi map. Universal properties in algebraic geometry.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Constructions.Subobjects

namespace MiniCurvesSurfaces

/-! ## Jacobian Variety — L3

J(C) = Pic^0(C) is a g-dimensional abelian variety.
Points correspond to degree-0 divisor classes.
dim(J(C)) = g = genus of C. -/

structure Jacobian (C : AffinePlaneCurve) where
  genus : Nat
  dimension : Nat := genus
  name : String
  deriving Repr

def abelJacobiMap (C : AffinePlaneCurve) (basePoint point : Int × Int) (_J : Jacobian C) : String :=
  s!"Abel-Jacobi: {point} -> [({point}) - ({basePoint})]"

def jacForCurve (C : AffinePlaneCurve) : Jacobian C :=
  { genus := genusFromDegree C.degree, name := s!"J({C.name})" }

/-! ## Theta Divisor — L8

The Jacobian carries a principal polarization given by the theta divisor Θ.
The pair (J(C), Θ) determines the curve C (Torelli theorem).
dim |Θ| = 0 (theta divisor is unique up to translation).
Θ has self-intersection Θ^g = g! on J(C). -/

def factorial : Nat → Nat
  | 0 => 1
  | 1 => 1
  | 2 => 2
  | 3 => 6
  | 4 => 24
  | 5 => 120
  | 6 => 720
  | n+1 => (n+1) * factorial n

def thetaDivisorSelfIntersection (g : Nat) : Nat := factorial g

/-! ## Albanese Variety — L8

For a variety X, Alb(X) is the universal abelian variety receiving
a map from X. For curves, Alb(C) ≅ J(C) (self-duality).
For surfaces, Alb(S) has dimension q = h^{1,0}(S). -/

structure Albanese (C : AffinePlaneCurve) where
  dimension : Nat
  name : String
  deriving Repr

def albaneseFromCurve (C : AffinePlaneCurve) : Albanese C :=
  { dimension := genusFromDegree C.degree, name := s!"Alb({C.name})" }

/-! ## Picard Scheme — L8

Pic_{C/k} represents the relative Picard functor.
Pic^0(C) ≅ J(C) as abelian varieties.
Pic^n(C) for n ∈ Z parameterizes degree-n divisor classes. -/

structure PicardScheme (C : AffinePlaneCurve) where
  degreeZeroPart : Jacobian C
  name : String
  deriving Repr

def picardSchemeFromCurve (C : AffinePlaneCurve) : PicardScheme C :=
  { degreeZeroPart := jacForCurve C, name := s!"Pic({C.name})" }

/-! ## Universal Property of J(C) — L4

For any abelian variety A and morphism f: C -> A with f(P0) = 0,
there exists a unique homomorphism φ: J(C) -> A making the diagram commute:
  C --AJ--> J(C)
   \        |
    \       | φ
     f      v
      ----> A

This universal property characterizes the Jacobian. -/

def universalPropertyJacobian : String :=
  "J(C) is universal among abelian varieties receiving a map from C"

/-! ## Albanese Universal Property

Alb(X) is dual: any map from X to an abelian variety factors uniquely
through the Albanese map a: X -> Alb(X).
For curves: Alb(C) ≅ J(C) and the Albanese map = Abel-Jacobi map. -/

def albaneseUniversalProperty : String :=
  "Alb(X) is universal among abelian varieties with a map TO X"

/-! ## #eval Examples -/

def eCurve : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (-1, Monomial.one)] },
    name := "E: y^2=x^3+1" }

def jacE : Jacobian eCurve := jacForCurve eCurve
def albE : Albanese eCurve := albaneseFromCurve eCurve
def picE : PicardScheme eCurve := picardSchemeFromCurve eCurve

#eval jacE.genus
#eval jacE.dimension
#eval abelJacobiMap eCurve (0, 1) (1, 0) jacE
#eval albE.dimension
#eval picE.name
#eval thetaDivisorSelfIntersection 1
#eval thetaDivisorSelfIntersection 2
#eval thetaDivisorSelfIntersection 3
#eval thetaDivisorSelfIntersection 4

end MiniCurvesSurfaces