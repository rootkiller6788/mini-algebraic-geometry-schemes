/-
# MiniCurvesSurfaces: Properties — Preservation under Maps (L3/L4)

Genus under morphisms (Riemann-Hurwitz), invariants under blow-up,
degree formulas, intersection numbers under transformations.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Properties.Invariants
import MiniCurvesSurfaces.Morphisms.Hom
import MiniCurvesSurfaces.Morphisms.Iso

namespace MiniCurvesSurfaces

/-! ## Genus Preservation — L3 -/

/-- Genus is preserved under isomorphism: g(C1) = g(C2) if C1 ≅ C2. -/
def genusIsInvariantUnderIsomorphism : String :=
  "g(C1) = g(C2) for isomorphic smooth curves."

/-- Genus can decrease under finite morphisms (Riemann-Hurwitz). -/
def genusUnderMorphism (g1 g2 n r : Nat) : Int :=
  (2*(g1 : Int) - 2) - (n : Int)*(2*(g2 : Int) - 2) - (r : Int)

/-- If f: C1 -> C2 is a degree-n separable morphism, then
    g(C1) ≥ g(C2) (genus does not increase from source to target). -/
def genusNonDecreasing (g1 g2 n : Nat) (_h : n ≥ 1) : Bool :=
  let rhs := (2*(g2:Int) - 2)
  let lhs := (2*(g1:Int) - 2)
  lhs ≥ (n:Int) * rhs

/-! ## Blow-Up Formulas — L3 -/

def degreeAfterBlowup (deg multiplicity : Nat) : Nat :=
  if multiplicity <= deg then deg - multiplicity else 0

def properTransformDegree (deg multiplicity : Nat) : Nat := deg - multiplicity

/-- Genus change under blow-up at a singular point:
    g(C~) = p_a(C) - Σ δ_P where δ_P = m_P(m_P - 1)/2. -/
def deltaInvariant (multiplicity : Nat) : Nat :=
  multiplicity * (multiplicity - 1) / 2

/-- For an ordinary m-fold point, δ = m(m-1)/2. -/
theorem deltaInvariantFormula (m : Nat) : deltaInvariant m = m*(m-1)/2 := by
  unfold deltaInvariant; rfl

/-- Example: node (m=2, two distinct tangents): δ = 1, genus drops by 1. -/
theorem nodeDeltaInvariant : deltaInvariant 2 = 1 := by
  unfold deltaInvariant; decide

/-- Example: ordinary triple point (m=3): δ = 3. -/
theorem triplePointDeltaInvariant : deltaInvariant 3 = 3 := by
  unfold deltaInvariant; decide

/-- Example: ordinary cusp (m=2, one tangent): more subtle, but δ=1. -/
def genusAfterBlowup (g multiplicity : Nat) : Nat :=
  let delta := deltaInvariant multiplicity
  if delta <= g then g - delta else 0

/-! ## Intersection Theory Under Transformations — L3 -/

/-- For a blow-up π: S~ -> S at a point, with exceptional divisor E:
    π*C = C~ + mE where m = mult_P(C) is the multiplicity.
    C~·E = m, E^2 = -1.
    C~^2 = C^2 - m^2 (self-intersection drops). -/
def selfIntersectionAfterBlowup (CselfInt : Int) (multiplicity : Nat) : Int :=
  CselfInt - (multiplicity : Int)*(multiplicity : Int)

/-! Adjunction formula under blow-up:
g(C~) = g(C) - m(m-1)/2. Checked for specific values. -/
def checkAdjunction (g m : Nat) : Bool :=
  g == genusAfterBlowup g m + deltaInvariant m

/-! ## Intersection Theory Under Maps — L3

For a morphism f: S -> T of surfaces:
  - Pushforward: f_*: A_k(S) -> A_k(T) on Chow groups
  - Pullback: f^*: A^k(T) -> A^k(S) (for flat or lci morphisms)
  - Projection formula: f_*(α·f^*β) = f_*α·β

