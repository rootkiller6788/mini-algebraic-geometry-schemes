/-
# MiniCurvesSurfaces: Properties — Invariants of Curves and Surfaces (L3)

Genus, Euler characteristic, Betti numbers, Hodge numbers,
Kodaira dimension, plurigenera.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Core.Objects
import MiniCurvesSurfaces.Constructions.Subobjects

namespace MiniCurvesSurfaces

/-! ## Genus — L3: The Fundamental Invariant -/

def genus (C : AffinePlaneCurve) : Nat := genusFromDegree C.degree

def eulerCharacteristic (C : AffinePlaneCurve) : Int :=
  let g := genus C
  2 - 2 * (g : Int)

def eulerCharacteristicSurface (S : AffineSurface) : Int :=
  let d := S.equation.totalDeg
  (d : Int) * ((d : Int)^2 - 4 * (d : Int) + 6)

/-! ## Betti Numbers — L3 -/

structure CurveBettiNumbers where
  b0 : Nat := 1
  b1 : Nat
  b2 : Nat := 1
  deriving Repr

def bettiNumbersFromGenus (g : Nat) : CurveBettiNumbers :=
  { b1 := 2 * g }

/-! ## Hodge Numbers — L3 -/

structure HodgeNumbers where
  h00 : Nat := 1
  h10 : Nat
  h01 : Nat
  h11 : Nat := 1
  deriving Repr

def hodgeNumbersFromGenus (g : Nat) : HodgeNumbers :=
  { h10 := g, h01 := g }

/-! ## Kodaira Dimension — L3 -/

inductive KodairaDim where
  | negInf | zero | one
  deriving Repr

def kodairaDimFromGenus (g : Nat) : KodairaDim :=
  match g with
  | 0 => KodairaDim.negInf
  | 1 => KodairaDim.zero
  | _ => KodairaDim.one

/-! ## Plurigenera — L3 -/

def plurigenus (g m : Nat) : Nat :=
  if g == 0 then 0
  else if g == 1 then (if m <= 1 then 1 else 0)
  else if m == 0 then 1
  else if m == 1 then g
  else (2*m - 1) * (g - 1)

def adjunctionGenus (CselfIntersection CdotKS : Int) : Int :=
  (CselfIntersection + CdotKS + 2) / 2

/-! ## #eval Examples -/

def cubicCurve : AffinePlaneCurve :=
  { equation := { terms := [(1, { expX := 0, expY := 2 }),
                             (-1, { expX := 3, expY := 0 }),
                             (1, Monomial.one)] },
    name := "cubic" }

#eval genus cubicCurve
#eval eulerCharacteristic cubicCurve
#eval kodairaDimFromGenus (genus cubicCurve)
#eval bettiNumbersFromGenus (genus cubicCurve)
#eval hodgeNumbersFromGenus 1
#eval plurigenus 1 0
#eval plurigenus 1 1
#eval plurigenus 2 1
#eval adjunctionGenus 9 (-6)

end MiniCurvesSurfaces