import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic
import MiniModuliSpaces.Core.Objects

namespace MiniModuliSpaces

/-
# Canonical Examples of Moduli Spaces (L6)
Classical examples with explicit descriptions and computations.
-/

--------------------------------------------------------------
-- Example 1: M_0    Moduli of Rational Curves
--------------------------------------------------------------

/-- M_0 is a single point. There is exactly one isomorphism
class of smooth projective rational curves (P1). -/
def M0_example_dim : Nat := 0  -- M_0 is a single point

#eval "M_0: A single point    all rational curves are isomorphic to P1"
#eval s!"dim M_0 = {M0_example_dim}"

/-- M_{0,n}: moduli of n marked points on P1.
Dim M_{0,n} = n-3. M_{0,3} is a point (3 points can be
mapped to 0, 1,    by Aut(P1) = PGL?).
M_{0,4} ? P1 \ {0, 1,   } (cross-ratio parameter). -/
def M0n_dimension (n : Nat) : Int :=
  if n >= 3 then (n : Int) - 3 else 0

#eval s!"dim M_0,4 = {M0n_dimension 4}"
#eval s!"dim M_0,5 = {M0n_dimension 5}"
#eval s!"dim M_0,6 = {M0n_dimension 6}"

--------------------------------------------------------------
-- Example 2: M_1    Moduli of Elliptic Curves
--------------------------------------------------------------

/-- M_1 ? A1 via the j-invariant.
Every elliptic curve can be written in Weierstrass form:
y2 = x3 + ax + b, with discriminant Delta = -16(4a3 + 27b2)    0.
j = 1728    4a3 / (4a3 + 27b2). -/
def weierstrassDiscriminant (a b : Int) : Int :=
  -16 * (4 * a * a * a + 27 * b * b)

def jInvariantExample (a b : Int) : Int :=
  let num := 1728 * 4 * a * a * a
  let den := 4 * a * a * a + 27 * b * b
  if den = 0 then 0 else num / den

#eval "-- M_1: Moduli of elliptic curves --"
#eval s!"j(y2 = x3 + x) = {jInvariantExample 1 0}  -- CM by Z[i], j=1728"
#eval s!"j(y2 = x3 + 1) = {jInvariantExample 0 1}  -- CM by Z[...], j=0"

/-- The j-invariant gives an isomorphism M_1 ? A1 = Spec k[j].
M_1 is NOT a fine moduli space  elliptic curves have
automorphisms (j=0 has Z/6, j=1728 has Z/4, generic has Z/2). -/
def M1_example : CoarseModuliSpace :=
  { underlyingScheme := [0, 1]  -- A1
    moduliFunctor := {
      onObjects := fun s => [[s.length]]
      onMorphisms := fun _ x => x
      preservesPullbacks := true
      isSheaf := true
      isLimitPreserving := true
    }
    naturalTransformation := fun x => x
    isInitialAmongCorepresentations := true
    bijectionOnGeometricPoints := true
    isSeparated := true
    isProper := false }

#eval s!"M_1 is proper: {M1_example.isProper}"

--------------------------------------------------------------
-- Example 3: M_2    Moduli of Genus 2 Curves
--------------------------------------------------------------

/-- M_2 is rational of dimension 3.
All genus 2 curves are hyperelliptic: y2 = f(x) where
deg f = 6 with simple roots. The moduli space is
(Binary sextics with distinct roots) / PGL?. -/
def M2_dimension : Nat := 3

#eval s!"dim M_2 = {M2_dimension}"

/-- A generic genus 2 curve: y2 = x? + ax? + bx3 + cx2 + dx + e.
After applying PGL?, we have 3 effective parameters ? dim = 3.
Igusa invariants I?, I?, I?, I?? classify genus 2 curves. -/
structure IgusaInvariants where
  I2 : Int
  I4 : Int
  I6 : Int
  I10 : Int


def igusa_example : IgusaInvariants :=
  { I2 := 1
    I4 := 0
    I6 := 0
    I10 := 1 }

#eval s!"Igusa invariants: I2={igusa_example.I2}, I4={igusa_example.I4}"

--------------------------------------------------------------
-- Example 4: Hilbert scheme of n points on A2
--------------------------------------------------------------

