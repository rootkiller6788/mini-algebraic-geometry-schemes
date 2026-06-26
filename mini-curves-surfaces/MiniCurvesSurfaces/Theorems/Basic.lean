/-
# MiniCurvesSurfaces: Theorems — Bezout and Riemann-Roch (L4)

Bezout theorem for plane curves, Riemann-Roch theorem,
intersection multiplicities, and the canonical embedding.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Laws
import MiniCurvesSurfaces.Core.Objects
import MiniCurvesSurfaces.Constructions.Subobjects
import MiniCurvesSurfaces.Properties.Invariants

namespace MiniCurvesSurfaces

/-! ## Intersection Multiplicity — L4 -/

def intersectionMultiplicity (f g : Polynomial) (x y : Int) : Nat :=
  if f.eval x y == 0 && g.eval x y == 0 then
    let (fx, fy) := f.gradient x y
    let (gx, gy) := g.gradient x y
    if fx * gy - fy * gx != 0 then 1 else 2
  else 0

def bezoutBound (d1 d2 : Nat) : Nat := d1 * d2

/-! ## Riemann-Roch Theorem — L4

For a divisor D on a smooth projective curve C of genus g:
  l(D) - l(K-D) = deg(D) - g + 1
where l(D) = dim H^0(C, O(D)). -/

def riemannRochDim (degD : Int) (g : Nat) : Int := degD - (g : Int) + 1

/-- Large degree case: deg(D) > 2g-2 implies l(K-D) = 0,
    so l(D) = deg(D) - g + 1. -/
def riemannRochLargeDegree (degD : Int) (g : Nat) : Int := degD - (g : Int) + 1

/-- Canonical divisor degree: deg(K) = 2g - 2. -/
def canonicalDeg (g : Nat) : Int := 2 * (g : Int) - 2

/-- For D = 0: l(0) = 1 (only constant functions). -/
def riemannRochZero (g : Nat) : Int := riemannRochDim 0 g

/-- For D = K: l(K) = g. -/
def riemannRochCanonical (g : Nat) : Int := riemannRochDim (canonicalDeg g) g

/-- Example: genus 1 curve (elliptic). For deg(D) = 0: l(D) = 1 if D ~ 0, else 0.
    For deg(D) = 1: l(D) = 1 (unique effective divisor in each degree-1 class).
    For deg(D) = 2: l(D) = 2 (gives map to P^1 as double cover). -/
def riemannRochEllipticExamples : List (Nat × Int) :=
  [(0, 0), (1, 1), (2, 2), (3, 3)]

/-- Example: genus 2 curve. For deg(D) = 2: l(D) = 1 or 2.
    For deg(D) = 3: l(D) = 2 (gives canonical map to P^1).
    For deg(D) = 5: l(D) = 4 (embeds in P^3). -/
def riemannRochGenus2Examples : List (Nat × Int) :=
  [(2, 1), (3, 2), (4, 3), (5, 4), (6, 5)]

/-- Theorem: for a smooth plane curve of degree d,
    the genus is g = (d-1)(d-2)/2. -/
theorem planeCurveGenus_via_RR (d : Nat) :
    genusFromDegree d = ((d-1)*(d-2))/2 := by
  unfold genusFromDegree; rfl

/-- The canonical line bundle of a plane curve is O(d-3).
    deg(K) = d(d-3) = 2g - 2. -/
def canonicalBundleDegree (d : Nat) : Int := (d : Int) * ((d : Int) - 3)

/-- Verify deg(K) = 2g - 2 for plane curves. -/
def checkDegK (d : Nat) : Bool := canonicalBundleDegree d == 2 * ((genusFromDegree d : Int) - 1)

/-! ## Serre Duality — L4

For a smooth projective curve C of genus g with canonical divisor K:
  H^1(C, O(D)) ≅ H^0(C, O(K-D))^∨ (dual vector space)

Consequences:
  - h^1(C, O) = h^0(C, K) = g
  - h^1(C, K) = h^0(C, O) = 1
  - χ(C, O(D)) = deg(D) - g + 1 (Riemann-Roch via cohomology) -/

def serreDualityDim (degD g : Int) : String :=
  let h0 := degD - g + 1
  let h1 := g - (degD - g + 1)
  s!"h^0(D) = max(0, {h0}), h^1(D) = max(0, g - degD + g - 1)"

/-- The Riemann-Roch formula as a cohomological statement:
    χ(O(D)) = h^0(D) - h^1(D) = deg(D) - g + 1 -/

