import MiniObjectKernel.Core.Basic

namespace MiniModuliSpaces

/-
# Core Definitions for Moduli Spaces (L1-L2)
Moduli theory: classification of algebro-geometric objects up to isomorphism.
The fundamental structures for formalizing moduli problems in algebraic geometry.

Reference: Mumford-Fogarty-Kirwan "Geometric Invariant Theory",
           Deligne-Mumford "Irreducibility of M_g",
           Grothendieck "Techniques de construction en geometrie analytique"
-/

--------------------------------------------------------------
-- L1: Families and Parameter Spaces
--------------------------------------------------------------

/-- A family of objects parameterized by a base scheme S.
Objects are fiberwise data: for each point s  in  S, we get an object X_s.
The family is flat if all fibers have the same Hilbert polynomial.
Proper if the structural morphism is proper. -/
structure FamilyOfObjects where
  base : List Int
  fibers : List (List Int)
  structuralMap : List (List Int)
  hilbertPolynomial : List Int -> Int
  isFlat : Bool
  isProper : Bool
  isSmooth : Bool
  dimension : Nat
deriving Inhabited

/-- A moduli problem: classify objects of a fixed type up to isomorphism.
Example: classify smooth projective curves of genus g.
Example: classify vector bundles of rank r on a fixed variety X. -/
structure ModuliProblem where
  name : String
  description : String
  objects : FamilyOfObjects
  equivalenceRelation : List Int -> List Int -> Bool
  automorphismGroup : List Int -> List (List Int)
  deformationFunctor : List Int -> List (List Int)
  isAlgebraic : Bool
  isSeparated : Bool


/-- The moduli functor: F : (Sch/S)^op -> Set
F(T) = {flat families over T with fibers of given type} / ~
This is a contravariant functor from schemes to sets. -/
structure ModuliFunctor where
  onObjects : List Int -> List (List Int)
  onMorphisms : List Int -> (List (List Int) -> List (List Int))
  preservesPullbacks : Bool
  isSheaf : Bool
  isLimitPreserving : Bool


/-- A fine moduli space M represents the moduli functor F.
There exists a universal family U -> M such that for any family X -> S,
there is a unique morphism f: S -> M with X ? f*U. -/
structure FineModuliSpace where
  underlyingScheme : List Int
  universalFamily : FamilyOfObjects
  moduliFunctor : ModuliFunctor
  isRepresentable : Bool
  isUniversal : Bool
  isSmooth : Bool
  dimension : Nat
  tangentSpaceDimension : Nat


/-- A coarse moduli space M corepresents the moduli functor.
There is a natural transformation eta: F -> Hom(-, M) such that:
(1) eta(Spec k): F(Spec k) -> M(k) is a bijection for algebraically closed k
(2) For any N and nu: F -> Hom(-, N), ?! f: M -> N with nu = f_*    eta -/
structure CoarseModuliSpace where
  underlyingScheme : List Int
  moduliFunctor : ModuliFunctor
  naturalTransformation : List (List Int) -> List (List Int)
  isInitialAmongCorepresentations : Bool
  bijectionOnGeometricPoints : Bool
  isSeparated : Bool
  isProper : Bool


/-- A morphism from a fine moduli space to a coarse one.
Every fine moduli space induces a coarse moduli space
via the natural transformation from representability. -/
structure FineToCoarseMap where
  fine : FineModuliSpace
  coarse : CoarseModuliSpace
  comparisonMap : List Int -> List Int
  isDominant : Bool
  isBirational : Bool
  exceptionalLocus : List Int


--------------------------------------------------------------
-- L1: Stability Conditions (GIT)
--------------------------------------------------------------

/-- A stability condition for objects in a moduli problem.
An object is stable if its automorphism group is finite
and it satisfies a numerical criterion (Hilbert-Mumford). -/
structure StabilityCondition where
  condition : List Int -> Bool
  semistableCondition : List Int -> Bool
  polystableCondition : List Int -> Bool
  hilbertMumfordWeight : List Int -> List Int -> Int
  isGITSemistable : Bool


/-- A GIT quotient: the moduli space of semistable objects.
M = X^ss // G, where X^ss are semistable points
and // denotes the GIT quotient by the group G. -/
structure GITQuotient where
  totalSpace : List Int
  groupAction : List Int -> List Int -> List Int
  semistableLocus : List Int
  stableLocus : List Int
  quotientMap : List Int -> List Int
  isCategorical : Bool


--------------------------------------------------------------
-- L2: Core Concepts    Representability
--------------------------------------------------------------

