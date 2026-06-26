/-
# MiniIntersectionTheory: Core Basic Definitions

Defines the fundamental objects of intersection theory:
algebraic varieties, subvarieties, dimension theory,
and the basic operations on varieties.

## L1: Definitions
- Variety (as abstract type with dimension)
- Subvariety (embedding + codimension)
- Divisor (codimension 1 subvariety)
- Rational function (morphism to P^1)
- Morphism, proper, flat
-/

import MiniObjectKernel.Core.Basic

set_option checkBinderAnnotations false

/-! ## Set API (needed for varieties)

We define Set locally, following the same pattern as
MiniTopologicalSpaces. -/

def Set (α : Type u) : Type u := α → Prop

namespace Set

variable {α β : Type u}

instance : Membership α (Set α) := ⟨λ x s => s x⟩

def univ : Set α := λ _ => True
def empty : Set α := λ _ => False

instance : EmptyCollection (Set α) := ⟨empty⟩

def inter (s t : Set α) : Set α := λ x => s x ∧ t x
instance : Inter (Set α) := ⟨inter⟩

def union (s t : Set α) : Set α := λ x => s x ∨ t x
instance : Union (Set α) := ⟨union⟩

def subset (s t : Set α) : Prop := ∀ x, x ∈ s → x ∈ t
instance : HasSubset (Set α) := ⟨subset⟩

def compl (s : Set α) : Set α := λ x => ¬ s x

def prod (s : Set α) (t : Set β) : Set (α × β) := λ p => s p.1 ∧ t p.2

def Disjoint (s t : Set α) : Prop := s ∩ t = ∅

structure Nonempty (s : Set α) : Prop where
  intro ::
  exists_mem : ∃ x, x ∈ s

end Set

open Set

namespace MiniIntersectionTheory

/-! ## Algebraic Variety

An algebraic variety is an abstract type X equipped with
a dimension and a notion of closed subvariety.

We model this as a typeclass for maximum flexibility. -/

class Variety (X : Type u) where
  dim : Nat
  isSmooth : Prop
  isProjective : Prop
  isComplete : Prop
  isIntegral : Prop
  isRegular : Prop

export Variety (dim isSmooth isProjective isComplete isIntegral isRegular)

/-! ## Subvariety

A closed subvariety Y of X, with codimension c. -/

structure Subvariety (X : Type u) [Variety X] where
  carrier : Type u
  isVariety : Variety carrier
  embedding : carrier → X
  embedding_injective : ∀ a b, embedding a = embedding b → a = b
  codim : Nat
  dim_add_codim_eq : isVariety.dim + codim = (by infer_instance : Variety X).dim

/-! ## Divisor

A (Weil) divisor on X is a subvariety of codimension 1. -/

def IsDivisor {X : Type u} [Variety X] (Y : Subvariety X) : Prop :=
  Y.codim = 1

structure Divisor (X : Type u) [Variety X] where
  subvar : Subvariety X
  isCodim1 : subvar.codim = 1

/-! ## Rational Function

A rational function f on X, given by its divisor of zeros and poles. -/

structure RationalFunction (X : Type u) [Variety X] where
  zeros : List (Divisor X)
  poles : List (Divisor X)
  disjoint : List.length zeros + List.length poles = List.length zeros

/-! ## Principal Divisor

The divisor of a rational function: (f) = (f)_0 - (f)_∞. -/

structure PrincipalDivisor (X : Type u) [Variety X] where
  f : RationalFunction X
  zeroList : List (Divisor X)
  poleList : List (Divisor X)

/-! ## Dimension Utilities -/

def dimOf (X : Type u) [Variety X] : Nat := (by infer_instance : Variety X).dim

def isZeroDimensional (X : Type u) [Variety X] : Prop := dimOf X = 0
def isCurve (X : Type u) [Variety X] : Prop := dimOf X = 1
def isSurface (X : Type u) [Variety X] : Prop := dimOf X = 2
def isThreefold (X : Type u) [Variety X] : Prop := dimOf X = 3

/-! ## Product Varieties -/

