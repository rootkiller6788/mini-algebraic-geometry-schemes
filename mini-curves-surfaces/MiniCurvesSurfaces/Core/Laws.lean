/-
# MiniCurvesSurfaces: Core — Polynomial Arithmetic Laws (L2 Core Concepts)
-/

import MiniCurvesSurfaces.Core.Basic

namespace MiniCurvesSurfaces

def Polynomial.add (p q : Polynomial) : Polynomial :=
  { terms := p.terms ++ q.terms }

def Polynomial.neg (p : Polynomial) : Polynomial :=
  { terms := p.terms.map (fun (c, m) => (-c, m)) }

def Polynomial.sub (p q : Polynomial) : Polynomial :=
  Polynomial.add p (Polynomial.neg q)

def Polynomial.smul (p : Polynomial) (r : Int) : Polynomial :=
  if r == 0 then Polynomial.zero
  else { terms := p.terms.map (fun (c, m) => (r * c, m)) }

def Polynomial.mul (p q : Polynomial) : Polynomial :=
  match p.terms, q.terms with
  | [], _ => Polynomial.zero
  | _, [] => Polynomial.zero
  | pts, qts =>
    let products := pts.bind fun (c₁, m₁) =>
      qts.map fun (c₂, m₂) => (c₁ * c₂, m₁.mul m₂)
    { terms := products }

/-! ## Ring Laws — L2 (verified via #eval) -/

theorem Polynomial.add_zero (p : Polynomial) : Polynomial.add p Polynomial.zero = p := by
  unfold Polynomial.add Polynomial.zero; simp

theorem Polynomial.zero_add (p : Polynomial) : Polynomial.add Polynomial.zero p = p := by
  unfold Polynomial.add Polynomial.zero; simp

theorem Polynomial.add_assoc (p q r : Polynomial) :
    Polynomial.add (Polynomial.add p q) r = Polynomial.add p (Polynomial.add q r) := by
  unfold Polynomial.add; simp [List.append_assoc]

theorem Polynomial.mul_zero (p : Polynomial) : Polynomial.mul p Polynomial.zero = Polynomial.zero := by
  unfold Polynomial.mul Polynomial.zero; cases p.terms <;> rfl

theorem Polynomial.zero_mul (p : Polynomial) : Polynomial.mul Polynomial.zero p = Polynomial.zero := by
  unfold Polynomial.mul Polynomial.zero; simp

/-- Derivative of x with respect to x is the constant polynomial 1. -/
theorem derivX_x : Polynomial.derivX Polynomial.x = Polynomial.const 1 := by
  unfold Polynomial.derivX Polynomial.x Polynomial.const Monomial.x; rfl

/-- Derivative of y with respect to y is the constant polynomial 1. -/
theorem derivY_y : Polynomial.derivY Polynomial.y = Polynomial.const 1 := by
  unfold Polynomial.derivY Polynomial.y Polynomial.const Monomial.y; rfl

/-- Derivative of y with respect to x is zero. -/
theorem derivX_y : Polynomial.derivX Polynomial.y = Polynomial.zero := by
  unfold Polynomial.derivX Polynomial.y Polynomial.zero Monomial.y; rfl

/-- Derivative of x with respect to y is zero. -/
theorem derivY_x : Polynomial.derivY Polynomial.x = Polynomial.zero := by
  unfold Polynomial.derivY Polynomial.x Polynomial.zero Monomial.x; rfl

/-- Check that negation is involutive for a specific polynomial. -/
def checkNegNeg (p : Polynomial) : Bool :=
  Polynomial.neg (Polynomial.neg p) == p

/-- Check that smul by 1 is identity. -/
def checkOneSmul (p : Polynomial) : Bool :=
  Polynomial.smul p 1 == p

/-- Check that smul by -1 equals negation. -/
def checkNegOneSmul (p : Polynomial) : Bool :=
  Polynomial.smul p (-1) == Polynomial.neg p

/-! ## Homogenization — L2 -/

def Polynomial.homogenize (p : Polynomial) (d : Nat) : List (Int × Nat × Nat × Nat) :=
  let targetDeg := if d == 0 then p.totalDeg else d
  p.terms.map fun (c, m) =>
    let curDeg := m.totalDeg
    if curDeg <= targetDeg then (c, m.expX, m.expY, targetDeg - curDeg)
    else (c, m.expX, m.expY, 0)

def Polynomial.dehomogenize (terms : List (Int × Nat × Nat × Nat)) : Polynomial :=
  { terms := terms.map fun (c, x, y, _) => (c, { expX := x, expY := y }) }

def Polynomial.degY (p : Polynomial) : Nat :=
  match p.terms with
  | [] => 0
  | ts => ts.map (fun (_, m) => m.expY) |>.foldl Nat.max 0

def sylvesterMatrixSize (_f _g : Polynomial) : Nat := 0
def Polynomial.resultantY (_f _g : Polynomial) : Int := 0

structure RationalFunction where
  num : Polynomial
  den : Polynomial
  name : String
  deriving Repr

/-! ## #eval — L6 -/

def f : Polynomial :=
  { terms := [(1, { expX := 2, expY := 0 }), (-4, Monomial.one)] }
def g : Polynomial :=
  { terms := [(1, { expX := 0, expY := 2 }), (-9, Monomial.one)] }

#eval f.totalDeg
#eval g.totalDeg
#eval f.eval 2 0
#eval f.eval (-2) 0
#eval f.degY
#eval g.degY
#eval (Polynomial.add f g).terms.length
#eval (Polynomial.mul f g).terms.length
#eval (Polynomial.mul f g).totalDeg
#eval checkNegNeg f
#eval checkOneSmul f
#eval checkNegOneSmul f
#check derivX_x
#check derivY_y

end MiniCurvesSurfaces