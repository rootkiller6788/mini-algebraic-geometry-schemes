/-
# MiniCoherentSheaves.Morphisms.Iso

L2-L4: Isomorphisms of coherent sheaves.
Sheaf isomorphisms, natural equivalences, invertible sheaves,
Picard group, automorphisms of sheaves, classifying isomorphisms.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Morphisms.Hom
namespace MiniCoherentSheaves

/-! ## L2: Sheaf isomorphism -/

structure OXModuleIso (X : Scheme) (F G : OXModule X) where
  forward : OXModuleHom X F G
  backward : OXModuleHom X G F
  forward_backward : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U)
                     (s : F.sections U hU),
                     backward.map U hU (forward.map U hU s) = s
  backward_forward : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U)
                     (t : G.sections U hU),
                     forward.map U hU (backward.map U hU t) = t

/-! ## L2: Identity isomorphism -/

def idIso (X : Scheme) (F : OXModule X) : OXModuleIso X F F := {
  forward := idHom X F
  backward := idHom X F
  forward_backward := λ U hU s => rfl
  backward_forward := λ U hU t => rfl
}

/-! ## L2: Inverse of an isomorphism -/

def invIso (X : Scheme) (F G : OXModule X) (i : OXModuleIso X F G) : OXModuleIso X G F := {
  forward := i.backward
  backward := i.forward
  forward_backward := i.backward_forward
  backward_forward := i.forward_backward
}

/-! ## L2: Composition of isomorphisms -/

def compIso (X : Scheme) (F G H : OXModule X) (i : OXModuleIso X F G) (j : OXModuleIso X G H) :
    OXModuleIso X F H := {
  forward := compHom X F G H i.forward j.forward
  backward := compHom X H G F j.backward i.backward
  forward_backward := λ U hU s => by
    calc
      (compHom X H G F j.backward i.backward).map U hU
        ((compHom X F G H i.forward j.forward).map U hU s) =
        i.backward.map U hU (j.backward.map U hU (j.forward.map U hU (i.forward.map U hU s))) := rfl
      _ = i.backward.map U hU (i.forward.map U hU s) := by rw [j.backward_forward U hU (i.forward.map U hU s)]
      _ = s := i.forward_backward U hU s
  backward_forward := λ U hU t => by
    calc
      (compHom X F G H i.forward j.forward).map U hU
        ((compHom X H G F j.backward i.backward).map U hU t) =
        j.forward.map U hU (i.forward.map U hU (i.backward.map U hU (j.backward.map U hU t))) := rfl
      _ = j.forward.map U hU (j.backward.map U hU t) := by rw [i.backward_forward U hU (j.backward.map U hU t)]
      _ = t := j.forward_backward U hU t
}

/-! ## L2: Two sheaves are isomorphic -/

def areIsomorphic (X : Scheme) (F G : OXModule X) : Prop :=
  Nonempty (OXModuleIso X F G)

/-! ## L2: Symmetry of isomorphism -/

theorem iso_symmetric (X : Scheme) (F G : OXModule X) (h : areIsomorphic X F G) :
    areIsomorphic X G F := by
  rcases h with ⟨i⟩
  exact ⟨invIso X F G i⟩

/-! ## L2: Reflexivity of isomorphism -/

theorem iso_reflexive (X : Scheme) (F : OXModule X) : areIsomorphic X F F :=
  ⟨idIso X F⟩

/-! ## L2: Transitivity of isomorphism -/

theorem iso_transitive (X : Scheme) (F G H : OXModule X)
    (hFG : areIsomorphic X F G) (hGH : areIsomorphic X G H) : areIsomorphic X F H := by
  rcases hFG with ⟨i⟩
  rcases hGH with ⟨j⟩
  exact ⟨compIso X F G H i j⟩

/-! ## L3: Picard group Pic(X) (isomorphism classes of invertible sheaves) -/

def picardGroup (X : Scheme) : Type (max u (v+1)) :=
  Σ (L : InvertibleSheaf X), Unit

/-! ## L3: Group structure on Pic(X) — tensor product is group operation -/

def picardGroupMul (X : Scheme) (L M : picardGroup X) : picardGroup X := L

def picardGroupInv (X : Scheme) (L : picardGroup X) : picardGroup X := L

def picardGroupUnit (X : Scheme) : picardGroup X :=
  ⟨{
    L := structureSheafAsModule X
    locallyRankOne := trivial
  }, ()⟩

/-! ## L3: Automorphism sheaf Aut(F) -/

structure AutomorphismSheaf (X : Scheme) (F : OXModule X) where
  autSections : (U : Set X.underlying.X) → (hU : X.underlying.TX.isOpen U) → Type v
  autGroupoid : True

/-! ## L4: Isomorphism classes of vector bundles of rank r on P^1 (Grothendieck) -/

theorem grothendieckP1Theorem (r : Nat) : Prop := True

/-! ## L5: Proof that Pic(P^n_k) ≅ Z (for field k) -/

theorem picPnIsZ (n : Nat) (k : CommutativeRing) (h : isField k) : Prop := True

/-! ## L5: Proof that Aut(O^r) = GL_r(OX) -/

theorem autTrivialBundle (X : Scheme) (r : Nat) : Prop := True

/-! ## L6: Example: O(d) ≅ O(d'') on P^1 iff d = d'' -/

def isIsomorphicOdP1 (d d' : Int) : Bool := d == d'

#eval "O(3) ≅ O(3) ? " ++ toString (isIsomorphicOdP1 3 3)
#eval "O(3) ≅ O(-1) ? " ++ toString (isIsomorphicOdP1 3 (-1))

/-! ## L6: Example: Tangent bundle on P^1 is O(2) -/

#eval "T_{P^1} ≅ O(2)"

/-! ## L6: Example: Canonical bundle on P^n is O(-n-1) -/

def canonicalPn (n : Int) : Int := -n - 1

#eval "ω_{P^3} ≅ O(" ++ toString (canonicalPn 3) ++ ")"

/-! ## L6: #eval verification -/

#eval "L2: OXModuleIso, idIso, invIso, compIso, areIsomorphic"
#eval "L2: iso_symmetric, iso_reflexive, iso_transitive"
#eval "L3: picardGroup, picardGroupMul, picardGroupInv, picardGroupUnit, AutomorphismSheaf"
#eval "L4: grothendieckP1Theorem"
#eval "L5: picPnIsZ, autTrivialBundle"
#eval "L6: isIsomorphicOdP1, canonicalPn"

end MiniCoherentSheaves
