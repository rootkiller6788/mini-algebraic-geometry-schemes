/-
# MiniCurvesSurfaces: Morphisms — Isomorphisms and Automorphisms (L2/L3)
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Morphisms.Hom

namespace MiniCurvesSurfaces

structure CurveIsomorphism (C₁ C₂ : AffinePlaneCurve) where
  forward : CurveMorphism C₁ C₂
  reverse : CurveMorphism C₂ C₁
  deriving Repr

def CurveIsomorphism.id (C : AffinePlaneCurve) : CurveIsomorphism C C :=
  { forward := CurveMorphism.id C, reverse := CurveMorphism.id C }

def Automorphism (C : AffinePlaneCurve) := CurveIsomorphism C C

/-! ## Automorphism Groups — L3

For rational curves (g=0): Aut(P^1) = PGL(2,k) (dimension 3).
For elliptic curves (g=1): Aut(E) is finite (order ≤ 24, typically 2).
For general type (g≥2): Aut(C) is finite; Hurwitz bound: |Aut(C)| ≤ 84(g-1). -/

def hurwitzBound (g : Nat) : Nat := 84 * (g - 1)

def pgl2Automorphisms : String :=
  "Aut(P^1) = PGL(2): {z -> (az+b)/(cz+d) | ad-bc ≠ 0}"

def generalEllipticAut : String :=
  "For j ≠ 0,1728: Aut(E) = {±1} = Z/2, only the negation map (x,y) -> (x,-y)"

def specialEllipticAut : String :=
  "j=0: Aut ≅ Z/6; j=1728: Aut ≅ Z/4"

def kleinQuarticAut : String :=
  "Klein quartic (g=3): |Aut| = 168 = PSL(2,7), simple group"

def fermatQuarticAut : String :=
  "Fermat quartic (g=3): |Aut| = 96 = (Z/4)^2 ⋊ S_3"

/-! ## Stereographic Projection — Conic to P^1

All smooth conics are isomorphic to P^1. Stereographic projection
from (-1,0) on the unit circle to the line x=0 gives a birational map.
Inverse: t -> ((1-t^2)/(1+t^2), 2t/(1+t^2)). -/

def stereographicProjection (x : Int) (y : Int) : Int :=
  if x + 1 == 0 then 0 else y

def invStereographicX (t : Int) : Int := (1 - t*t)
def invStereographicY (t : Int) : Int := (2*t)

/-! ## Elliptic Curve Isomorphisms and j-Invariant

Two elliptic curves are isomorphic iff they have the same j-invariant.
The isomorphism for y^2 = x^3 + ax + b is given by rescaling:
(x,y) -> (u^2 x, u^3 y) with a' = u^4 a, b' = u^6 b. -/

def ellipticCurveRescaling (u : Int) (x : Int) (y : Int) : Int × Int :=
  (u*u*x, u*u*u*y)

def legendreJInvariant (lam : Int) : String :=
  s!"j(λ) = 256({lam}^2-{lam}+1)^3/({lam}^2({lam}-1)^2)"

/-! ## #eval -/

def lineCurve' : AffinePlaneCurve :=
  { equation := { terms := [(1, Monomial.y), (-1, Monomial.x)] }, name := "y=x" }

#eval lineCurve'.onCurve 1 1
#eval lineCurve'.onCurve 1 2
#eval hurwitzBound 2
#eval hurwitzBound 3
#eval ellipticCurveRescaling 2 1 1

end MiniCurvesSurfaces