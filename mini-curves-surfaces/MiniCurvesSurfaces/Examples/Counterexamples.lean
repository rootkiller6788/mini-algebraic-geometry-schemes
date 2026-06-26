/-
# MiniCurvesSurfaces: Examples — Counterexamples and Edge Cases (L6)

Singular curves, non-algebraic examples, bad reduction,
counterexamples to Hasse principle.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Objects
import MiniCurvesSurfaces.Properties.Invariants

namespace MiniCurvesSurfaces

/-! ## Singular Curves — L6 -/

def nodalCubic : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (-1, { expX := 2, expY := 0 })] },
    name := "nodal cubic" }

def cuspidalCubic : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 })] },
    name := "cuspidal cubic" }

def nodalOriginIsSingular : Bool :=
  let (dx, dy) := nodalCubic.equation.gradient 0 0
  dx == 0 && dy == 0

def cuspidalOriginIsSingular : Bool :=
  let (dx, dy) := cuspidalCubic.equation.gradient 0 0
  dx == 0 && dy == 0

/-! ## High Genus Curves — L6 -/

def fermatQuartic : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 4, expY := 0 }),
                             (1, { expX := 0, expY := 4 }),
                             (-1, Monomial.one)] },
    name := "Fermat quartic" }

def genus10Curve : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 6, expY := 0 }),
                             (1, { expX := 0, expY := 6 }),
                             (-1, Monomial.one)] },
    name := "degree 6, genus 10" }

/-! ## Counterexamples — L6 -/

def noRationalPointConic : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 2, expY := 0 }),
                             (1, { expX := 0, expY := 2 }),
                             (1, Monomial.one)] },
    name := "x^2+y^2=-1 (no rational points)" }

/-! ## Bad Reduction Types (Kodaira-Neron) -/

inductive ReductionType where
  | good | splitMul (n : Nat) | nonSplitMul (n : Nat) | additive
  deriving Repr

/-! ## Counterexamples in Algebraic Geometry — L6

1. Hironaka's example: A non-projective smooth proper variety
   (exists in dimension ≥ 3, but curves/surfaces over C are always projective)

2. Non-algebraic compact complex surfaces: Hopf surfaces (diffeomorphic
   to S^1 × S^3, b_1=1, not Kähler), Inoue surfaces (class VII).

3. Serre's example: A regular local ring that is not Cohen-Macaulay
   (exists in dimension ≥ 3).

4. Igusa's example: A smooth surface in characteristic p with
   non-reduced Picard scheme (pathologies in positive characteristic).

5. Mumford's example: A normal surface with a singular point that
   is not Cohen-Macaulay, and a non-projective smooth surface. -/

def hironakaExample : String :=
  "Non-projective smooth complete variety (dim 3, char 0)"

def hopfSurfaceExample : String :=
  "Hopf surface: compact complex, not Kähler, b_1=1, not algebraic"

def igusaNonreducedPicard : String :=
  "Smooth surface in char p with Pic^0 non-reduced (Igusa)"

def mumfordPathologicalSurface : String :=
  "Normal surface with non-CM singularity, G_a-action without quotient"

/-! ## Zariski's Examples — L8

Zariski showed: the fundamental group of the complement of a curve
in P^2 depends on the position of singularities, not just the curve's
degree. Example: a sextic with 6 cusps on a conic has π_1 = Z/2·Z/3,
while a general sextic has a different fundamental group. -/

def zariskiFundamentalGroup : String :=
  "π_1(P^2\\C) depends on singularity configuration (Zariski pairs)"

/-! ## Severi's Conjecture — L8

A nodal curve of degree d in P^2 can have at most (d-1)(d-2)/2 nodes.
Curves achieving this bound are rational (genus 0).
The Severi variety V_{d,δ} parameterizes plane curves of degree d with
δ nodes. Irreducibility conjecture (Harris): V_{d,δ} is irreducible. -/

def maxNodesPlaneCurve (d : Nat) : Nat := ((d-1)*(d-2))/2

def severiVarietyDimension (d nodes : Nat) : Int :=
  (3*d + (genusFromDegree d : Int) - 1) - (nodes : Int)

/-! ## #eval Verification -/

#eval nodalCubic.onCurve 0 0
#eval nodalOriginIsSingular
#eval cuspidalCubic.onCurve 0 0
#eval cuspidalOriginIsSingular
#eval genus fermatQuartic
#eval genus genus10Curve
#eval noRationalPointConic.onCurve 0 0

#eval "── Counterexamples ──"
#eval hironakaExample
#eval hopfSurfaceExample
#eval igusaNonreducedPicard
#eval mumfordPathologicalSurface
#eval zariskiFundamentalGroup
#eval maxNodesPlaneCurve 3
#eval maxNodesPlaneCurve 4
#eval maxNodesPlaneCurve 5
#eval severiVarietyDimension 4 3
#eval severiVarietyDimension 5 6

end MiniCurvesSurfaces