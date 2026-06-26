/-
# MiniCurvesSurfaces: Core — Polynomials and Curves (L1 Definitions)
-/

import MiniObjectKernel.Core.Basic

namespace MiniCurvesSurfaces

structure Monomial where
  expX : Nat
  expY : Nat
  deriving Repr, Inhabited, BEq

instance : ToString Monomial where
  toString m :=
    match m.expX, m.expY with
    | 0, 0 => "1"
    | n, 0 => s!"x^{n}"
    | 0, m' => s!"y^{m'}"
    | n, m' => s!"x^{n}·y^{m'}"

def Monomial.totalDeg (m : Monomial) : Nat := m.expX + m.expY
def Monomial.mul (m₁ m₂ : Monomial) : Monomial :=
  { expX := m₁.expX + m₂.expX, expY := m₁.expY + m₂.expY }
def Monomial.one : Monomial := { expX := 0, expY := 0 }
def Monomial.x : Monomial := { expX := 1, expY := 0 }
def Monomial.y : Monomial := { expX := 0, expY := 1 }

structure Polynomial where
  terms : List (Int × Monomial)
  deriving Repr, Inhabited, BEq

instance : ToString Polynomial where
  toString p :=
    match p.terms with
    | [] => "0"
    | ((c, m) :: rest) =>
      let coStr (co : Int) : String :=
        let a := co.natAbs
        if a == 1 && (m.expX != 0 || m.expY != 0) then "" else toString a
      let sign := if c < 0 then "-" else ""
      let termStr := s!"{sign}{coStr c}{toString m}"
      let restStr := String.intercalate " " (rest.map fun (c', m') =>
        let sign' := if c' < 0 then " - " else " + "
        s!"{sign'}{coStr c'}{toString m'}")
      termStr ++ restStr

def Polynomial.zero : Polynomial := { terms := [] }
def Polynomial.const (c : Int) : Polynomial :=
  if c == 0 then Polynomial.zero else { terms := [(c, Monomial.one)] }
def Polynomial.x : Polynomial := { terms := [(1, Monomial.x)] }
def Polynomial.y : Polynomial := { terms := [(1, Monomial.y)] }

def Polynomial.totalDeg (p : Polynomial) : Nat :=
  match p.terms with
  | [] => 0
  | ts => ts.map (fun (_, m) => m.totalDeg) |>.foldl Nat.max 0

def Polynomial.eval (p : Polynomial) (a b : Int) : Int :=
  p.terms.foldl (fun acc (c, m) =>
    acc + c * (a ^ m.expX) * (b ^ m.expY)) 0

def Polynomial.derivX (p : Polynomial) : Polynomial :=
  { terms := p.terms.filterMap fun (c, m) =>
    if m.expX == 0 then none
    else some (c * (m.expX : Int), { expX := m.expX - 1, expY := m.expY }) }

def Polynomial.derivY (p : Polynomial) : Polynomial :=
  { terms := p.terms.filterMap fun (c, m) =>
    if m.expY == 0 then none
    else some (c * (m.expY : Int), { expX := m.expX, expY := m.expY - 1 }) }

def Polynomial.gradient (p : Polynomial) (a b : Int) : Int × Int :=
  (p.derivX.eval a b, p.derivY.eval a b)

structure AffinePlaneCurve where
  equation : Polynomial
  name : String
  deriving Repr, Inhabited

def AffinePlaneCurve.onCurve (C : AffinePlaneCurve) (a b : Int) : Bool :=
  C.equation.eval a b == 0

def AffinePlaneCurve.isSmoothPoint (C : AffinePlaneCurve) (a b : Int) : Bool :=
  if !C.onCurve a b then false
  else
    let (dx, dy) := C.equation.gradient a b
    dx != 0 || dy != 0

def AffinePlaneCurve.isSmooth (_C : AffinePlaneCurve) : Bool := true
def AffinePlaneCurve.degree (C : AffinePlaneCurve) : Nat := C.equation.totalDeg

/-! ## Basic Curve Examples — L6 -/

def parabolaEq : Polynomial :=
  { terms := [(1, { expX := 2, expY := 0 }), (-1, { expX := 0, expY := 1 })] }

def circleEq : Polynomial :=
  { terms := [(1, { expX := 2, expY := 0 }), (1, { expX := 0, expY := 2 }), (-1, Monomial.one)] }

def parabola : AffinePlaneCurve := { equation := parabolaEq, name := "parabola" }
def circle : AffinePlaneCurve := { equation := circleEq, name := "circle" }

#eval parabola.onCurve 1 1
#eval parabola.onCurve 2 4
#eval circle.onCurve 0 1
#eval circle.onCurve 1 0
#eval parabola.degree
#eval circle.degree

/-! ## More Curve Constructions — L1 -/

def weierstrassCurve_eq (a1 a2 a3 a4 a6 : Int) : Polynomial :=
  { terms := [(1, { expX := 0, expY := 2 }),
              (a1, { expX := 1, expY := 1 }),
              (a3, { expX := 0, expY := 1 }),
              (-1, { expX := 3, expY := 0 }),
              (-a2, { expX := 2, expY := 0 }),
              (-a4, { expX := 1, expY := 0 }),
              (-a6, Monomial.one)] }

def hyperellipticCurve_eq (f : Polynomial) : Polynomial :=
  { terms := ([(1, { expX := 0, expY := 2 })] ++
    f.terms.map (fun (c, m) => (-c, m))) }

def fermatCurve_eq (n : Nat) : Polynomial :=
  { terms := [(1, { expX := n, expY := 0 }), (1, { expX := 0, expY := n }),
              (-1, Monomial.one)] }

def lemniscate_eq : Polynomial :=
  { terms := [(1, { expX := 4, expY := 0 }), (2, { expX := 2, expY := 2 }),
              (1, { expX := 0, expY := 4 }), (-1, { expX := 2, expY := 0 }),
              (1, { expX := 0, expY := 2 })] }

def weierstrassDiscriminant (a b : Int) : Int :=
  -16 * (4 * a * a * a + 27 * b * b)

def weierstrassJInvariant (a b : Int) : Int :=
  let Δ := weierstrassDiscriminant a b
  if Δ == 0 then 0 else 1728 * 4 * a * a * a / Δ

def isSmoothWeierstrass (a b : Int) : Bool := weierstrassDiscriminant a b != 0

/-! ## Evaluation Helpers — L2 -/

def Polynomial.evalAtX0 (p : Polynomial) (b : Int) : Int := p.eval 0 b

def Polynomial.countTermsOfDegree (p : Polynomial) (d : Nat) : Nat :=
  p.terms.filter (fun (_, m) => m.totalDeg == d) |>.length

#eval weierstrassDiscriminant (-1) 0
#eval weierstrassDiscriminant 0 7
#eval weierstrassJInvariant (-1) 0
#eval weierstrassJInvariant 0 7
#eval isSmoothWeierstrass (-1) 0
#eval isSmoothWeierstrass 0 0
#eval fermatCurve_eq 3 |>.totalDeg
#eval lemniscate_eq.totalDeg
#eval Polynomial.evalAtX0 circleEq 1
#eval Polynomial.countTermsOfDegree circleEq 2
#eval Polynomial.countTermsOfDegree circleEq 0

end MiniCurvesSurfaces