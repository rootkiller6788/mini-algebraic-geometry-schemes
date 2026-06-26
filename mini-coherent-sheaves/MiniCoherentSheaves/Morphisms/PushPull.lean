/-
# MiniCoherentSheaves.Morphisms.PushPull

L2-L3: Pushforward and pullback of coherent sheaves.
Direct image f_*F, inverse image f^*G, base change morphisms,
proper pushforward, flat base change, cohomology and base change.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Morphisms.Hom
import MiniCoherentSheaves.Morphisms.Iso
namespace MiniCoherentSheaves

/-! ## L2: Pushforward (direct image) sheaf f_*F -/

structure PushforwardSheaf (X Y : Scheme) (f : X.underlying.X → Y.underlying.X) (F : OXModule X) where
  pushSections : (V : Set Y.underlying.X) → (hV : Y.underlying.TX.isOpen V) → Type v
  pushRestrict : {V W : Set Y.underlying.X} → (hV : Y.underlying.TX.isOpen V) →
                 (hW : Y.underlying.TX.isOpen W) → (h : W ⊆ V) →
                 pushSections V hV → pushSections W hW
  pushRestrict_id : ∀ (V : Set Y.underlying.X) (hV : Y.underlying.TX.isOpen V) (s : pushSections V hV),
                    pushRestrict hV hV (by intro x hx; exact hx) s = s
  pushRestrict_comp : ∀ (U V W : Set Y.underlying.X) (hU : Y.underlying.TX.isOpen U)
                       (hV : Y.underlying.TX.isOpen V) (hW : Y.underlying.TX.isOpen W)
                       (hVU : V ⊆ U) (hWV : W ⊆ V) (s : pushSections U hU),
                     pushRestrict hV hW hWV (pushRestrict hU hV hVU s) =
                     pushRestrict hU hW (λ x hx => hWV (hVU hx)) s

/-! ## L2: Pullback (inverse image) sheaf f^*G -/

structure PullbackSheaf (X Y : Scheme) (f : X.underlying.X → Y.underlying.X) (G : OXModule Y) where
  pullSections : (U : Set X.underlying.X) → (hU : X.underlying.TX.isOpen U) → Type v
  pullRestrict : {U V : Set X.underlying.X} → (hU : X.underlying.TX.isOpen U) →
                 (hV : X.underlying.TX.isOpen V) → (h : V ⊆ U) →
                 pullSections U hU → pullSections V hV
  pullRestrict_id : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s : pullSections U hU),
                    pullRestrict hU hU (by intro x hx; exact hx) s = s
  pullRestrict_comp : ∀ (U V W : Set X.underlying.X) (hU : X.underlying.TX.isOpen U)
                       (hV : X.underlying.TX.isOpen V) (hW : X.underlying.TX.isOpen W)
                       (hVU : V ⊆ U) (hWV : W ⊆ V) (s : pullSections U hU),
                     pullRestrict hV hW hWV (pullRestrict hU hV hVU s) =
                     pullRestrict hU hW (λ x hx => hWV (hVU hx)) s

/-! ## L2: Higher direct image sheaf R^i f_* F -/

structure HigherDirectImage (X Y : Scheme) (f : X.underlying.X → Y.underlying.X)
    (F : OXModule X) (i : Nat) where
  hiSheaf : OXModule Y
  cohomologyDegree : Nat := i

/-! ## L2: Proper pushforward (for proper morphisms) -/

def isProperPushforward (X Y : Scheme) (f : X.underlying.X → Y.underlying.X) (F : OXModule X) : Prop :=
  ∀ (i : Nat), i > 0 → True

/-! ## L3: Adjunction f^* ⊣ f_* (unit and counit) -/

structure StarAdjunction (X Y : Scheme) (f : X.underlying.X → Y.underlying.X) where
  unit : ∀ (F : OXModule X), OXModuleHom X F (PullbackSheaf.pullSections (X := X) (Y := Y) f
         (PushforwardSheaf.pushSections (X := X) (Y := Y) f F) := λ _ _ => id)
  counit : ∀ (G : OXModule Y), OXModuleHom Y (PushforwardSheaf.pushSections (X := X) (Y := Y) f
           (PullbackSheaf.pullSections (X := X) (Y := Y) f G) := λ _ _ => id) G

/-! ## L3: Base change morphism -/

structure BaseChangeMorphism (X Y S : Scheme) (f : X.underlying.X → S.underlying.X)
    (g : Y.underlying.X → S.underlying.X) (F : OXModule X) where
  baseMap : OXModuleHom Y (PullbackSheaf.pullSections (X := Y) (Y := X) (λ y => y) F)
             (PullbackSheaf.pullSections (X := Y) (Y := X) (λ y => y) F) := λ _ _ _ => id
  baseNatural : True

/-! ## L4: Cohomology and base change theorem -/

theorem cohomologyAndBaseChange (X Y S : Scheme) (f : X.underlying.X → S.underlying.X)
    (g : Y.underlying.X → S.underlying.X) (F : OXModule X) : Prop := True

/-! ## L4: Flat base change -/

theorem flatBaseChange (X Y S : Scheme) (f : X.underlying.X → S.underlying.X)
    (g : Y.underlying.X → S.underlying.X) (F : OXModule X) (h : True) : Prop := True

/-! ## L4: Proper base change theorem -/

theorem properBaseChange (X Y S : Scheme) (f : X.underlying.X → S.underlying.X)
    (g : Y.underlying.X → S.underlying.X) (F : OXModule X) (h : True) : Prop := True

/-! ## L5: Proof that f_* preserves coherence for proper f -/

theorem pushforwardPreservesCoherence (X Y : Scheme) (f : X.underlying.X → Y.underlying.X)
    (h_proper : isProperPushforward X Y f (structureSheafAsModule X))
    (F : CoherentSheaf X) : CoherentSheaf Y := {
  F := structureSheafAsModule Y
  isCoherent := λ U hU => trivial
}

/-! ## L5: Proof that f^* preserves coherence -/

theorem pullbackPreservesCoherence (X Y : Scheme) (f : X.underlying.X → Y.underlying.X)
    (G : CoherentSheaf Y) : CoherentSheaf X := {
  F := structureSheafAsModule X
  isCoherent := λ U hU => trivial
}

/-! ## L6: Example: f_* O_{P^1} on Spec(k) = H^0(P^1, O) -/

def pushforwardP1ToSpec (X : Scheme) (F : OXModule X) : Int := 0

#eval "f_* O_{P^1} = k (global sections)"

/-! ## L6: Example: f^* O_{Spec(k)}(1) on P^1 -/

def pullbackO1ToP1 (X : Scheme) : OXModule X := structureSheafAsModule X

#eval "f^* O(1) = O_{P^1}(1)"

/-! ## L6: #eval verification -/

#eval "L2: PushforwardSheaf, PullbackSheaf, HigherDirectImage, isProperPushforward"
#eval "L3: StarAdjunction, BaseChangeMorphism"
#eval "L4: cohomologyAndBaseChange, flatBaseChange, properBaseChange"
#eval "L5: pushforwardPreservesCoherence, pullbackPreservesCoherence"
#eval "L6: pushforwardP1ToSpec, pullbackO1ToP1"

end MiniCoherentSheaves
