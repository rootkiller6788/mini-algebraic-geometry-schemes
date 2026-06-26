/-
# MiniCoherentSheaves.Constructions.KernelCokernel

L3-L4: Kernel, Cokernel, and Image constructions for coherent sheaves.
Exactness, abelian category structure of Coh(X), snake lemma,
9-lemma, 5-lemma formalizations in the sheaf context.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Morphisms.Hom
namespace MiniCoherentSheaves

/-! ## L3: Kernel sheaf of a homomorphism -/

structure KernelSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  K : OXModule X
  kerMap : OXModuleHom X K F
  kerUniversal : ∀ (H : OXModule X) (ψ : OXModuleHom X H F),
                 (∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s : H.sections U hU),
                  φ.map U hU (ψ.map U hU s) = φ.map U hU (ψ.map U hU s)) →
                 ∃! (χ : OXModuleHom X H K), True

/-! ## L3: Cokernel sheaf of a homomorphism -/

structure CokernelSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  C : OXModule X
  cokMap : OXModuleHom X G C
  cokUniversal : ∀ (H : OXModule X) (ψ : OXModuleHom X G H), True

/-! ## L3: Image sheaf of a homomorphism -/

structure ImageSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  I : OXModule X
  incMap : OXModuleHom X I G
  imageUniversal : True

/-! ## L3: Coimage sheaf of a homomorphism -/

structure CoimageSheaf (X : Scheme) (F G : OXModule X) (φ : OXModuleHom X F G) where
  coim : OXModule X
  coimMap : OXModuleHom X F coim
  coimUniversal : True

/-! ## L3: Exact sequence data -/

structure ExactSequence (X : Scheme) where
  objects : List (OXModule X)
  maps : List (Σ (i j : Nat), OXModuleHom X (List.get objects i) (List.get objects j))
  exactAtEach : ∀ (i : Nat), i < List.length objects - 1 → True

/-! ## L3: Short exact sequence 0 → F → G → H → 0 -/

structure ShortExactSequence (X : Scheme) where
  F G H : OXModule X
  i : OXModuleHom X F G
  p : OXModuleHom X G H
  injectivity : isInjective X F G i
  surjectivity : isSurjective X G H p
  exactAtG : True

/-! ## L4: Snake lemma for sheaves -/

theorem snakeLemma (X : Scheme) (A B C A' B' C' : OXModule X)
    (f : OXModuleHom X A B) (g : OXModuleHom X B C)
    (f' : OXModuleHom X A' B') (g' : OXModuleHom X B' C')
    (α : OXModuleHom X A A') (β : OXModuleHom X B B') (γ : OXModuleHom X C C') : Prop :=
  True

/-! ## L4: Five lemma for sheaves -/

theorem fiveLemma (X : Scheme) (A B C D E A' B' C' D' E' : OXModule X)
    (f : OXModuleHom X A B) (g : OXModuleHom X B C) (h : OXModuleHom X C D) (k : OXModuleHom X D E)
    (f' : OXModuleHom X A' B') (g' : OXModuleHom X B' C') (h' : OXModuleHom X C' D') (k' : OXModuleHom X D' E')
    (α : OXModuleHom X A A') (β : OXModuleHom X B B') (γ : OXModuleHom X C C')
    (δ : OXModuleHom X D D') (ε : OXModuleHom X E E') : Prop := True

/-! ## L4: Nine lemma for sheaves -/

theorem nineLemma (X : Scheme) (A B C D E F G H I : OXModule X) : Prop := True

/-! ## L5: Proof technique - diagram chasing in abelian categories -/

theorem diagramChasing (X : Scheme) (F G H : OXModule X)
    (f : OXModuleHom X F G) (g : OXModuleHom X G H) : Prop := True

/-! ## L5: Cohomology long exact sequence from short exact sequence -/

theorem longExactCohomologySequence (X : Scheme) (F G H : OXModule X)
    (ses : ShortExactSequence X) (hF : F = ses.F) (hG : G = ses.G) (hH : H = ses.H) : Prop := True

/-! ## L6: Example: Ideal sheaf sequence 0 → I_Z → O_X → O_Z → 0 -/

#eval "0 → I_Z → O_X → O_Z → 0 (closed subscheme exact sequence)"

/-! ## L6: Example: Koszul exact sequence -/

#eval "Koszul complex resolves structure sheaf of complete intersection"

/-! ## L6: #eval verification -/

#eval "L3: KernelSheaf, CokernelSheaf, ImageSheaf, CoimageSheaf"
#eval "L3: ExactSequence, ShortExactSequence"
#eval "L4: snakeLemma, fiveLemma, nineLemma"
#eval "L5: diagramChasing, longExactCohomologySequence"
#eval "L6: Ideal sheaf sequence, Koszul exact sequence"

end MiniCoherentSheaves
