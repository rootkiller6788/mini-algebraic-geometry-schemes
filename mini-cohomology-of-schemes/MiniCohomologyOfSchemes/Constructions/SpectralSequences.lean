import MiniCohomologyOfSchemes.Core.Basic
/-! Spectral sequences for sheaf cohomology. -/
namespace MiniCohomologyOfSchemes
structure SpectralSequence where
  r : Nat
  E : Nat -> Nat -> AbGroup
  d : forall p q : Nat, AbGroupHom (E p q) (E p q)
def leraySS (F : AbGroup) : SpectralSequence :=
  SpectralSequence.mk (r := 2) (E := fun _ _ => F) (d := fun _ _ => AbGroupHom.id F)
def cechToDerivedSS (F : AbGroup) : SpectralSequence := leraySS F
structure FilteredComplex where
  K : Nat -> AbGroup
structure DoubleComplex where
  C : Nat -> Nat -> AbGroup
  dh : forall p q, AbGroupHom (C p q) (C (p+1) q)
  dv : forall p q, AbGroupHom (C p q) (C p (q+1))
def hodgeDeRhamSS (omega : Nat -> AbGroup) : SpectralSequence := leraySS (omega 0)
def P1_leray_ss (p q : Nat) : Nat := if p = 0 then q else 0
#eval P1_leray_ss 0 1


end MiniCohomologyOfSchemes