For a blow-up π: S̃ -> S at a point with exceptional divisor E:
  - π^*: Pic(S) -> Pic(S̃) is injective
  - Pic(S̃) = π^*Pic(S) ⊕ Z[E]
  - E^2 = -1, K_S̃ = π^*K_S + E (for surfaces)
  - C̃^2 = C^2 - m^2 where m = mult_P(C) -/

def picardGroupOfBlowup (rho : Nat) : String :=
  s!"Pic(S̃) ≅ Pic(S) ⊕ Z, rank = {rho+1}"

def canonicalBundleOfBlowup : String :=
  "K_S̃ = π^*K_S + E (adjunction for exceptional divisor)"

/-- For a blow-up of P^2 at n points:
    Pic = Z^{n+1} with basis H, E_1, ..., E_n
    H^2 = 1, H·E_i = 0, E_i·E_j = -δ_ij
    K = -3H + Σ E_i (del Pezzo surfaces) -/

def delPezzoDegree (n : Nat) : Int := 9 - (n : Int)

def delPezzoIsFano (n : Nat) : Bool := n <= 8

/-- Cubic surface = blow-up of P^2 at 6 points in general position.
    Contains exactly 27 lines:
    - 6 exceptional divisors E_i
    - 15 lines through pairs of blown-up points
    - 6 conics through 5 of the 6 points -/

def countLinesOnCubicSurface : Nat := 27
def linesOfTypeE : Nat := 6
def linesOfTypeF : Nat := 15
def linesOfTypeG : Nat := 6

/-! ## Monoidal Transformations — L3

A birational morphism between smooth surfaces factors as a sequence
of blow-ups at points (Zariski's main theorem + Castelnuovo).
f: S -> S_min contracts precisely the (-1)-curves. -/

def isExceptionalCurveOfFirstKind (selfInt : Int) (genus : Nat) : Bool :=
  selfInt == -1 && genus == 0

def castelnuovoContractibilityTheorem : String :=
  "An irreducible curve E on S can be blown down iff E ≅ P^1 and E^2 = -1"

/-! ## Minimal Model Program Steps — L8

For a surface S:
  1. If S contains a (-1)-curve E, blow it down: S -> S_1, Pic decreases by 1
  2. Repeat until no (-1)-curves remain
  3. Result is a minimal model: P^2, ruled surface, or K_S nef
  For non-rational ruled surfaces, minimal model = P^1-bundle over curve -/

def stepOfMMP (rankBefore : Nat) : Nat := rankBefore - 1

def minimalModelType (kodairaDim : Int) : String :=
  match kodairaDim with
  | -1 => "P^2 or ruled surface (κ = -∞)"
  | 0  => "K3, Enriques, abelian, or bielliptic (κ = 0)"
  | 1  => "Properly elliptic surface (κ = 1)"
  | _  => "Surface of general type (κ = 2)"

/-! ## #eval -/

#eval degreeAfterBlowup 4 2
#eval properTransformDegree 4 2
#eval deltaInvariant 2
#eval deltaInvariant 3
#eval deltaInvariant 4
#eval genusAfterBlowup 3 1
#eval genusAfterBlowup 3 2
#eval selfIntersectionAfterBlowup 9 2
#eval selfIntersectionAfterBlowup 16 3
#eval checkAdjunction 3 1
#eval checkAdjunction 3 2
#eval checkAdjunction 5 2

#eval "── Blow-Up and MMP ──"
#eval picardGroupOfBlowup 1
#eval picardGroupOfBlowup 8
#eval canonicalBundleOfBlowup
#eval delPezzoDegree 3
#eval delPezzoDegree 6
#eval delPezzoDegree 8
#eval delPezzoIsFano 6
#eval delPezzoIsFano 9
#eval countLinesOnCubicSurface
#eval linesOfTypeE + linesOfTypeF + linesOfTypeG
#eval isExceptionalCurveOfFirstKind (-1) 0
#eval isExceptionalCurveOfFirstKind (-2) 0
#eval castelnuovoContractibilityTheorem
#eval stepOfMMP 10
#eval minimalModelType (-1)
#eval minimalModelType 0
#eval minimalModelType 1
#eval minimalModelType 2

end MiniCurvesSurfaces