/-
# MiniCurvesSurfaces: Constructions — Divisors and Subvarieties (L3)

Weil divisors, principal divisors, the canonical divisor,
and the divisor class group (Picard group).
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Objects

namespace MiniCurvesSurfaces

/-! ## Divisors — L3: Weil Divisors -/

structure Divisor (C : AffinePlaneCurve) where
  terms : List (Int × (Int × Int))
  deriving Repr

def Divisor.zero (C : AffinePlaneCurve) : Divisor C := { terms := [] }

def Divisor.deg {C : AffinePlaneCurve} (D : Divisor C) : Int :=
  D.terms.foldl (fun acc (n, _) => acc + n) 0

def Divisor.add {C : AffinePlaneCurve} (D₁ D₂ : Divisor C) : Divisor C :=
  { terms := D₁.terms ++ D₂.terms }

/-! ## Principal Divisors — L2 -/

structure PrincipalDivisor (C : AffinePlaneCurve) where
  rationalFunction : Polynomial
  -- div(f) = Σ ord_P(f)·P where ord_P is the vanishing/pole order
  name : String
  deriving Repr

/-! ## Canonical Divisor — L3 -/

/-- For a smooth plane curve of degree d:
    deg(K_C) = d(d-3), genus g = (d-1)(d-2)/2.
    These are connected by: deg(K_C) = 2g - 2. -/

def canonicalDivisorDeg (degree : Nat) : Int :=
  (degree : Int) * ((degree : Int) - 3)

def genusFromDegree (d : Nat) : Nat :=
  ((d - 1) * (d - 2)) / 2

/-- Verification: deg(K_C) = 2g - 2 for plane curves.
    For d=1: 1*(-2) = -2, 2*(0-1) = -2 ✓
    For d=2: 2*(-1) = -2, 2*(0-1) = -2 ✓
    For d=3: 3*0 = 0, 2*(1-1) = 0 ✓
    For d=4: 4*1 = 4, 2*(3-1) = 4 ✓ -/
def verifyCanonicalDegreeGenus (d : Nat) : Bool :=
  canonicalDivisorDeg d == 2 * ((genusFromDegree d : Int) - 1)

/-! ## Genus Formula — L3 -/

/-- Arithmetic genus for plane curves: p_a = (d-1)(d-2)/2 -/
def arithmeticGenus (d : Nat) : Nat := ((d - 1) * (d - 2)) / 2

/-- Geometric genus = p_a - Σ δ_P where δ_P are delta-invariants
    at singular points. For smooth curves, geometric genus = arithmetic genus. -/
def geometricGenus (d : Nat) (deltaSum : Nat) : Nat :=
  let pa := arithmeticGenus d
  if deltaSum <= pa then pa - deltaSum else 0

/-! ## Picard Group — L3: Divisor Class Group -/

/-- The Picard group Pic(C) classifies line bundles on C.
    Pic(C) = Div(C) / ~ where D ~ D' if D-D' is principal.
    Pic^0(C) = degree-0 divisor classes ≅ J(C) (abelian variety of dimension g).
    The Neron-Severi group NS(C) = Pic(C)/Pic^0(C) ≅ Z (degree map). -/

def divisorsAreLinearlyEquivalent {C : AffinePlaneCurve} (D₁ D₂ : Divisor C) : Bool :=
  Divisor.deg D₁ == Divisor.deg D₂

def picardGroupDescription : String :=
  "Pic(C) = {line bundles on C} ≅ Div(C) / PDiv(C)"

def picardZeroDescription (g : Nat) : String :=
  s!"Pic^0(C) ≅ J(C): {g}-dimensional abelian variety"

def neronSeveriGroupCurve : String :=
  "NS(C) = Pic(C)/Pic^0(C) ≅ Z (degree map is surjective)"

/-- For surfaces: Pic(S) has discrete part NS(S) (Neron-Severi) of rank ρ
    and continuous part Pic^0(S) of dimension q = h^{1,0}(S).
    ρ(S) ≤ h^{1,1}(S), with equality for K3 surfaces. -/