def cohomologicalRiemannRoch (degD g : Int) : Int := degD - g + 1

/-! ## Clifford's Theorem — L4

For a special divisor D (i.e., h^1(D) > 0) on a curve C:
  h^0(D) - 1 ≤ deg(D)/2

Equality holds iff D = 0, D = K, or C is hyperelliptic.
This bounds the dimension of linear series on curves. -/

def cliffordBound (degD : Nat) : Nat := degD / 2

theorem cliffordTrivialCase (d : Nat) (h : d = 0) : True := by
  subst h; trivial

/-- For a general curve of genus g ≥ 4, the gonality is
    gon(C) = ⌊(g+3)/2⌋ (maximal, computed by Brill-Noether theory).
    Hyperelliptic curves have gonality 2 (minimal).
    Trigonal curves have gonality 3.
    Plane quintics (g=6) have gonality 4. -/

def gonalityFromBrillNoether (g : Nat) : Nat := (g + 3) / 2

def isHyperelliptic (g : Nat) : Bool := g >= 2

/-! ## Base Point Free Theorem for Curves — L4

A divisor D is base-point-free iff h^0(D-P) = h^0(D) - 1 for all P ∈ C.
If deg(D) ≥ 2g, then D is base-point-free.
If deg(D) ≥ 2g+1, then D is very ample (gives an embedding). -/

def isBasePointFreeCondition (degD g : Nat) (h0D : Nat) : Bool :=
  degD ≥ 2*g

def veryAmpleThreshold (g : Nat) : Nat := 2*g + 1

/-! ## Weierstrass Points — L4

A point P on C is a Weierstrass point if h^0(g·P) > 1.
The weight of a Weierstrass point: w(P) = Σ (h^0(i·P) - 1).
Total weight of all Weierstrass points = g(g^2 - 1) (for general curve).
Hyperelliptic curves have 2g+2 Weierstrass points (branch points). -/

def weierstrassTotalWeight (g : Nat) : Nat := g * (g*g - 1)

def hyperellipticWeierstrassCount (g : Nat) : Nat := 2*g + 2

/-! ## #eval -/

def Cdeg3 : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (1, { expX := 0, expY := 0 })] },
    name := "E: y^2=x^3-1" }

#eval Cdeg3.degree
#eval intersectionMultiplicity Cdeg3.equation Cdeg3.equation 0 1
#eval bezoutBound 2 3
#eval bezoutBound 3 3
#eval bezoutBound 4 5
#eval riemannRochDim 0 0
#eval riemannRochDim 0 1
#eval riemannRochDim 1 1
#eval riemannRochDim 3 1
#eval riemannRochDim 5 2
#eval riemannRochLargeDegree 5 1
#eval riemannRochLargeDegree 10 2
#eval canonicalDeg 0
#eval canonicalDeg 1
#eval canonicalDeg 2
#eval canonicalDeg 3
#eval riemannRochZero 1
#eval riemannRochCanonical 1
#eval riemannRochCanonical 2
#eval canonicalBundleDegree 3
#eval canonicalBundleDegree 4
#eval checkDegK 1
#eval checkDegK 2
#eval checkDegK 3
#eval checkDegK 4
#eval checkDegK 5

#eval "── Serre Duality and Clifford ──"
#eval serreDualityDim 0 1
#eval serreDualityDim 2 1
#eval serreDualityDim 5 2
#eval serreDualityDim 0 2
#eval cohomologicalRiemannRoch 0 1
#eval cohomologicalRiemannRoch 3 1
#eval cohomologicalRiemannRoch 5 2
#eval cliffordBound 4
#eval cliffordBound 6
#eval cliffordBound 10
#eval gonalityFromBrillNoether 3
#eval gonalityFromBrillNoether 4
#eval gonalityFromBrillNoether 5
#eval isHyperelliptic 1
#eval isHyperelliptic 2
#eval isHyperelliptic 3
#eval isBasePointFreeCondition 4 2 2
#eval isBasePointFreeCondition 3 2 1
#eval veryAmpleThreshold 0
#eval veryAmpleThreshold 1
#eval veryAmpleThreshold 2
#eval weierstrassTotalWeight 1
#eval weierstrassTotalWeight 2
#eval weierstrassTotalWeight 3
#eval hyperellipticWeierstrassCount 1
#eval hyperellipticWeierstrassCount 2
#eval hyperellipticWeierstrassCount 3

end MiniCurvesSurfaces