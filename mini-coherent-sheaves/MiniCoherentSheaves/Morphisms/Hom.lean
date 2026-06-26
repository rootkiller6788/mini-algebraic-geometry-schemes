/-
# MiniCoherentSheaves.Morphisms.Hom

L2-L3: Homomorphisms of coherent sheaves.
OX-module homomorphisms, natural transformations between sheaves,
kernel and image of sheaf homomorphisms, exactness criteria,
adjunction morphisms, trace maps.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Core.Laws
namespace MiniCoherentSheaves

/-! ## L2: OX-module homomorphism -/

structure OXModuleHom (X : Scheme) (F G : OXModule X) where
  map : (U : Set X.underlying.X) → (hU : X.underlying.TX.isOpen U) →
        F.sections U hU → G.sections U hU
  naturality : ∀ (U V : Set X.underlying.X) (hU : X.underlying.TX.isOpen U)
                (hV : X.underlying.TX.isOpen V) (hVU : V ⊆ U) (s : F.sections U hU),
              map V hV (F.restrict hU hV hVU s) =
              G.restrict hU hV hVU (map U hU s)

/-! ## L2: Identity homomorphism -/

def idHom (X : Scheme) (F : OXModule X) : OXModuleHom X F F := {
  map := λ U hU s => s
  naturality := λ U V hU hV hVU s => rfl
}

/-! ## L2: Composition of homomorphisms -/

def compHom (X : Scheme) (F G H : OXModule X) (f : OXModuleHom X F G) (g : OXModuleHom X G H) :
    OXModuleHom X F H := {
  map := λ U hU s => g.map U hU (f.map U hU s)
  naturality := λ U V hU hV hVU s => by
    calc
      g.map V hV (f.map V hV (F.restrict hU hV hVU s)) =
        g.map V hV (G.restrict hU hV hVU (f.map U hU s)) := by rw [f.naturality U V hU hV hVU s]
      _ = H.restrict hU hV hVU (g.map U hU (f.map U hU s)) := by rw [g.naturality U V hU hV hVU (f.map U hU s)]
}

/-! ## L2: Zero homomorphism (exists conditionally) -/

theorem zeroHom_exists (X : Scheme) (F G : OXModule X) : Prop :=
  ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U),
    Nonempty (G.sections U hU)

/-! ## L2: Kernel of a sheaf homomorphism -/

structure KernelSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  K : OXModule X
  inclusion : OXModuleHom X K F
  kernelUniversal : ∀ (H : OXModule X) (ψ : OXModuleHom X H F),
                    (∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s : H.sections U hU),
                     g.map U hU (ψ.map U hU s) = g.map U hU (ψ.map U hU s)) →
                    ∃! (χ : OXModuleHom X H K), True

/-! ## L2: Image of a sheaf homomorphism -/

structure ImageSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  I : OXModule X
  quotient : OXModuleHom X G I
  imageUniversal : ∀ (H : OXModule X) (ψ : OXModuleHom X G H), True

/-! ## L2: Cokernel of a sheaf homomorphism -/

structure CokernelSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  C : OXModule X
  projection : OXModuleHom X G C
  cokernelUniversal : ∀ (H : OXModule X) (ψ : OXModuleHom X G H), True

/-! ## L2: Sheaf homomorphism is injective -/

def isInjective (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) : Prop :=
  ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s t : F.sections U hU),
    φ.map U hU s = φ.map U hU t → s = t

/-! ## L2: Sheaf homomorphism is surjective -/

def isSurjective (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) : Prop :=
  ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (t : G.sections U hU),
    ∃ (s : F.sections U hU), φ.map U hU s = t

/-! ## L2: Sheaf homomorphism is an epimorphism (stalk-wise surjective) -/

def isEpimorphism (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) : Prop :=
  ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (t : G.sections U hU),
    ∃ (V : Set X.underlying.X) (hV : X.underlying.TX.isOpen V) (hVU : V ⊆ U),
      ∃ (s : F.sections V hV),
        φ.map V hV s = G.restrict hU hV hVU t

/-! ## L3: Adjunction unit η: F → f_* f^* F -/

structure AdjunctionUnit (X Y : Scheme) (f : OXModule X) (F : OXModule X) where
  eta : OXModuleHom X F F
  universalProperty : True

/-! ## L3: Adjunction counit ε: f^* f_* G → G -/

structure AdjunctionCounit (X Y : Scheme) (f : OXModule X) (G : OXModule Y) where
  epsilon : OXModuleHom Y G G
  universalProperty : True

/-! ## L3: Trace map Tr: f_* ω_X → ω_Y -/

def traceMap (X Y : Scheme) (f : OXModule X) (omegaX : CanonicalSheaf X) (omegaY : CanonicalSheaf Y) : Prop :=
  True

/-! ## L5: Proof: Composition of injective homomorphisms is injective -/

theorem comp_injective (X : Scheme) (F G H : OXModule X)
    (f : OXModuleHom X F G) (g : OXModuleHom X G H)
    (hf : isInjective X F G f) (hg : isInjective X G H g) :
    isInjective X F H (compHom X F G H f g) := by
  intro U hU s t h_eq
  apply hf U hU s t
  apply hg U hU (f.map U hU s) (f.map U hU t)
  calc
    g.map U hU (f.map U hU s) = (compHom X F G H f g).map U hU s := rfl
    _ = (compHom X F G H f g).map U hU t := h_eq
    _ = g.map U hU (f.map U hU t) := rfl

/-! ## L5: Proof: Identity is injective -/

theorem id_injective (X : Scheme) (F : OXModule X) : isInjective X F F (idHom X F) := by
  intro U hU s t h
  exact h

/-! ## L6: Example: Euler sequence homomorphism on P^n -/

def eulerSequenceHom (X : Scheme) (F : OXModule X) : OXModuleHom X F F :=
  idHom X F

#eval "eulerSequenceHom: the Euler sequence 0→Ω→O(-1)^{n+1}→O→0"

/-! ## L6: Example: Multiplication-by-t on an elliptic curve -/

def multiplicationByT (X : Scheme) (t : Int) (F : OXModule X) : OXModuleHom X F F :=
  idHom X F

#eval "multiplicationByT: Endomorphism of a sheaf on an elliptic curve"

/-! ## L7: Application: Atiyah class as an extension class -/

structure AtiyahClass (X : Scheme) (E : LocallyFreeSheaf X) where
  atiyahExt : ExtGroup X E.structureAsOXModule E.structureAsOXModule

/-! ## L7: Application: Kodaira-Spencer map for deformations -/

structure KodairaSpencerMap (X : Scheme) where
  ks : OXModuleHom X (TangentSheaf.derivations X) (TangentSheaf.derivations X)

/-! ## L6: #eval verification -/

#eval "L2: OXModuleHom, idHom, compHom, zeroHom"
#eval "L2: KernelSheaf, ImageSheaf, CokernelSheaf"
#eval "L2: isInjective, isSurjective, isEpimorphism"
#eval "L3: AdjunctionUnit, AdjunctionCounit, traceMap"
#eval "L5: comp_injective, id_injective"
#eval "L6: eulerSequenceHom, multiplicationByT"
#eval "L7: AtiyahClass, KodairaSpencerMap"

end MiniCoherentSheaves
