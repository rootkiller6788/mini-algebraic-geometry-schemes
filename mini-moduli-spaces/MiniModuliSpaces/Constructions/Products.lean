import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Constructions: Products of Moduli Spaces (L3)
Product moduli spaces, fiber products, and their universal properties.
-/

/-- Product of two moduli problems P    Q:
classifies pairs (X, Y) where X is an object of P and Y of Q.
The moduli functor is F_{P  Q}(S) = F_P(S)    F_Q(S). -/
structure ProductModuliProblem where
  first : ModuliProblem
  second : ModuliProblem
  productSpace : ModuliProblem
  projection1 : ModuliProblemMorphism
  projection2 : ModuliProblemMorphism
  universalProperty : Bool


/-- Fiber product of moduli spaces: given f: X -> Z and g: Y -> Z,
X   _Z Y classifies pairs (x, y) with f(x) = g(z)(y).
For moduli, this corresponds to matching invariants. -/
structure FiberProductModuli where
  X : FineModuliSpace
  Y : FineModuliSpace
  Z : FineModuliSpace
  f : FineModuliMorphism
  g : FineModuliMorphism
  fiberProduct : FineModuliSpace
  isUniversal : Bool


/-- Product of families: given X?/S and X?/S over the same base,
the product family X?   _S X? classifies pairs of fibers. -/
def productFamily (X Y : FamilyOfObjects) : FamilyOfObjects :=
  { base := X.base
    fibers := List.zipWith (fun a b => a ++ b) X.fibers Y.fibers
    structuralMap := X.structuralMap
    hilbertPolynomial := fun n => X.hilbertPolynomial n + Y.hilbertPolynomial n
    isFlat := X.isFlat && Y.isFlat
    isProper := X.isProper && Y.isProper
    isSmooth := X.isSmooth && Y.isSmooth
    dimension := X.dimension + Y.dimension }

/-- The moduli space M_{g,n} of n-pointed curves:
M_{g,n} = M_g   _{M_g} ... fiber product of universal curves.
dim M_{g,n} = 3g - 3 + n. -/
structure PointedCurveModuli where
  genus : Nat
  markedPoints : Nat
  moduliSpace : FineModuliSpace
  universalCurve : FamilyOfObjects
  sections : List (List Int)
  dimension : Nat


/-- Dimension formula for M_{g,n}:
dim M_{g,n} = 3g - 3 + n for 2g - 2 + n > 0 (stability). -/
def MgnDimension (g n : Nat) : Int :=
  if 2*g + n > 3 then 3 * (g : Int) - 3 + (n : Int) else -1

/-- The forgetful map rho: M_{g,n+1} -> M_{g,n} forgetting the last
marked point. Its fiber at [(C, p?,...,p?)] is C \ {p?,...,p?}. -/
structure ForgetfulMapMgn where
  source : PointedCurveModuli
  target : PointedCurveModuli
  forgetIndex : Nat
  fiberIsCurveMinusPoints : Bool
  isFlat : Bool


/-- Knudsen's stabilization: when 2g-2+n    0, the moduli space
M_{g,n} is not fine, but there is a stabilization map to
M_{g',n'} for stable (g',n'). -/
structure KnudsenStabilization where
  unstable : PointedCurveModuli
  stable : PointedCurveModuli
  stabilizationMap : FineModuliMorphism
  contractsUnstableComponents : Bool


/-- Product decomposition for M?_{0,n}:
M?_{0,n} is a smooth projective variety birational to (P1)^{n-3}.
Its boundary divisors correspond to partitions of {1,...,n}. -/
structure M0nProductDecomposition where
  n : Nat
  m0n : FineModuliSpace
  birationalModel : List Int
  boundaryDivisors : List (List Int)


end MiniModuliSpaces