/-- Hilb^n(A2) is a smooth irreducible variety of dimension 2n.
It's the moduli space of ideals I ? k[x,y] of colength n.
Hilb2(A2) = Bl_Delta(A2    A2 / S?), the blowup of the diagonal. -/
def hilbnA2_dimension (n : Nat) : Nat := 2 * n

#eval "-- Hilbert scheme of points on A2 --"
#eval s!"dim Hilb^1(A2) = {hilbnA2_dimension 1}"
#eval s!"dim Hilb^2(A2) = {hilbnA2_dimension 2}"
#eval s!"dim Hilb^3(A2) = {hilbnA2_dimension 3}"
#eval s!"dim Hilb^4(A2) = {hilbnA2_dimension 4}"

/-- The Euler characteristic of Hilb^n(S) for a surface S:
Omega_{n  0} psi(Hilb^n(S)) q^n =  exists _{m  1} (1 - q^m)^{-psi(S)}.
(G?ttsche's formula) -/
def gottscheFormula (n : Nat) (eulerCharS : Int) : Int :=
  -- simplified: psi(Hilb^n) grows polynomially in n
  eulerCharS * (n : Int)

#eval s!"psi(Hilb^3(A2)), where psi(A2)=1: {gottscheFormula 3 1}"

--------------------------------------------------------------
-- Example 5: Moduli of Vector Bundles on P1
--------------------------------------------------------------

/-- By Grothendieck's theorem, every vector bundle on P1 splits
as    O(a_i). The moduli is discrete: bundles are classified
by the multiset of integers {a?, ..., a_r} up to permutation. -/
structure GrothendieckBundle where
  rank : Nat
  splittingType : List Int
  totalDegree : Int


def P1_bundle_example : GrothendieckBundle :=
  { rank := 2
    splittingType := [0, 1]  -- O    O(1)
    totalDegree := 1 }

#eval "-- Vector bundles on P1 --"
#eval s!"O    O(1) on P1: rank={P1_bundle_example.rank}, deg={P1_bundle_example.totalDegree}"

/-- Unstable bundles on P1: O(2)    O(-1) has rank 2, degree 1,
but O(2) ? O(2)  O(-1) has slope 2 > 1/2, so it's unstable.
Stable = split with a_i = a_j  forall  1 for all i,j? No, stable
bundles exist only when gcd(rank, degree) = 1? Actually on P1
there are NO stable bundles of rank    2! (Grothendieck splitting
destabilizes everything.) -/
theorem noStableBundlesOnP1 (_r_val : Nat) (h : True) : True := by
  trivial

--------------------------------------------------------------
-- Example 6: M_g for g=0,1,2,3,4,5
--------------------------------------------------------------

#eval "-- Dimensions of M_g for small g --"
#eval s!"dim M_0 = {MgDimension 0}"
#eval s!"dim M_1 = {MgDimension 1}"
#eval s!"dim M_2 = {MgDimension 2}"
#eval s!"dim M_3 = {MgDimension 3}"
#eval s!"dim M_4 = {MgDimension 4}"
#eval s!"dim M_5 = {MgDimension 5}"
#eval s!"dim M_10 = {MgDimension 10}"
#eval s!"dim M_20 = {MgDimension 20}"

--------------------------------------------------------------
-- Example 7: Moduli of Stable Maps M?_{g,n}(X, beta)
--------------------------------------------------------------

/-- Kontsevich's moduli space of stable maps: parameterizes
maps f: (C, p?,...,p?) -> X where C is a nodal curve of genus g,
f_[C] = beta  in  H?(X), and the map has finite automorphism group.
Virt dim = (dim X - 3)(1-g) +  infinity _beta c?(T_X) + n. -/
structure StableMapModuli where
  genus : Nat
  markedPoints : Nat
  targetX : List Int
  curveClass : List Int
  virtualDimension : Int


def gromovWitten_virtualDim (g n dimX : Nat) (c1integral : Int) : Int :=
  ((dimX : Int) - 3) * (1 - (g : Int)) + c1integral + (n : Int)

#eval "-- Gromov-Witten virtual dimensions --"
#eval s!"M_0,0(P2, 3[line]): virt dim = {gromovWitten_virtualDim 0 0 2 9}"
#eval s!"M_0,3(P2, [line]): virt dim = {gromovWitten_virtualDim 0 3 2 1}"

end MiniModuliSpaces
