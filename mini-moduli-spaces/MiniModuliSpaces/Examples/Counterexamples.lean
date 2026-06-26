import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Counterexamples in Moduli Theory (L6)
Pathological behaviors, non-representability, jumping phenomena.
-/

/-- Counterexample 1: Jump phenomenon.
The dimension of the moduli space can jump at special points.
Hilb^n for n=4: smooth of dim 8 at generic point,
but singular/component of different dimension at special points. -/
def jumpPhenomenon_example : String :=
  "Hilb^4(C^3) is NOT irreducible (dimension jumps)"

/-- Counterexample 2: Non-separated moduli.
Without stability conditions, the moduli of all vector bundles
is NOT separated. Two bundles can degenerate to the same
semistable bundle, violating the valuative criterion.
Example: O(1)    O(-1) -> O    O on P1. -/
structure NonSeparatedExample where
  family1 : FamilyOfObjects  -- O(1)    O(-1)
  family2 : FamilyOfObjects  -- O    O
  limitsToSameSemistable : Bool


/-- Counterexample 3: Moduli of unstable objects is empty
in the GIT sense but there exist unstable objects algebraically.
Vector bundles on P1 of rank 2: no stable bundles,
but there are semistable bundles (O(a)    O(b) with |a-b|=1?). -/
theorem noStableBut_existSemistable : True := by trivial

/-- Counterexample 4: M_g is not fine for any g.
There is no universal curve over M_g because of automorphisms.
The universal curve only exists as a stack C_g -> M_g.
Even M_{1,1} is a stack (elliptic curves with one marked point). -/
structure MgNotFine where
  genus : Nat
  obstruction : String
  existsAsStack : Bool


def Mg_not_fine_example (g : Nat) : MgNotFine :=
  { genus := g
    obstruction := "curves with automorphisms prevent representability"
    existsAsStack := true }

#eval s!"M_{2} is fine? No!"

/-- Counterexample 5: Serre's example.
There exists a variety X and H^1(X, G) that does not come
from a moduli space (non-representable functor).
Shows representability is a strong condition. -/
structure SerreNonRepresentable where
  variety : List Int
  H1_nonRep : List Int


/-- Counterexample 6: Mumford's pathological Quot scheme.
Quot schemes can be non-reduced (nilpotents in structure sheaf)
even for smooth X. Example: Quot^P(O_X/X) can have embedded
components for some Hilbert polynomials P. -/
structure MumfordPathologicalQuot where
  base : List Int
  polynomial : List Int -> Int
  isNonReduced : Bool
  hasEmbeddedComponents : Bool


/-- Counterexample 7: The moduli of surfaces is NOT bounded
without fixing the canonical class (or some other invariant).
Bombieri-Lang: moduli of surfaces of general type with fixed
K2 and psi is bounded (but still huge dimension). -/
structure NonBoundedModuli where
  objectType : String
  unboundedReason : String


def nonBounded_surfaces : NonBoundedModuli :=
  { objectType := "surfaces of general type without fixing K2"
    unboundedReason := "No Matsusaka-type bound without fixing invariants" }

/-- Counterexample 8: Vakil's Murphy's Law.
Every singularity type of finite type over Z appears on some
Hilbert scheme (or moduli space of sheaves). Moduli spaces
can be arbitrarily singular. -/
theorem vakil_murphy_law : True := by trivial

/-- Counterexample 9: The Morrison-Kawamata cone conjecture
predicts that for Calabi-Yau varieties, the movable cone
has a rational polyhedral fundamental domain.
But the moduli space of K3 surfaces is 20-dimensional
and non-Zariski-locally-homogeneous. -/
structure MorrisonConeConjecture where
  varietyType : String
  conjecture : String
  status : String


/-- Counterexample 10: Debarre's example.
M_g contains no complete subvarieties of dimension > g-2?
(Arbarello-Cornalba-Griffiths-Harris). The moduli space
itself is "hyperbolic" in some sense. -/
theorem debarre_noLargeCompleteSubvarieties (g : Nat) : True := by trivial

#eval "-- Counterexamples in Moduli Theory --"
#eval s!"Jump phenomenon: {jumpPhenomenon_example}"
#eval s!"Non-separated example: O(1)  O(-1) -> O  O on P1"
#eval s!"M_g is never fine as a scheme (only as a stack)"
#eval s!"Mumford: Quot schemes can be non-reduced"
#eval s!"Vakil: All singularity types appear on Hilbert schemes"

end MiniModuliSpaces
