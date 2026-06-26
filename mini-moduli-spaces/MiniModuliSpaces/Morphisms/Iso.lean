import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Isomorphisms and Automorphisms (L2-L3)
Isomorphism classes in moduli problems, automorphism groups,
orbifold structure of moduli spaces.
-/

/-- An isomorphism between two objects in a family.
This is the fundamental equivalence relation that moduli
spaces are supposed to quotient by. -/
structure ObjectIsomorphism where
  object1 : List Int
  object2 : List Int
  isomorphismMap : List Int -> List Int
  inverseMap : List Int -> List Int
  preservesStructure : Bool


/-- An isomorphism of families X/S and Y/T:
consists of an isomorphism chi: S -> T of base schemes
and an isomorphism X -> Y over chi. -/
structure FamilyIsomorphism where
  family1 : FamilyOfObjects
  family2 : FamilyOfObjects
  baseIsomorphism : List Int -> List Int
  fiberIsomorphism : List Int -> List (List Int)
  commutesOverBase : Bool


/-- The automorphism group of an object X:
Aut(X) = {isomorphisms f: X -> X}.
For stable objects, Aut(X) is finite.
For unstable objects, Aut(X) is positive-dimensional. -/
structure AutomorphismGroup where
  object : List Int
  groupElements : List (List Int -> List Int)
  groupOperation : (List Int -> List Int) -> (List Int -> List Int) -> (List Int -> List Int)
  isFinite : Bool
  dimension : Nat
  isReductive : Bool


/-- The stabilizer group in GIT: for a point x in the semistable
locus, the stabilizer G_x ? G is the automorphism group.
Points with positive-dimensional stabilizers cause stacky structure. -/
structure StabilizerGroup where
  point : List Int
  group : AutomorphismGroup
  stabilizerSubgroup : List (List Int -> List Int)
  isFinite : Bool


/-- An orbifold point in a moduli space: a point [X] whose
automorphism group Aut(X) is non-trivial but finite.
The local structure is [Def_X / Aut(X)] where Def_X
is the deformation space. -/
structure OrbifoldPoint where
  point : List Int
  automorphismGroup : AutomorphismGroup
  localDeformationSpace : List Int
  groupActionOnDef : List Int -> List Int -> List Int
  inertiaGroup : List (List Int -> List Int)


/-- Orbifold locus: the substack of M parameterizing objects
with non-trivial automorphisms. For M_g, this includes
hyperelliptic curves for all g_val, and special curves with
extra automorphisms. -/
structure OrbifoldLocus where
  moduliSpace : FineModuliSpace
  locus : List (List Int)
  codimension : Nat
  isotropyGroups : List (List Int -> AutomorphismGroup)


/-- The inertia stack I(M) parameterizes pairs (x, g_val) where
x  in  M and g_val  in  Aut(x). Important for orbifold cohomology
and stringy Hodge numbers. -/
structure InertiaStack where
  moduliStack : ModuliStack
  objects : List (List Int -> (List Int -> List Int))
  rigidification : Bool


/-- Rigidification: removing the generic automorphism group
from a moduli stack. For example, the Picard stack vs Picard scheme:
the stack has C* automorphisms (scaling line bundles)
which are removed in the scheme. -/
structure Rigidification where
  originalStack : ModuliStack
  rigidifiedStack : ModuliStack
  genericAutomorphisms : AutomorphismGroup
  isSmoothSurjection : Bool


/-- Global quotient stack: [X/G] where X is a scheme and G
is an algebraic group acting on X. Many moduli stacks are
of this form (GIT construction). -/
structure GlobalQuotientStack where
  totalSpace : List Int
  groupAction : AutomorphismGroup
  quotientStack : ModuliStack
  presentation : List Int -> ModuliFunctor


/-- Isomorphism classes of elliptic curves: parameterized by
the j-invariant j  in  A1_k = Spec k[j].
Two elliptic curves are isomorphic over k? iff they have the same j. -/
def jInvariant (a4 a6 : Int) : Int :=
  1728 * (4 * a4 * a4 * a4) / (4 * a4 * a4 * a4 + 27 * a6 * a6)

/-- For g_val >= 2, the automorphism group of a curve is finite
(Hurwitz bound: |Aut(C)|    84(g_val - 1) in characteristic 0).
The Hurwitz curves achieve this bound. -/
def hurwitzBound (g_val : Nat) : Nat :=
  if g_val >= 2 then 84 * (g_val - 1) else 0

/-- Isomorphism classes of vector bundles on P1:
by Grothendieck's theorem, every vector bundle splits as
   O(a_i). The isomorphism class is determined by the
multiset {a_i} up to permutation. -/
structure GrothendieckSplitting where
  base : List Int      -- P1
  splittingType : List Int  -- (a?, ..., a_r) with a?    ...    a_r
  rank : Nat
  totalDegree : Int


end MiniModuliSpaces
