/-
# MiniCurvesSurfaces: Core — Object Registrations (L1/L3)
-/

import MiniObjectKernel.Core.Basic
import MiniCurvesSurfaces.Core.Basic

open MiniObjectKernel

namespace MiniCurvesSurfaces

instance : Object Polynomial where
  theory := TheoryName.ofString "AlgebraicGeometry.Curves.Polynomial"
  objName := "Polynomial(Z[x,y])"
  repr p := s!"Poly(deg={p.totalDeg})"

instance : Object Monomial where
  theory := TheoryName.ofString "AlgebraicGeometry.Curves.Monomial"
  objName := "Monomial"
  repr m := toString m

instance : Object AffinePlaneCurve where
  theory := TheoryName.ofString "AlgebraicGeometry.Curves.Affine"
  objName := "AffinePlaneCurve"
  repr C := s!"Curve({C.name}, deg={C.degree})"

/-! ## Projective Plane Curves — L1 -/

structure ProjectivePlaneCurve where
  equation : List (Int × Nat × Nat × Nat)
  degree : Nat
  name : String
  deriving Repr, Inhabited

def ProjectivePlaneCurve.eval (C : ProjectivePlaneCurve) (X Y Z : Int) : Int :=
  C.equation.foldl (fun acc (c, dx, dy, dz) =>
    acc + c * (X ^ dx) * (Y ^ dy) * (Z ^ dz)) 0

def ProjectivePlaneCurve.onCurve (C : ProjectivePlaneCurve) (X Y Z : Int) : Bool :=
  C.eval X Y Z == 0

/-! ## Algebraic Surfaces — L1 -/

structure Monomial3 where
  expX : Nat
  expY : Nat
  expZ : Nat
  deriving Repr, Inhabited, BEq

def Monomial3.totalDeg (m : Monomial3) : Nat := m.expX + m.expY + m.expZ

structure SurfacePolynomial where
  terms : List (Int × Monomial3)
  deriving Repr, Inhabited

def SurfacePolynomial.totalDeg (p : SurfacePolynomial) : Nat :=
  match p.terms with
  | [] => 0
  | ts => ts.map (fun (_, m) => m.totalDeg) |>.foldl Nat.max 0

def SurfacePolynomial.eval (p : SurfacePolynomial) (x y z : Int) : Int :=
  p.terms.foldl (fun acc (c, m) =>
    acc + c * (x ^ m.expX) * (y ^ m.expY) * (z ^ m.expZ)) 0

structure AffineSurface where
  equation : SurfacePolynomial
  name : String
  deriving Repr

def AffineSurface.onSurface (S : AffineSurface) (x y z : Int) : Bool :=
  S.equation.eval x y z == 0

def SurfacePolynomial.derivX (p : SurfacePolynomial) : SurfacePolynomial :=
  { terms := p.terms.filterMap fun (c, m) =>
    if m.expX == 0 then none
    else some (c * (m.expX : Int), { expX := m.expX - 1, expY := m.expY, expZ := m.expZ }) }

def SurfacePolynomial.derivY (p : SurfacePolynomial) : SurfacePolynomial :=
  { terms := p.terms.filterMap fun (c, m) =>
    if m.expY == 0 then none
    else some (c * (m.expY : Int), { expX := m.expX, expY := m.expY - 1, expZ := m.expZ }) }

def SurfacePolynomial.derivZ (p : SurfacePolynomial) : SurfacePolynomial :=
  { terms := p.terms.filterMap fun (c, m) =>
    if m.expZ == 0 then none
    else some (c * (m.expZ : Int), { expX := m.expX, expY := m.expY, expZ := m.expZ - 1 }) }

def AffineSurface.isSmoothPoint (S : AffineSurface) (x y z : Int) : Bool :=
  if !S.onSurface x y z then false
  else
    let dx := S.equation.derivX.eval x y z
    let dy := S.equation.derivY.eval x y z
    let dz := S.equation.derivZ.eval x y z
    dx != 0 || dy != 0 || dz != 0

/-! ## Ruled Surfaces — L3 -/

structure RuledSurface where
  baseCurve : AffinePlaneCurve
  fiberType : String
  name : String
  deriving Repr

def hirzebruchSurface (n : Nat) : String :=
  s!"Σ_{n}: P^1-bundle over P^1, section E of self-intersection -{n}"

def quadricSurface_eq (x y z w : Int) : Int := x*w - y*z

def veroneseSurfaceDim : Nat := 5

/-! ## Elliptic Surfaces — L8 -/

structure EllipticSurface where
  baseCurve : AffinePlaneCurve
  genericFiber : String
  singularFibers : List String
  name : String
  deriving Repr

def kodairaFiberTypes : List String :=
  ["I_0", "I_1", "I_n", "II", "III", "IV", "I*_n", "II*", "III*", "IV*"]

def kodairaFiberEulerChar (fiberType : String) : Nat :=
  match fiberType with
  | "I_0" => 0 | "I_1" => 1 | "I_2" => 2
  | "II" => 2 | "III" => 3 | "IV" => 4
  | "II*" => 10 | "III*" => 9 | "IV*" => 8
  | _ => 6

instance : Object ProjectivePlaneCurve where
  theory := TheoryName.ofString "AlgebraicGeometry.Curves.Projective"
  objName := "ProjectivePlaneCurve"
  repr C := s!"P-Curve({C.name}, deg={C.degree})"

instance : Object AffineSurface where
  theory := TheoryName.ofString "AlgebraicGeometry.Surfaces.Affine"
  objName := "AffineSurface"
  repr S := s!"Surface({S.name})"

#eval describe (α := Polynomial)
#eval describe (α := AffinePlaneCurve)
#eval describe (α := ProjectivePlaneCurve)
#eval describe (α := AffineSurface)
#eval hirzebruchSurface 0
#eval hirzebruchSurface 1
#eval quadricSurface_eq 1 2 3 6
#eval kodairaFiberEulerChar "I_1"
#eval kodairaFiberEulerChar "II*"

end MiniCurvesSurfaces