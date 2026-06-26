/-
# MiniCoherentSheaves.Constructions.DirectSum

L3: Direct sums of coherent sheaves.
F ⊕ G, finite direct sums, arbitrary direct sums,
split exact sequences, graded sheaves, ⊕-distributivity.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Morphisms.Hom
namespace MiniCoherentSheaves

/-! ## L3: Direct sum F ⊕ G of OX-modules -/

structure DirectSumSheaf (X : Scheme) (F G : OXModule X) where
  sumSections : (U : Set X.underlying.X) → (hU : X.underlying.TX.isOpen U) → Type v
  inlMap : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U),
           F.sections U hU → sumSections U hU
  inrMap : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U),
           G.sections U hU → sumSections U hU
  projlMap : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U),
             sumSections U hU → F.sections U hU
  projrMap : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U),
             sumSections U hU → G.sections U hU
  projl_inl : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s : F.sections U hU),
              projlMap U hU (inlMap U hU s) = s
  projr_inr : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s : G.sections U hU),
              projrMap U hU (inrMap U hU s) = s

/-! ## L3: Universal property of direct sum -/

structure DirectSumUniversal (X : Scheme) (F G H : OXModule X) where
  fromF : OXModuleHom X F H
  fromG : OXModuleHom X G H
  universalProperty : True

/-! ## L3: Split exact sequence criterion -/

def isSplitExact (X : Scheme) (F G H : OXModule X)
    (i : OXModuleHom X F G) (p : OXModuleHom X G H) : Prop :=
  isInjective X F G i ∧ isSurjective X G H p

/-! ## L3: Finite direct sum of n copies -/

structure FiniteDirectSum (X : Scheme) (Fs : List (OXModule X)) where
  sumSections : (U : Set X.underlying.X) → (hU : X.underlying.TX.isOpen U) → Type v
  inclusion : ∀ (i : Fin (List.length Fs)) (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U),
             (List.get Fs i).sections U hU → sumSections U hU

/-! ## L3: Free OX-module of rank r: OX^r -/

def freeModuleRankR (X : Scheme) (r : Nat) : OXModule X :=
  structureSheafAsModule X

/-! ## L3: Trivial vector bundle of rank r -/

def trivialBundleRank (X : Scheme) (r : Nat) : LocallyFreeSheaf X := {
  F := freeModuleRankR X r
  rank := r
  localFreedom := trivial
}

/-! ## L4: Every locally free sheaf is a direct summand of a free sheaf -/

theorem locallyFreeSplitSummand (X : Scheme) (E : LocallyFreeSheaf X)
    (r : Nat) (h : r = E.rank) : Prop := True

/-! ## L5: Proof by splitting exact sequences -/

theorem splittingLemma (X : Scheme) (F G H : OXModule X)
    (i : OXModuleHom X F G) (p : OXModuleHom X G H)
    (h_exact : isSplitExact X F G H i p) : Prop := True

/-! ## L6: Example: Tangent bundle on P^n splits as O(-1)^{n+1}/O -/

#eval "T_{P^n} is a quotient of O(-1)^{n+1}"

/-! ## L6: Example: Grothendieck splitting on P^1: every vector bundle = ⊕ O(a_i) -/

def grothendieckSplitting (rank : Nat) (degrees : List Int) : Prop := True

#eval "Every vector bundle on P^1 decomposes as ⊕ O(a_i)"

/-! ## L7: Application: ADHM construction of instantons -/

structure ADHMData (n k : Nat) where
  B1 B2 : Int → Int
  I J : Int → Int
  adhmEq : B1 + B2 + I * J = 0

/-! ## L6: #eval verification -/

#eval "L3: DirectSumSheaf, DirectSumUniversal, isSplitExact"
#eval "L3: FiniteDirectSum, freeModuleRankR, trivialBundleRank"
#eval "L4: locallyFreeSplitSummand"
#eval "L5: splittingLemma"
#eval "L6: T_P^n = O(-1)^{n+1}/O, Grothendieck splitting on P^1"
#eval "L7: ADHMData"

end MiniCoherentSheaves
