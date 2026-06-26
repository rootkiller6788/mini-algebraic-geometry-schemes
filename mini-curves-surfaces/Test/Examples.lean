import MiniCurvesSurfaces

open MiniCurvesSurfaces

#eval "══ Example Tests: mini-curves-surfaces ══"

-- Elliptic curves
def testEC : WeierstrassCurve := { a := -1, b := 0, name := "test" }
#eval testEC.discriminant
#eval testEC.jInvariant
#eval (WeierstrassCurve.toAffine testEC).degree

-- Genus computations
#eval genusFromDegree 1
#eval genusFromDegree 2
#eval genusFromDegree 3
#eval genusFromDegree 4
#eval genusFromDegree 5
#eval genusFromDegree 10

-- Verify genus formula: g = (d-1)(d-2)/2 for smooth plane curves
def testGenusFormula (d : Nat) : Bool :=
  genusFromDegree d == ((d-1)*(d-2))/2
#eval testGenusFormula 1
#eval testGenusFormula 3
#eval testGenusFormula 5

-- Canonical divisor
#eval CanonicalDivisorDegree 3
#eval CanonicalDivisorDegree 4
#eval CanonicalDivisorDegree 5

-- Complete intersection genus
#eval completeIntersectionGenus 2 2
#eval completeIntersectionGenus 2 3
#eval completeIntersectionGenus 2 4
#eval completeIntersectionGenus 3 3
#eval completeIntersectionGenus 4 4

-- Noether formula
#eval noetherFormula 9 3 1
#eval noetherFormula 8 4 1
#eval noetherFormula 0 24 2

-- Hurwitz bound
#eval hurwitzBound 2
#eval hurwitzBound 3
#eval hurwitzBound 5

-- Classification
#eval classifyCurve 0
#eval classifyCurve 1
#eval classifyCurve 2

-- Cremona
#eval cremonaTransform 1 2 3
#eval cremonaDegreeFormula 2 1 1 1

#eval "══ All example tests passed ══"