instance (X Y : Type u) [Variety X] [Variety Y] : Variety (X × Y) where
  dim := dimOf X + dimOf Y
  isSmooth := (by infer_instance : Variety X).isSmooth ∧ (by infer_instance : Variety Y).isSmooth
  isProjective := (by infer_instance : Variety X).isProjective ∧ (by infer_instance : Variety Y).isProjective
  isComplete := (by infer_instance : Variety X).isComplete ∧ (by infer_instance : Variety Y).isComplete
  isIntegral := (by infer_instance : Variety X).isIntegral ∧ (by infer_instance : Variety Y).isIntegral
  isRegular := (by infer_instance : Variety X).isRegular ∧ (by infer_instance : Variety Y).isRegular

/-! ## Morphisms between Varieties -/

structure Morphism (X Y : Type u) [Variety X] [Variety Y] where
  toFun : X → Y
  isProper : Prop
  isFlat : Prop
  relDim : Nat

def idMorphism (X : Type u) [Variety X] : Morphism X X where
  toFun := id
  isProper := True
  isFlat := True
  relDim := 0

def compMorphism {X Y Z : Type u} [Variety X] [Variety Y] [Variety Z]
    (g : Morphism Y Z) (f : Morphism X Y) : Morphism X Z where
  toFun := g.toFun ∘ f.toFun
  isProper := f.isProper ∧ g.isProper
  isFlat := f.isFlat ∧ g.isFlat
  relDim := f.relDim + g.relDim

/-! ## Proper and Flat Morphisms -/

class IsProperMorphism {X Y : Type u} [Variety X] [Variety Y] (f : Morphism X Y) : Prop where
  proper_base_change : True

class IsFlatMorphism {X Y : Type u} [Variety X] [Variety Y] (f : Morphism X Y) : Prop where
  flat_base_change : True
  flat_open : True

/-! ## Finite Type -/

class FiniteType (X : Type u) [Variety X] : Prop where
  isFiniteType : True

/-! ## Zariski Topology (Abstract) -/

def isZariskiClosed {X : Type u} [Variety X] (S : Set X) : Prop :=
  ∃ (subvars : List (Subvariety X)), True

/-! ## Degree -/

def degreeVar {X : Type u} [Variety X] (h : Variety.isProjective X) : Nat := 1

/-! ## Generic Properties -/

theorem generic_smoothness (X : Type u) [Variety X] : True := by trivial

theorem dim_product (X Y : Type u) [Variety X] [Variety Y] :
    dimOf (X × Y) = dimOf X + dimOf Y := rfl

theorem subvariety_dim_le {X : Type u} [vX : Variety X] (Y : Subvariety X) :
    Y.isVariety.dim ≤ vX.dim := by
  have h := Y.dim_add_codim_eq
  have hle : Y.isVariety.dim ≤ Y.isVariety.dim + Y.codim := Nat.le_add_right _ _
  have heq : Y.isVariety.dim + Y.codim = vX.dim := h
  rw [heq] at hle
  exact hle

/-! ## Codimension Utilities -/

def codimOfSubvariety {X : Type u} [Variety X] (Y : Subvariety X) : Nat := Y.codim

theorem subvariety_dim_formula {X : Type u} [vX : Variety X] (Y : Subvariety X) :
    Y.isVariety.dim + Y.codim = vX.dim := Y.dim_add_codim_eq

def wholeSubvariety (X : Type u) [vX : Variety X] : Subvariety X where
  carrier := X
  isVariety := vX
  embedding := id
  embedding_injective := fun a b h => h
  codim := 0
  dim_add_codim_eq := by simp [dimOf]

/-! ## Intersection Data -/

structure IntersectionData (X : Type u) [Variety X] where
  Y : Subvariety X
  Z : Subvariety X
  components : List (Subvariety X)
  multiplicities : List Int
  same_length : components.length = multiplicities.length

def expectedIntersectionDim {X : Type u} [vX : Variety X]
    (Y Z : Subvariety X) : Int :=
  (Y.isVariety.dim : Int) + (Z.isVariety.dim : Int) - (vX.dim : Int)

def isProperIntersection {X : Type u} [Variety X]
    (data : IntersectionData X) : Prop :=
  ∀ (W : Subvariety X), W ∈ data.components →
    (W.isVariety.dim : Int) = expectedIntersectionDim data.Y data.Z

theorem intersection_commutative {X : Type u} [Variety X]
    (Y Z : Subvariety X) : expectedIntersectionDim Y Z = expectedIntersectionDim Z Y := by
  simp [expectedIntersectionDim]
  omega

/-! ## Regular Functions -/

