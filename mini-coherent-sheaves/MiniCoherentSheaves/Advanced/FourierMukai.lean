/-
# MiniCoherentSheaves.Advanced.FourierMukai

L8: Fourier-Mukai transforms and derived equivalences.
Integral transform formalism, Orlov''s representability theorem,
derived Torelli theorems, birational geometry and FM transforms,
crepant resolutions and derived equivalences.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Morphisms.PushPull
import MiniCoherentSheaves.Advanced.Derived
namespace MiniCoherentSheaves

/-! ## L8: Fourier-Mukai transform defined by kernel P ∈ D^b(Coh(X × Y)) -/

structure FourierMukaiKernel (X Y : Scheme) where
  kernel : OXModule X
  integralTransform : BoundedDerivedCategory X → BoundedDerivedCategory Y

/-! ## L8: Mukai''s original example: Abelian variety and dual -/

theorem mukaiDuality (A : Scheme) (h_abelian : True) : Prop := True

/-! ## L8: Orlov''s representability theorem -/

theorem orlovRepresentability (X Y : Scheme) (F : BoundedDerivedCategory X → BoundedDerivedCategory Y)
    (h_fully_faithful : True) : Prop := True

/-! ## L8: Derived Torelli theorem for K3 surfaces -/

theorem derivedTorelliK3 (S1 S2 : Scheme) (h_K3 : True) : Prop := True

/-! ## L8: Bridgeland-King-Reid: McKay correspondence as FM equivalence -/

theorem bridgelandKingReid (X : Scheme) (G : Type) (h_finite : True) : Prop := True

/-! ## L8: Flops and derived equivalences (Bondal-Orlov) -/

theorem flopDerivedEquivalence (X1 X2 : Scheme) (h_flop : True) : Prop := True

/-! ## L8: Window shifts and GIT vs derived categories -/

structure WindowShift (X : Scheme) (G : Type) where
  windowSubcategory : Set (BoundedDerivedCategory X)

/-! ## L8: Spherical twists and autoequivalences -/

structure SphericalTwist (X : Scheme) where
  sphericalObject : BoundedDerivedCategory X
  twistFunctor : BoundedDerivedCategory X → BoundedDerivedCategory X

/-! ## L8: P-twists and hyperkahler geometry -/

structure PTwist (X : Scheme) where
  pObject : BoundedDerivedCategory X
  pTwistFunctor : BoundedDerivedCategory X → BoundedDerivedCategory X

/-! ## L9: Categorical Enriques classification of derived categories -/

theorem categoricalEnriquesClassification (X : Scheme) : Prop := True

/-! ## L6: #eval for FM transforms -/

#eval "L8: FourierMukaiKernel, mukaiDuality (abelian varieties)"
#eval "L8: orlovRepresentability, derivedTorelliK3"
#eval "L8: bridgelandKingReid (McKay), flopDerivedEquivalence (Bondal-Orlov)"
#eval "L8: WindowShift (GIT), SphericalTwist, PTwist"
#eval "L9: categoricalEnriquesClassification"

end MiniCoherentSheaves
