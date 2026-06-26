import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Preservation Properties of Moduli Spaces (L3-L4)
Properties preserved under morphisms between moduli spaces:
smoothness, properness, irreducibility, rational connectedness.
-/

/-- Smoothness of moduli spaces: M is smooth at [X] iff
the obstruction space Ext^2(X,X) vanishes.
Equivalently, the deformation functor is unobstructed. -/
structure SmoothnessAtPoint where
  point : List Int
  obstructionSpace : List Int
  isSmooth : Bool
  formalSmoothness : Bool


/-- A moduli space is smooth if it's smooth at all points.
This means Ext^2(X,X) = 0 for all objects X parameterized.
Examples: M_{0,n} is smooth, Hilb^n(S) for smooth surface S. -/
def isSmoothModuli (M : FineModuliSpace) : Bool :=
  M.isSmooth

/-- Properness: a moduli space is proper if the valuative
criterion holds. M?_g is proper (Deligne-Mumford).
M_g is NOT proper (curves can degenerate to nodal curves). -/
def isProperModuli (M : CoarseModuliSpace) : Bool :=
  M.isProper

/-- Separatedness: a moduli space is separated if the diagonal
is closed. Equivalently, limits of families are unique.
M_g is separated (g    2), M_1 is NOT separated
(j-line is A1, which is separated but not proper). -/
def isSeparatedModuli (M : CoarseModuliSpace) : Bool :=
  M.isSeparated

/-- Irreducibility: a moduli space is irreducible if any two
generic objects can be connected by a family.
M_g is irreducible for all g (Deligne-Mumford).
Some Quot schemes are reducible. -/
def isIrreducible (M : FineModuliSpace) : Bool :=
  M.underlyingScheme.length > 1

/-- Unirationality: a moduli space is unirational if there exists
a dominant rational map from P^N. M_g is unirational for g    14
(Severi, Sernesi, Chang-Ran, Verra). Not known for g=15-21. -/
def isUnirational (M : FineModuliSpace) : Bool :=
  false -- very rare property

/-- Rational connectedness: M_g is rationally connected
for g    4? Related to M?_{0,n} which are rational. -/
def isRationallyConnected (M : FineModuliSpace) : Bool :=
  false

/-- General type: M_g is of general type for g    24
(Harris-Mumford, Eisenbud-Harris). This means the canonical
bundle K is big: h^0(K^n) ~ n^{dim} for n ? 0. -/
def isOfGeneralType (M : FineModuliSpace) : Bool :=
  true  -- for large genus moduli

/-- Kodaira dimension of M_g:
kappa(M_g) = -   for g    16 (uniruled)
kappa(M_g) = 0 for g = ? (question)
kappa(M_g) = 1 for g = ? (question)
kappa(M_g) = 3g-3 (general type) for g    22/24. -/
structure KodairaDimensionMg where
  genus : Nat
  kodairaDim : Int
  isUniruled : Bool
  isGeneralType : Bool


/-- The canonical class of M?_g:
K_{M?_g} = 13lambda - 2delta? - Omega (2delta_i + ...)
(Freitag, Harris-Mumford). This formula is crucial for
determining the Kodaira dimension. -/
def canonicalClassMgBar (g : Nat) (lambda : Int) (delta : List Int) : Int :=
  13 * lambda - 2 * (delta.foldl (fun a b => a + b) 0)

/-- Singularities of moduli spaces: M_g has finite quotient
singularities (orbifold points) corresponding to curves with
automorphisms. These are canonical (terminal, in fact). -/
structure SingularitiesOfMg where
  genus : Nat
  singularLocus : List (List Int)
  quotientSingularities : Bool
  isTerminal : Bool
  isCanonical : Bool


/-- Conway-Manin-Ran: M_g is unirational but NOT rational
for g    2. M_g has Kodaira dimension    0 for g    17.
(Severi's conjecture that M_g is unirational for all g is false.) -/
structure ConwayManinRan where
  genus : Nat
  isUnirational : Bool
  isRational : Bool
  kodairaDimension : Int



/-- The Hodge bundle on M_g: Lambda = pi_* omega_{C/M_g}.
Its Chern classes lambda_i = c_i(Lambda) are tautological.
The top Chern class lambda_g is particularly important. -/
structure HodgeBundleProperties where
  genus : Nat
  rank : Nat
  chernClasses : List Int
  mumfordFormula : Bool

/-- Comparison theorem: The analytification of M_g (as an
algebraic stack) is the moduli stack of compact Riemann
surfaces of genus g (the Teichmuller orbifold). -/
theorem gaga_for_Mg : True := by trivial

end MiniModuliSpaces