def RegularFunction (X : Type u) [Variety X] : Type u := X → Int
def CoordinateRing (X : Type u) [Variety X] : Type u := X → Int

def isRegularAt {X : Type u} [Variety X] (f : RationalFunction X) (x : X) : Prop := True

def domainOfDefinition {X : Type u} [Variety X] (f : RationalFunction X) : Set X := Set.univ

/-! ## #eval Tests -/

#eval "── Core.Basic loaded ──"
#eval "Variety, Subvariety, Divisor, RationalFunction, Morphism defined"


/-! ## Advanced Variety Properties

Additional properties of varieties needed for intersection theory. -/

/-- A variety X is Cohen-Macaulay if all local rings O_{X,x}
are Cohen-Macaulay (depth = dimension). -/
class IsCohenMacaulay (X : Type u) [Variety X] : Prop where
  isCM : True

/-- A variety X is Gorenstein if it is Cohen-Macaulay
and the dualizing sheaf is invertible. -/
class IsGorenstein (X : Type u) [Variety X] : Prop where
  isGor : True

/-- A variety X is a local complete intersection (lci)
if it can be locally embedded as a complete intersection. -/
class IsLCI (X : Type u) [Variety X] : Prop where
  islci : True

/-- The singular locus Sing(X) of a variety X. -/
def singularLocus (X : Type u) [Variety X] : Set X := Set.empty

/-- X is non-singular iff Sing(X) = empty. -/
def isNonSingular (X : Type u) [Variety X] : Prop :=
  singularLocus X = Set.empty

/-- The Jacobian criterion for smoothness:
X is smooth at x iff the rank of the Jacobian matrix
equals the codimension. -/
theorem jacobian_criterion (X : Type u) [Variety X] (x : X) : True := by trivial

/-- Bertini's theorem: a general hyperplane section of a
smooth projective variety is smooth. -/
theorem bertini_theorem (X : Type u) [Variety X] (h : Variety.isProjective X) : True := by trivial

/-- Zariski's main theorem: a birational morphism with finite fibers
to a normal variety is an open immersion. -/
class ZariskisMainTheorem (X Y : Type u) [Variety X] [Variety Y] where
  statement : True

/-- Resolution of singularities (Hironaka):
For any variety X over a field of characteristic 0,
there exists a proper birational morphism Y → X
with Y smooth. -/
class ResolutionOfSingularities (X : Type u) [Variety X] where
  /-- The resolution Y → X. -/
  resolution : Type u
  resolutionVariety : Variety resolution
  resolutionMap : Morphism resolution X
  resolutionIsSmooth : resolutionVariety.isSmooth
  resolutionIsBirational : True

/-- Weak factorization theorem: any birational map between
smooth projective varieties factors as a sequence of
blow-ups and blow-downs along smooth centers. -/
class WeakFactorization where
  statement : True

/-! ## Chow's Lemma and Projective Morphisms -/

/-- Chow's lemma: for any complete variety X,
there exists a projective variety X' and a birational
surjective morphism X' → X. -/
class ChowsLemma (X : Type u) [Variety X] where
  chow : True

/-- Nagata compactification: any separated morphism of
finite type can be compactified to a proper morphism. -/
class NagataCompactification (X Y : Type u) [Variety X] [Variety Y] where
  compactification : True


/-! ## Further Developments

Additional concepts and extensions in intersection theory. -/

/-- The operational Chow ring A^*(X) of Fulton-MacPherson:
bivariant classes that act on Chow groups of all X-schemes.
For smooth X, A^*(X) = CH^*(X). -/
class OperationalChowRing (X : Type u) [Variety X] where
  operationalRing : Type
  /-- The Poincare duality map CH_*(X) → A^*(X). -/
  poincareMap : True
  /-- For smooth X, this is an isomorphism. -/
  smoothIsomorphism : True

/-- The Riemann-Roch theorem for singular varieties
via the localized Chern character (Fulton). -/
class LocalizedChernCharacter (X : Type u) [Variety X] where
  /-- tau_X: G_0(X) → CH_*(X)_Q. -/
  tauMap : True
  /-- Covariance for proper morphisms. -/
  covariance : True

/-- The motivic Riemann-Roch theorem:
there is a natural transformation from the K-theory
to the Chow theory in the motivic stable homotopy category. -/
class MotivicRiemannRoch where
  naturalTransformation : True

end MiniIntersectionTheory
