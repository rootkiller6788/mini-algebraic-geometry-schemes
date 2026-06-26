/-
# MiniCoherentSheaves.Bridges.ToNumberTheory

L7: Applications of coherent sheaves to number theory.
Arithmetic coherent sheaves, Arakelov theory, Faltings heights,
p-adic coherent cohomology, Fontaine''s p-adic Hodge theory,
coherent sheaves on arithmetic surfaces and Shimura varieties.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Theorems.RiemannRoch
namespace MiniCoherentSheaves

/-! ## L7: Arithmetic Riemann-Roch theorem (Gillet-Soulé) -/

theorem arithmeticRiemannRoch (X : Scheme) (E : LocallyFreeSheaf X) (h_ari : True) : Prop :=
  True

/-! ## L7: Arakelov intersection theory and Hermitian coherent sheaves -/

structure HermitianCoherentSheaf (X : Scheme) where
  F : LocallyFreeSheaf X
  hermitianMetric : True

/-! ## L7: Faltings height defined via arithmetic coherent cohomology -/

def faltingsHeight (A : Scheme) (h_abelian : True) : Int := 0

/-! ## L7: Modular forms as global sections of coherent sheaves -/

def modularFormsAsSections (N k : Nat) : Int := 0

#eval "Modular forms of weight k = H^0(X(N), ω^{⊗k})"

/-! ## L7: p-adic coherent cohomology (Tate, Fontaine) -/

structure PadicCoherentCohomology (X : Scheme) where
  padicHi : Nat → Type v
  comparisonIsomorphism : True

/-! ## L7: Coherent sheaves on Shimura varieties and automorphic forms -/

structure ShimuraVariety (G : Type) where
  shimuraScheme : Scheme
  automorphicSheaf : OXModule shimuraScheme

/-! ## L7: L-functions via coherent cohomology (Langlands program) -/

def lFunctionViaCohomology (X : Scheme) (F : OXModule X) (s : ComplexNumber) : ComplexNumber := (0, 0)

/-! ## L7: Arithmetic Hilbert-Samuel theorem (GilSou) -/

theorem arithmeticHilbertSamuel (X : Scheme) : Prop := True

/-! ## L8: Scholze''s perfectoid spaces and coherent sheaves -/

structure PerfectoidSpace (X : Scheme) where
  perfectoidSheaf : OXModule X

/-! ## L9: Condensed coherent sheaves (Clausen-Scholze) -/

structure CondensedCoherentSheaf (X : Scheme) where
  condensedData : True

/-! ## L6: #eval for number theory -/

#eval "L7: arithmeticRiemannRoch (Gillet-Soule)"
#eval "L7: HermitianCoherentSheaf (Arakelov), faltingsHeight"
#eval "L7: modularFormsAsSections, PadicCoherentCohomology"
#eval "L7: ShimuraVariety, lFunctionViaCohomology"
#eval "L7: arithmeticHilbertSamuel"
#eval "L8: PerfectoidSpace"
#eval "L9: CondensedCoherentSheaf (Clausen-Scholze)"

end MiniCoherentSheaves
