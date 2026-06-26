import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Morphisms of Moduli Spaces (L2-L3)
Natural transformations between moduli functors,
morphisms between moduli spaces, forgetful and structure morphisms.
-/

--------------------------------------------------------------
-- L2: Morphisms of Moduli Problems
--------------------------------------------------------------

/-- A morphism of moduli problems f: P -> Q assigns to each
family in P a family in Q, compatible with base change.
This induces a natural transformation F_P -> F_Q of functors. -/
structure ModuliProblemMorphism where
  source : ModuliProblem
  target : ModuliProblem
  mapOnObjects : List Int -> List Int
  mapOnFamilies : FamilyOfObjects -> FamilyOfObjects
  commutesWithBaseChange : Bool
  preservesStability : Bool


/-- Forgetful morphism: forget some structure.
Example: M_{g,1} -> M_g forgetting the marked point.
Example: moduli of bundles with fixed det -> moduli of all bundles. -/
structure ForgetfulMorphism where
  morphism : ModuliProblemMorphism
  forgottenStructure : String
  fiberDimension : Nat
  isSmooth : Bool


/-- Structure morphism: add structure to objects.
Example: moduli of curves -> moduli of polarized varieties
via the canonical embedding. -/
structure StructureMorphism where
  morphism : ModuliProblemMorphism
  addedStructure : String
  isClosedImmersion : Bool
  isEmbedding : Bool


/-- Inclusion of a substack/submoduli:
given an open/closed condition on objects, the submoduli
space of objects satisfying that condition. -/
structure SubmoduliInclusion where
  total : ModuliProblem
  submoduli : ModuliProblem
  inclusionCondition : List Int -> Bool
  inclusionMap : ModuliProblemMorphism
  isOpen : Bool
  isClosed : Bool


--------------------------------------------------------------
-- L2: Natural Transformations
--------------------------------------------------------------

/-- A natural transformation !=: F -> G between moduli functors
assigns to each base S a map !=_S: F(S) -> G(S) such that
for every f: T -> S, the diagram commutes:
F(S) -> G(S)       F(T) -> G(T) -/
structure ModuliNaturalTransformation where
  source : ModuliFunctor
  target : ModuliFunctor
  components : List Int -> List (List Int) -> List (List Int)
  naturalitySquares : List (List Int -> Bool)
  isCartesian : Bool


/-- Vertical composition of natural transformations:
(b    !=)_S = b_S    !=_S. -/
def verticalComposition
    (a b : ModuliNaturalTransformation)
    (h : a.target = b.source) : ModuliNaturalTransformation :=
  { source := a.source
    target := b.target
    components := fun S Fs => b.components S (a.components S Fs)
    naturalitySquares := []
    isCartesian := a.isCartesian && b.isCartesian }

/-- Horizontal composition: given a: F -> G and b: H -> K,
b ? !=: F    H -> G    K (Godement product). -/
def horizontalComposition
    (a b : ModuliNaturalTransformation) : ModuliNaturalTransformation :=
  { source := a.source
    target := b.target
    components := fun S Fs => b.components S (a.components S Fs)
    naturalitySquares := []
    isCartesian := a.isCartesian && b.isCartesian }

/-- A natural transformation is Cartesian if all naturality
squares are pullback squares. Important for stacks. -/
def isCartesian (a : ModuliNaturalTransformation) : Bool :=
  a.isCartesian

--------------------------------------------------------------
-- L2: Morphisms of Fine Moduli Spaces
--------------------------------------------------------------

/-- A morphism between fine moduli spaces f: M -> N induces
a natural transformation h_f: h_M -> h_N of representable functors.
By Yoneda, this is equivalent to a scheme morphism. -/
structure FineModuliMorphism where
  source : FineModuliSpace
  target : FineModuliSpace
  underlyingMap : List Int -> List Int
  pullbackOfUniversal : FamilyOfObjects
  isEtale : Bool
  isSmooth : Bool
  relativeDimension : Int


/-- The pullback of the universal family: given f: M -> N,
the universal family over M is the pullback of the
universal family over N along f. -/
def universalFamilyPullback
    (f : FineModuliMorphism) : FamilyOfObjects :=
  baseChange f.target.universalFamily f.underlyingMap f.source.underlyingScheme

/-- Composition of fine moduli morphisms:
M -> N -> P gives M -> P. -/
def fineModuliMorphismCompose
    (f : FineModuliMorphism) (g : FineModuliMorphism)
    (h : f.target = g.source) : FineModuliMorphism :=
  { source := f.source
    target := g.target
    underlyingMap := fun x => g.underlyingMap (f.underlyingMap x)
    pullbackOfUniversal := baseChange g.target.universalFamily
      (fun x => g.underlyingMap (f.underlyingMap x)) f.source.underlyingScheme
    isEtale := f.isEtale && g.isEtale
    isSmooth := f.isSmooth && g.isSmooth
    relativeDimension := f.relativeDimension + g.relativeDimension }

--------------------------------------------------------------
-- L2: Morphisms of Coarse Moduli Spaces
--------------------------------------------------------------

/-- A morphism between coarse moduli spaces is a morphism
of schemes compatible with the natural transformations. -/
structure CoarseModuliMorphism where
  source : CoarseModuliSpace
  target : CoarseModuliSpace
  underlyingMap : List Int -> List Int
  commutesWithNaturalTransformation : Bool
  isProper : Bool


/-- From a fine moduli morphism, we obtain a coarse moduli morphism
via the natural fine-to-coarse comparison maps. -/
def fineToCoarseMorphism
    (f : FineModuliMorphism)
    (Fsource : FineToCoarseMap) (Ftarget : FineToCoarseMap)
    (h_src : Fsource.fine = f.source) (h_tgt : Ftarget.fine = f.target) :
    CoarseModuliMorphism :=
  { source := Fsource.coarse
    target := Ftarget.coarse
    underlyingMap := f.underlyingMap
    commutesWithNaturalTransformation := true
    isProper := true }

--------------------------------------------------------------
-- L3: Representable Morphisms
--------------------------------------------------------------

/-- A morphism of moduli functors f: F -> G is representable if
for every scheme S and map S -> G, the fiber product F   _G S
is representable by a scheme. -/
structure RepresentableMorphism where
  source : ModuliFunctor
  target : ModuliFunctor
  morphism : ModuliNaturalTransformation
  fiberProductsAreSchemes : Bool
  isRepresentable : Bool


/-- A moduli stack is an fppf stack M with representable diagonal
Delta: M -> M    M. This is the algebraic stack condition. -/
structure ModuliStack where
  functor : ModuliFunctor
  isStack : Bool
  diagonalIsRepresentable : Bool
  hasSmoothAtlas : Bool


/-- The diagonal morphism Delta: M -> M   _S M is representable.
For moduli of curves, Delta parameterizes isomorphisms between curves.
For M_g (g  2), Delta is finite (curves have finite automorphism groups). -/
structure DiagonalMorphism where
  stack : ModuliStack
  map : List Int -> List Int -> List Int
  isRepresentable : Bool
  isFinite : Bool
  isUnramified : Bool


end MiniModuliSpaces
