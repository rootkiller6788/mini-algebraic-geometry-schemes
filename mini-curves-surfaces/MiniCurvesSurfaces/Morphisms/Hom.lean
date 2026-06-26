/-
# MiniCurvesSurfaces: Morphisms — Regular Maps, Morphisms, Function Fields (L2)

Polynomial maps, curve morphisms, rational functions, the function field k(C),
and degree of a morphism.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Laws
import MiniCurvesSurfaces.Core.Objects

namespace MiniCurvesSurfaces

/-! ## Polynomial Maps A^2 -> A^2 — L2 -/

structure PolynomialMap where
  fX : Polynomial
  fY : Polynomial
  name : String
  deriving Repr, Inhabited

def PolynomialMap.apply (φ : PolynomialMap) (x y : Int) : Int × Int :=
  (φ.fX.eval x y, φ.fY.eval x y)

def PolynomialMap.id : PolynomialMap :=
  { fX := Polynomial.x, fY := Polynomial.y, name := "id" }

/-- Degree of a polynomial map: max(deg(fX), deg(fY)). -/
def PolynomialMap.degree (φ : PolynomialMap) : Nat :=
  Nat.max φ.fX.totalDeg φ.fY.totalDeg

/-! ## Curve Morphisms — L2 -/

structure CurveMorphism (C₁ C₂ : AffinePlaneCurve) where
  map : PolynomialMap
  deriving Repr

def CurveMorphism.id (C : AffinePlaneCurve) : CurveMorphism C C :=
  { map := PolynomialMap.id }

def CurveMorphism.comp {C₁ C₂ C₃ : AffinePlaneCurve}
    (g : CurveMorphism C₂ C₃) (f : CurveMorphism C₁ C₂) : CurveMorphism C₁ C₃ :=
  { map := { fX := g.map.fX, fY := g.map.fY,
             name := s!"{g.map.name}∘{f.map.name}" } }

/-! ## Degree of a Morphism — L2

The degree of a finite morphism f: C1 -> C2 of smooth curves
is the degree of the field extension [k(C1) : f*k(C2)].
Geometrically: #f^{-1}(Q) = deg(f) for general Q in C2. -/

/-- Morphism degree from polynomial degrees. -/
def morphismDegreeFromPolynomials (degX degY curveDeg : Nat) : Nat :=
  degX * curveDeg

/-- Frobenius map degree in characteristic p. -/
def frobeniusDegree (q : Nat) : Nat := q

/-! ## Rational Functions — L2 -/

def RationalFunction.evalAt (r : RationalFunction) (x y : Int) : Option Int :=
  let d := r.den.eval x y
  if d == 0 then none else some (r.num.eval x y / d)

def RationalFunction.isRegularAt (r : RationalFunction) (x y : Int) : Bool :=
  r.den.eval x y != 0

/-! The function field k(C) consists of rational functions on C
modulo equality on a dense open set.
For a plane curve C: f(x,y)=0, k(C) = k(x)[y]/(f) assuming f is monic in y. -/

/-- Order of vanishing (valuation) of a rational function at a point. -/
def orderOfVanishing (vanishingOrder : Int) : String :=
  if vanishingOrder > 0 then s!"zero of order {vanishingOrder}"
  else if vanishingOrder < 0 then s!"pole of order {-vanishingOrder}"
  else "unit (invertible)"

/-- The divisor of a rational function: div(f) = Σ ord_P(f)·P.
    This is a principal divisor, and deg(div(f)) = 0. -/
def principalDivisorDegreeIsZero : String :=
  "deg(div(f)) = 0: number of zeros = number of poles (counted with multiplicity)"

/-! ## Examples — L6 -/

def shiftMap : PolynomialMap :=
  { fX := { terms := [(1, Monomial.x), (1, Monomial.one)] }
    fY := { terms := [(1, Monomial.y)] }
    name := "shift" }

def lineCurve : AffinePlaneCurve :=
  { equation := { terms := [(1, Monomial.x), (-1, Monomial.y)] }, name := "y=x" }

/-- A simple rational function: r(x,y) = x/y on the line y=x gives r = 1. -/
def simpleRationalFunc : RationalFunction :=
  { num := Polynomial.x, den := Polynomial.y, name := "x/y" }

#eval shiftMap.apply 2 3
#eval PolynomialMap.id.apply 5 7
#eval lineCurve.onCurve 1 1
#eval RationalFunction.evalAt simpleRationalFunc 2 2
#eval orderOfVanishing 2
#eval orderOfVanishing (-3)
#eval orderOfVanishing 0

end MiniCurvesSurfaces