/-
# MiniCurvesSurfaces: Theorems — Classification Theorems (L4)

Hurwitz formula, adjunction formula, genus of complete intersections,
Noether formula for surfaces.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Properties.Invariants
import MiniCurvesSurfaces.Constructions.Subobjects

namespace MiniCurvesSurfaces

/-! ## Riemann-Hurwitz Formula — L4 -/

def riemannHurwitz (g1 g2 n ramDeg : Nat) : Int :=
  (2 * (g1 : Int) - 2) - (n : Int) * (2 * (g2 : Int) - 2) - (ramDeg : Int)

/-! ## Adjunction Formula — L4 -/

def adjunctionFormula (CdotC CdotKS : Int) : Int :=
  (CdotC + CdotKS + 2) / 2

def planeCurveGenusByAdjunction (d : Nat) : Int :=
  let CdotC := (d : Int) * (d : Int)
  let CdotKS := -3 * (d : Int)
  (CdotC + CdotKS + 2) / 2

/-! ## Complete Intersection Genus — L4

For a smooth complete intersection of type (d1, d2) in P^3 with d1,d2 >= 1,
the genus is: g = 1 + d1·d2·(d1 + d2 - 4)/2.

Special cases:
- (1,d): genus 0 (plane curve of degree d in P^2 ⊂ P^3)
- (2,2): elliptic quartic, genus 1
- (2,3): canonical curve, genus 4
- (3,3): genus 10
- (2,4): genus 9
- (4,4): genus 33 -/

def completeIntersectionGenus (d1 d2 : Nat) : Nat :=
  1 + (d1 * d2 * (d1 + d2 - 4)) / 2

theorem ciGenus22 : completeIntersectionGenus 2 2 = 1 := by
  unfold completeIntersectionGenus; decide

theorem ciGenus23 : completeIntersectionGenus 2 3 = 4 := by
  unfold completeIntersectionGenus; decide

theorem ciGenus33 : completeIntersectionGenus 3 3 = 10 := by
  unfold completeIntersectionGenus; decide

theorem ciGenus24 : completeIntersectionGenus 2 4 = 9 := by
  unfold completeIntersectionGenus; decide

/-! ## Noether Formula — L4 -/

def noetherFormula (Ksq eulerChi holEulerChi : Int) : Bool :=
  Ksq + eulerChi == 12 * holEulerChi

theorem noetherFormulaForP2 : noetherFormula 9 3 1 := by
  unfold noetherFormula; decide

theorem noetherFormulaForP1xP1 : noetherFormula 8 4 1 := by
  unfold noetherFormula; decide

theorem noetherFormulaForK3 : noetherFormula 0 24 2 := by
  unfold noetherFormula; decide

/-! ## Hodge Index Theorem — L4

On a smooth projective surface S, the intersection pairing on NS(S)_R
has signature (1, ρ-1): one positive direction (ample class) and
ρ-1 negative directions. Equivalently:
  - If D·H = 0 for some ample H, then D^2 ≤ 0
  - Equality D^2 = 0 iff D is numerically trivial -/

def hodgeIndexCheck (D2 Hpositive : Int) : Bool :=
  if Hpositive > 0 then D2 ≤ 0 else true

theorem hodgeIndexSimpleExample : hodgeIndexCheck (-2) 1 := by
  unfold hodgeIndexCheck; decide

theorem hodgeIndexSimpleExample2 : hodgeIndexCheck (-1) 1 := by
  unfold hodgeIndexCheck; decide

theorem hodgeIndexSimpleExample3 : hodgeIndexCheck 0 1 := by
  unfold hodgeIndexCheck; decide

/-- The Hodge index theorem implies: if E^2 = -1 and E·K = -1,
    then E is an exceptional curve of the first kind. -/
def exceptionalCurveCheck (E2 : Int) (EK : Int) : Bool := E2 == -1 && EK == -1

/-! ## Castelnuovo's Rationality Criterion — L4

A smooth projective surface S is rational (birational to P^2) iff:
  q(S) = h^{0,1}(S) = 0 and P_2(S) = h^0(2K_S) = 0

This is a fundamental result in the classification of surfaces.
For curves: a curve is rational iff g = 0. -/

def castelnuovoRationalCheck (q p2 : Nat) : Bool := q == 0 && p2 == 0

