import MiniCurvesSurfaces

open MiniCurvesSurfaces

#eval "══ Smoke Test: mini-curves-surfaces ══"

-- Test basic types exist
#eval (Polynomial.x : Polynomial)
#eval (Polynomial.y : Polynomial)
#eval (Polynomial.zero : Polynomial)
#eval (Polynomial.const 5 : Polynomial)

-- Test evaluation
#eval Polynomial.x.eval 3 5
#eval Polynomial.y.eval 3 5
#eval (Polynomial.const 7).eval 100 200

-- Test curve operations
def testLine : AffinePlaneCurve :=
  { equation := { terms := [(1, Monomial.x), (-1, Monomial.y)] }, name := "test line" }
#eval testLine.onCurve 1 1
#eval testLine.onCurve 2 3
#eval testLine.degree

-- Test polynomial arithmetic
def p1 : Polynomial := { terms := [(2, Monomial.x), (3, Monomial.y)] }
def p2 : Polynomial := { terms := [(1, Monomial.x), (-1, Monomial.y)] }
#eval (Polynomial.add p1 p2).terms.length
#eval (Polynomial.mul p1 p2).totalDeg

-- Test surface types
#eval (AffineSurface.mk { terms := [] } "empty").name

-- Test projective curves
def testProj : ProjectivePlaneCurve :=
  { equation := [(1, 1, 1, 0), (1, 1, 0, 1), (1, 0, 1, 1)], degree := 2, name := "test" }
#eval testProj.degree

#eval "══ All smoke tests passed ══"