/-- Representability criterion: a moduli functor F is representable
by a fine moduli space M if and only if there exists a universal family. -/
def isRepresentableBy (F : ModuliFunctor) (M : FineModuliSpace) : Bool :=
  M.isRepresentable && true

/-- A universal family U over a moduli space M:
for any family X -> S, there exists a unique morphism
chi: S -> M such that X ? chi*U. -/
structure UniversalFamily where
  moduliSpace : FineModuliSpace
  totalSpace : List Int
  projection : List Int -> List Int
  isFlat : Bool
  isProper : Bool
  fibersAreClassified : Bool


/-- The Yoneda embedding: the functor h_M : Sch^op -> Set
given by h_M(S) = Hom(S, M). Representability means F ? h_M. -/
def yonedaEmbedding (M : List Int) (S : List Int) : List (List Int) :=
  [[M.length, S.length]]

/-- A natural transformation between moduli functors.
eta: F -> G assigns to each scheme S a map eta_S: F(S) -> G(S)
compatible with pullbacks. -/
structure NaturalTransformation where
  source : ModuliFunctor
  target : ModuliFunctor
  component : List Int -> (List (List Int) -> List (List Int))
  naturalitySquare : Bool
  isIsomorphism : Bool


/-- An isomorphism of moduli functors: a natural transformation
with an inverse. Represents the notion of "same moduli problem." -/
structure ModuliIsomorphism where
  forward : NaturalTransformation
  inverse : NaturalTransformation
  leftUnit : Bool
  rightUnit : Bool


/-- Fiber product of families: given two families X->S and Y->T
and a morphism f: S->T, the fiber product X   _T Y. -/
def fiberProduct (X : FamilyOfObjects) (Y : FamilyOfObjects)
    (_f : List Int -> List Int) : FamilyOfObjects :=
  { base := X.base
    fibers := X.fibers ++ Y.fibers
    structuralMap := X.structuralMap
    hilbertPolynomial := X.hilbertPolynomial
    isFlat := X.isFlat && Y.isFlat
    isProper := X.isProper && Y.isProper
    isSmooth := X.isSmooth && Y.isSmooth
    dimension := X.dimension + Y.dimension }

/-- Base change: pullback of a family X->S along g: T->S.
The fundamental operation for moduli functors. -/
def baseChange (X : FamilyOfObjects) (_g : List Int -> List Int)
    (T : List Int) : FamilyOfObjects :=
  { base := T
    fibers := X.fibers
    structuralMap := X.structuralMap
    hilbertPolynomial := X.hilbertPolynomial
    isFlat := X.isFlat
    isProper := X.isProper
    isSmooth := X.isSmooth
    dimension := X.dimension }

--------------------------------------------------------------
-- L2: Deformation Theory
--------------------------------------------------------------

/-- A first-order deformation of an object X.
Given by an element of Ext^1(T_X, O_X), the tangent space
to the moduli space at the point [X]. -/
structure FirstOrderDeformation where
  object : List Int
  tangentVector : List Int
  obstructionSpace : List Int
  isUnobstructed : Bool
  kuranishiMap : List Int -> List Int


/-- The deformation functor Def_X: Art -> Set
mapping an Artin local ring A to the set of flat deformations
of X over Spec A. -/
structure DeformationFunctor where
  onArtinRing : List Int -> List (List Int)
  tangentSpace : List Int
  obstructionSpace : List Int
  isProrepresentable : Bool
  hullDimension : Nat


/-- Schlessinger's criteria for prorepresentability of a
deformation functor. Four conditions (H1)-(H4) that characterize
when a deformation functor is prorepresentable. -/
structure SchlessingerCriteria where
  functor : DeformationFunctor
  H1_surjectivity : Bool
  H2_finiteness : Bool
  H3_gluing : Bool
  H4_tangentAndAutomorphism : Bool


/-- The tangent space to a moduli space at a point [X]:
T_[X] M = Ext^1(X, X) = first-order deformation space.
The obstruction space is Ext^2(X, X). -/
def tangentSpaceDimension (M : FineModuliSpace) (_point : List Int) : Nat :=
  M.tangentSpaceDimension

/-- The expected dimension of a moduli space:
psi = h^0(End(X)) - h^1(End(X)) + h^2(End(X))
= ext^1(X,X) - ext^0(X,X) + ext^2(X,X) (roughly) -/
def expectedDimension (h0 : Int) (h1 : Int) (h2 : Int) : Int :=
  h1 - h0 + h2

/-- Virtual dimension: when the moduli space is not of expected
dimension, the virtual dimension corrects for obstructions. -/
def virtualDimension (expected : Int) (excessObstruction : Int) : Int :=
  expected - excessObstruction

end MiniModuliSpaces