def irregularityToHodge (q : Nat) : String := s!"q(S) = h^(0,1)(S) = {q}"

theorem castelnuovoP2 : castelnuovoRationalCheck 0 0 := by
  unfold castelnuovoRationalCheck; decide

theorem castelnuovoNotRational : ¬ castelnuovoRationalCheck 1 0 := by
  unfold castelnuovoRationalCheck; decide

/-! ## Genus Formula for Complete Intersections in P^n — L4

For a complete intersection of hypersurfaces of degrees d_1,...,d_r
in P^n (with r = codimension):
  genus g = 1 + (d_1·...·d_r)·(d_1 + ... + d_r - n - 1)/2

Special cases:
  - Plane curves (r=1): g = 1 + d·(d-3)/2 = (d-1)(d-2)/2
  - Curves in P^3 (r=2): g = 1 + d1·d2·(d1+d2-4)/2
  - Threefolds in P^4 (r=3): g = 1 + d1·d2·d3·(d1+d2+d3-5)/2 -/

def completeIntersectionGenusPn (degrees : List Nat) (n : Nat) : Nat :=
  let prod := degrees.foldl Nat.mul 1
  let sum := degrees.foldl Nat.add 0
  1 + (prod * (sum - n - 1)) / 2

-- The formula: for a plane curve of degree d, genus = (d-1)(d-2)/2
-- completeIntersectionGenusPn [d] 2 = 1 + d*(d-3)/2  (works for d >= 3 with Nat arithmetic)
-- Verified by direct computation for examples:
def checkGenusFormulaPn (d : Nat) : Bool :=
  completeIntersectionGenusPn [d] 2 == ((d-1)*(d-2))/2

theorem ciGenusPnPlane_d3 : completeIntersectionGenusPn [3] 2 = 1 := by
  unfold completeIntersectionGenusPn; decide
theorem ciGenusPnPlane_d4 : completeIntersectionGenusPn [4] 2 = 3 := by
  unfold completeIntersectionGenusPn; decide
theorem ciGenusPnPlane_d5 : completeIntersectionGenusPn [5] 2 = 6 := by
  unfold completeIntersectionGenusPn; decide

/-! ## Kodaira Vanishing and Ramanujam Vanishing — L4

For an ample divisor H on a smooth projective variety X of dimension n
in characteristic 0:
  H^q(X, Ω^p(H)) = 0 for p + q > n (Kodaira-Akizuki-Nakano)

For a big and nef divisor D on a surface:
  H^1(S, O_S(K_S + D)) = 0 (Kawamata-Viehweg vanishing)

Kodaira vanishing fails in positive characteristic (counterexamples exist). -/

def kodairaVanishingCondition (p q n : Nat) : Bool := p + q > n

/-! ## #eval Examples -/

#eval planeCurveGenusByAdjunction 3
#eval planeCurveGenusByAdjunction 4
#eval completeIntersectionGenus 2 2
#eval completeIntersectionGenus 2 3
#eval completeIntersectionGenus 3 3
#eval completeIntersectionGenus 2 4
#eval noetherFormula 9 3 1
#eval noetherFormula 8 4 1
#eval noetherFormula 0 24 2

#eval "── Hodge Index and Castelnuovo ──"
#eval hodgeIndexCheck (-2) 1
#eval hodgeIndexCheck (-1) 1
#eval hodgeIndexCheck 0 1
#eval exceptionalCurveCheck (-1) (-1)
#eval exceptionalCurveCheck (-1) 0
#eval castelnuovoRationalCheck 0 0
#eval castelnuovoRationalCheck 1 0
#eval castelnuovoRationalCheck 0 1
#eval castelnuovoRationalCheck 1 1
#eval completeIntersectionGenusPn [3] 2
#eval completeIntersectionGenusPn [4] 2
#eval completeIntersectionGenusPn [2,2] 3
#eval completeIntersectionGenusPn [2,3] 3
#eval completeIntersectionGenusPn [2,4] 3
#eval completeIntersectionGenusPn [3,3] 3
#eval completeIntersectionGenusPn [2,2,2] 4
#eval kodairaVanishingCondition 1 1 2
#eval kodairaVanishingCondition 1 2 2
#eval kodairaVanishingCondition 2 2 2

end MiniCurvesSurfaces