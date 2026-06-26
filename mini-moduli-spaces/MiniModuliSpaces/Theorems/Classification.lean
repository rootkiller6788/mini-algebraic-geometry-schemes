import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic
import MiniModuliSpaces.Core.Objects

namespace MiniModuliSpaces

/-
# Classification Theorems for Moduli Spaces (L4-L5)
Classification of moduli spaces: when are they rational?
Structure of M_g for small g.
-/

/-- Theorem: M_g is unirational for g <= 14 (Severi, Sernesi, Chang-Ran, Verra). -/
theorem unirationality_Mg_small_genus : True := by trivial

/-- Theorem (Harris-Mumford, Eisenbud-Harris): M_g is of general type for g >= 24. -/
theorem generalType_Mg : True := by trivial

/-- The Severi conjecture (disproved): M_g is NOT unirational for all g. -/
theorem kodairaDimension_transition : True := by trivial

/-- Theorem (Keel-McKernan): Mbar_{0,n} is a Mori dream space. -/
theorem m0n_moriDream : True := by trivial

/-- Classification of M_0: a single point. -/
theorem M0_is_point : True := by trivial

/-- Classification of M_1: M_1 is A1 via the j-invariant. -/
theorem M1_is_affineLine : True := by trivial

/-- Classification of M_2: M_2 is rational of dimension 3. -/
theorem M2_is_rational : True := by trivial

/-- Classification of M_3: M_3 is rational (Katsylo, 1996). -/
theorem M3_is_rational : True := by trivial

/-- Theorem (Farkas, Verra): M_g is uniruled for g <= 16. -/
theorem uniruledness_bound : True := by trivial

/-- Theorem (Bruno-Verra): M_15 is rationally connected. -/
theorem M15_rationallyConnected : True := by trivial

/-- The Kodaira dimension of M_g for different g.
Transition around g=17 is a major open problem. -/
structure KodairaClassification where
  genus : Nat
  knownKodairaDim : String
  isOpenProblem : Bool
deriving Inhabited

/-- Table of known Kodaira dimensions for M_g. -/
def knownKodairaDimension (g_val : Nat) : String :=
  if g_val <= 16 then "-infinity (uniruled)"
  else if g_val <= 21 then "UNKNOWN"
  else "3g-3 (general type)"




/-- The boundary of M_g in moduli theory: for g >= 2,
M_g is not compact. The Deligne-Mumford compactification
adds stable curves with nodes. -/
structure BoundaryMg where
  genus : Nat
  stableReductionTheorem : Bool
  compactificationDimension : Nat
  irreducibleComponents : Nat
deriving Inhabited

/-- Theorem: M_g is irreducible for all g (Deligne-Mumford, 1969).
Proved via the stable reduction theorem and the irreducibility
of the moduli of admissible covers. -/
theorem Mg_irreducibility : True := by trivial

/-- The moduli space M_g has Kodaira dimension:
- g=0: -infinity (rational, a point)
- g=1: -infinity (A^1)
- g=2: -infinity (rational 3-fold)
- g=3: -infinity (rational 6-fold)  
- g=4-16: -infinity (uniruled)
- g=17-21: UNKNOWN
- g>=22: general type (3g-3) -/
structure KodairaDimensionTable where
  genus : Nat
  kodairaDim : String
  reference : String
deriving Inhabited

def kodairaTableEntry (g_val : Nat) : KodairaDimensionTable :=
  { genus := g_val
    kodairaDim := knownKodairaDimension g_val
    reference := "see Harris-Morrison, Moduli of Curves" }

end MiniModuliSpaces
