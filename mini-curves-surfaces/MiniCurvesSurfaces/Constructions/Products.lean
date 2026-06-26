/-
# MiniCurvesSurfaces: Constructions — Products and Fiber Products (L3)
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Laws
import MiniCurvesSurfaces.Core.Objects
import MiniCurvesSurfaces.Morphisms.Hom

namespace MiniCurvesSurfaces

structure ProductCurve where
  curve1 : AffinePlaneCurve
  curve2 : AffinePlaneCurve
  name : String
  deriving Repr

def ProductCurve.onProduct (P : ProductCurve) (x₁ y₁ x₂ y₂ : Int) : Bool :=
  P.curve1.onCurve x₁ y₁ && P.curve2.onCurve x₂ y₂

/-- Segre embedding P^1 x P^1 -> P^3. -/
def segreEmbedding (s t u v : Int) : Int × Int × Int × Int :=
  (s*u, s*v, t*u, t*v)

/-- Segre quadric: Z0*Z3 - Z1*Z2 = 0. -/
def segreQuadric (Z0 Z1 Z2 Z3 : Int) : Int := Z0*Z3 - Z1*Z2

/-- Check that a specific Segre point satisfies the quadric. -/
def checkSegrePoint (s t u v : Int) : Bool :=
  segreQuadric (s*u) (s*v) (t*u) (t*v) == 0

/-- General Segre embedding: P^m × P^n -> P^{(m+1)(n+1)-1} = P^{mn+m+n}
    (s_i)·(t_j) -> [s_i·t_j]. The image is cut out by 2×2 minors. -/
def segreEmbeddingDim (m n : Nat) : Nat := (m+1)*(n+1) - 1

/-- For P^1 × P^1 -> P^3: (1+1)(1+1)-1 = 3, image is quadric Z0·Z3 = Z1·Z2. -/
theorem segreP1xP1 : segreEmbeddingDim 1 1 = 3 := by
  unfold segreEmbeddingDim; decide

/-- For P^2 × P^1 -> P^5: (2+1)(1+1)-1 = 5. -/
theorem segreP2xP1 : segreEmbeddingDim 2 1 = 5 := by
  unfold segreEmbeddingDim; decide

/-! ## Fiber Products (Pullbacks) — L3

Given morphisms f: X -> Z and g: Y -> Z, the fiber product X ×_Z Y
is the universal object making the square commute.
For curves: C_1 ×_{P^1} C_2 corresponds to the graph of the
composition with the maps to P^1.

The degree of a fiber product: deg(X ×_Z Y) = deg(f)·deg(Y/Z).
Genus formula for fiber product (Riemann-Hurwitz). -/

structure FiberProduct (C D B : AffinePlaneCurve) where
  left : PolynomialMap
  right : PolynomialMap
  name : String
  deriving Repr

def fiberProductDegree (degF degG : Nat) : Nat := degF * degG

def graphOfMorphism (φ : PolynomialMap) : String :=
  s!"Γ_{φ.name} ⊂ X × Y: the graph of the polynomial map"

/-! ## Ruled Surfaces — L3

A ruled surface is a P^1-bundle over a smooth curve C.
Geometrically: S = P_C(E) for a rank-2 vector bundle E on C.
Hirzebruch surfaces Σ_n = P_{P^1}(O ⊕ O(n)).
  - Σ_0 = P^1 × P^1 (quadric surface)
  - Σ_1 = blow-up of P^2 at a point
  - Σ_n for n ≥ 2 are not minimal (contain exceptional curve E with E^2 = -n) -/

def hirzebruchSurfaceInvariants (n : Nat) : String :=
  s!"Σ_{n}: minimal iff n=0 or n=1; K^2 = 8; e = 4"

def ruledSurfaceInvariants (g : Nat) : String :=
  s!"Ruled surface over curve of genus {g}: K^2 = 8(1-g), e = 4(1-g)"

def curveA : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 2, expY := 0 }), (-1, Monomial.one)] }, name := "x^2=1" }
def curveB : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }), (-1, Monomial.one)] }, name := "y^2=1" }
def prodAB : ProductCurve := { curve1 := curveA, curve2 := curveB, name := "C1xC2" }

#eval prodAB.onProduct 1 0 0 1
#eval prodAB.onProduct 2 0 0 1
#eval segreEmbedding 1 2 3 4
#eval segreQuadric 1 2 3 5
#eval checkSegrePoint 1 2 3 4
#eval checkSegrePoint 2 3 5 7

#eval "── Segre and Fiber Products ──"
#eval segreEmbeddingDim 1 1
#eval segreEmbeddingDim 1 2
#eval segreEmbeddingDim 2 2
#eval fiberProductDegree 2 3
#eval fiberProductDegree 3 5
#eval graphOfMorphism (PolynomialMap.mk Polynomial.x Polynomial.y "id")
#eval hirzebruchSurfaceInvariants 0
#eval hirzebruchSurfaceInvariants 1
#eval hirzebruchSurfaceInvariants 2
#eval ruledSurfaceInvariants 0
#eval ruledSurfaceInvariants 1
#eval ruledSurfaceInvariants 2

end MiniCurvesSurfaces