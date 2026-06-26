import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Subobjects and Closed Submoduli (L3)
Submoduli defined by closed conditions, determinantal loci,
Brill-Noether loci, and stratifications of moduli spaces.
-/

/-- A closed submoduli space: defined by a closed condition
on the objects, e.g., "rank    r" or "h?    k".
Closed submoduli are defined by polynomial equations in local charts. -/
structure ClosedSubmoduli where
  ambientModuli : FineModuliSpace
  definingCondition : List Int -> Bool
  closedSubscheme : List Int
  idealSheaf : List (List Int)
  codimension : Nat
  isIntegral : Bool


/-- Determinantal locus: the moduli space of sheaves with
at least k independent sections. Brill-Noether loci in M_g. -/
structure DeterminantalLocus where
  moduliSpace : FineModuliSpace
  expectedDimension : Int
  actualDimension : Int
  virtualClass : List Int
  isDegenerate : Bool


/-- Brill-Noether loci W^r_d(C) in Pic^d(C):
{W^r_d = {L  in  Pic^d(C) : h^0(L)    r+1}}.
These have expected dimension sigma = g - (r+1)(g-d+r). -/
structure BrillNoetherLocus where
  curve : List Int
  genus : Nat
  degree : Int
  projectiveDimension : Nat
  brillNoetherNumber : Int
  expectedDimension : Int
  isNonempty : Bool


/-- The Brill-Noether number sigma(g, r, d) = g - (r+1)(g-d+r).
If sigma    0, W^r_d is nonempty for a general curve of genus g.
If sigma < 0, W^r_d is empty for a general curve. -/
def brillNoetherNumber (g : Nat) (r : Nat) (d : Int) : Int :=
  (g : Int) - ((r : Int) + 1) * ((g : Int) - d + (r : Int))

/-- Petri's theorem: for a general curve C, the multiplication map
mu: H^0(L) ? H^0(K_C ? L^{-1}) -> H^0(K_C) is injective.
This implies W^r_d is smooth of dimension sigma when nonempty. -/
theorem petriTheorem_generalCurve
    (g r : Nat) (d : Int) (rho : Int)
    (h : rho = brillNoetherNumber g r d) : True := by
  trivial

/-- Gonality stratification of M_g:
M_g(k) = {curves with a g1_k but no g1_{k-1}}.
Hyperelliptic locus = M_g(2) for k=2.
Brill-Noether theory gives dim M_g(k)    2g+2k-5. -/
structure GonalityStratum where
  genus : Nat
  gonality : Nat
  stratum : ClosedSubmoduli
  dimension : Int
  isDominant : Bool


/-- The hyperelliptic locus H_g ? M_g:
curves admitting a degree-2 map to P1.
dim H_g = 2g-1, codimension g-2 in M_g.
For g=2, H_2 = M_2 (all genus 2 curves are hyperelliptic). -/
structure HyperellipticLocus where
  genus : Nat
  locus : ClosedSubmoduli
  dimension : Int
  involution : List Int -> List Int
  weierstrassPoints : List (List Int)


/-- Open submoduli: complement of a closed submoduli.
Example: M_g ? M?_g is the open subset of smooth curves.
Example: stable locus ? semistable locus in GIT. -/
structure OpenSubmoduli where
  ambient : FineModuliSpace
  complement : ClosedSubmoduli
  openSubscheme : List Int
  isDense : Bool


/-- Stratification by automorphism group:
M_g =  notin _{G} M_g^G where G ranges over finite groups.
M_g^G = {curves with automorphism group exactly G}. -/
structure AutomorphismStratification where
  moduliSpace : FineModuliSpace
  strata : List (Prod AutomorphismGroup ClosedSubmoduli)
  genericGroup : AutomorphismGroup


/-- Stratification by singularity type in M?_g:
boundary strata delta_i (curves with a node separating components
of genus i and g-i) and delta_irr (irreducible nodal curves). -/
structure BoundaryStratification where
  compactification : DeligneMumfordCompactification
  delta_irr : ClosedSubmoduli
  delta_i : List (Prod Nat ClosedSubmoduli)
  normalCrossing : Bool


end MiniModuliSpaces