def picardNumberBounds (h11 : Nat) : String :=
  s!"ρ(S) ≤ h^(1,1)(S) = {h11} (Lefschetz (1,1)-theorem gives equality for K3)"

/-! ## Intersection Pairing on Surfaces — L3/L4

For divisors C, D on a smooth projective surface S:
  (C·D) ∈ Z, bilinear, symmetric.
  For curves: (C·D) = #(C ∩ D) counting with multiplicity (Bezout).

Key formulas:
  - Adjunction: 2g(C) - 2 = C·(C + K_S)
  - Self-intersection of exceptional curve: E^2 = -1
  - Hodge index: signature of intersection form on NS(S) is (1, ρ-1) -/

def intersectionProduct (C1deg C2deg : Nat) : Nat := C1deg * C2deg

def selfIntersection (deg : Int) : Int := deg * deg

def adjunctionGenusFromIntersection (C2 CK : Int) : Int :=
  (C2 + CK + 2) / 2

/-- Example: line in P^2 has self-intersection 1.
    Conic in P^2: 2·2 = 4. -/
def lineSelfIntP2 : Int := 1
def conicSelfIntP2 : Int := 4

/-! ## Riemann-Roch on Surfaces — L4

For a divisor D on a smooth projective surface S:
  χ(O_S(D)) = χ(O_S) + (D^2 - D·K_S)/2

This is the Hirzebruch-Riemann-Roch theorem for surfaces.
Special cases:
  - D = 0: χ(O_S) = 1 - q + p_g (Noether's formula relates this to K^2 + e)
  - D = K_S: χ(O_S(K_S)) = χ(O_S) (Serre duality) -/

def hirzebruchRiemannRochSurface (chiOS D2 DK : Int) : Int :=
  chiOS + (D2 - DK) / 2

/-- For rational surfaces (P^2, Hirzebruch): χ(O_S) = 1, q = 0, p_g = 0.
    For K3 surfaces: χ(O_S) = 2, q = 0, p_g = 1.
    For surfaces of general type: χ(O_S) ≥ 1. -/

def chiOSurface (surfaceType : String) : Int :=
  match surfaceType with
  | "P2" => 1 | "rational" => 1
  | "K3" => 2 | "Enriques" => 1
  | "abelian" => 0 | "bielliptic" => 0
  | _ => 1

/-! ## #eval Verification — L6 -/

def testCurve : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (-1, Monomial.one)] },
    name := "y^2 = x^3 + 1" }

#eval "── Divisors and Genus Examples ──"
#eval genusFromDegree 1
#eval genusFromDegree 2
#eval genusFromDegree 3
#eval genusFromDegree 4
#eval genusFromDegree 5
#eval canonicalDivisorDeg 3
#eval verifyCanonicalDegreeGenus 1
#eval verifyCanonicalDegreeGenus 2
#eval verifyCanonicalDegreeGenus 3
#eval verifyCanonicalDegreeGenus 4
#eval verifyCanonicalDegreeGenus 5
#eval arithmeticGenus 3
#eval geometricGenus 3 0

#eval "── Picard and Intersection Theory ──"
#eval picardGroupDescription
#eval picardZeroDescription 1
#eval picardZeroDescription 2
#eval neronSeveriGroupCurve
#eval intersectionProduct 2 3
#eval intersectionProduct 3 3
#eval intersectionProduct 4 4
#eval selfIntersection 1
#eval selfIntersection (-1)
#eval adjunctionGenusFromIntersection 9 (-6)
#eval adjunctionGenusFromIntersection 4 (-4)
#eval hirzebruchRiemannRochSurface 1 1 (-3)
#eval hirzebruchRiemannRochSurface 2 0 0
#eval chiOSurface "P2"
#eval chiOSurface "K3"
#eval chiOSurface "abelian"
#eval picardNumberBounds 20

end MiniCurvesSurfaces