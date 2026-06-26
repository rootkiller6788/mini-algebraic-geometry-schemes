import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Bridges: Moduli Spaces and Physics (L7)
Moduli spaces in string theory, supersymmetric gauge theory,
and mathematical physics.
-/

/-- Moduli space of vacua in supersymmetric gauge theory:
the space of zero-energy configurations modulo gauge equivalence.
For N=4 SYM, this is the Coulomb branch: (R?)^r / W where
W is the Weyl group of the gauge group. -/
structure VacuumModuli where
  gaugeGroup : String
  supersymmetry : Nat  -- N=1,2,4
  coulombBranch : List Int
  higgsBranch : List Int
  dimension : Nat


/-- Seiberg-Witten theory: the moduli space of N=2 SYM
is a family of elliptic curves (the Seiberg-Witten curve)
over the Coulomb branch. The prepotential F determines
the low-energy effective action. -/
structure SeibergWittenCurve where
  gaugeGroup : String
  curveFamily : FamilyOfObjects
  coulombBranch : List Int
  discriminant : List Int -> Int
  prepotential : List Int -> Int


/-- Moduli of Calabi-Yau compactifications in string theory:
For heterotic string theory, the moduli space includes
the complex structure moduli and K?hler moduli of the CY.
The moduli space metric is the Zamolodchikov metric
(Weil-Petersson metric on complex structure moduli,
Hitchin's special K?hler metric on K?hler moduli). -/
structure StringCompactification where
  calabiYau : List Int
  complexStructureModuli : FineModuliSpace
  kahlerModuli : FineModuliSpace
  mirrorMap : Bool
  yukawaCouplings : List Int


/-- Donaldson invariants: differential-topological invariants
of 4-manifolds computed by integrating over the moduli space
of anti-self-dual connections. Witten relates these to
Seiberg-Witten invariants via the u-plane integral. -/
structure DonaldsonInvariant where
  fourManifold : List Int
  moduliASD : FineModuliSpace
  invariant : Int
  equalsSW : Bool


/-- Gromov-Witten/Donaldson-Thomas correspondence:
GW invariants of a CY3 equal DT invariants (virtual counts
of stable sheaves) up to a change of variables (MNOP).
This relates curve-counting to sheaf-counting. -/
structure GW_DT_Correspondence where
  calabiYau : List Int
  gwInvariants : List Int
  dtInvariants : List Int
  mnopFormula : Bool


/-- The SYZ (Strominger-Yau-Zaslow) conjecture:
Mirror symmetry is T-duality on a special Lagrangian
torus fibration of the CY. The moduli of these fibrations
relates A-model and B-model via Fourier-Mukai transform. -/
structure SYZ_Conjecture where
  calabiYau : List Int
  torusFibration : List Int -> List Int
  specialLagrangianFibers : List (List Int)
  fourierMukaiTransform : Bool


/-- Moduli of instantons on ALE spaces:
The moduli of framed instantons on R?/   (where   ?SU(2))
corresponds to quiver varieties (Nakajima).
Leads to geometric constructions of Kac-Moody algebras. -/
structure InstantonsOnALE where
  aleGroup : String
  instantonNumber : Nat
  nakajimaVariety : List Int
  kacMoodyAction : Bool


/-- The moduli space of Higgs bundles on a curve C:
M_Higgs(C, r) = T* Bun(C, r) (the cotangent bundle of the
moduli of stable bundles). Has a C*-action with fixed loci
related to representations and the nilpotent cone. -/
structure HiggsBundleModuli where
  curve : List Int
  rank : Nat
  totalSpace : List Int
  hitchinFibration : List Int -> List Int
  cstarFixedLoci : List (List Int)


/-- Hitchin system: the moduli of Higgs bundles fibers over
the Hitchin base    H^0(C, K_C^?i) via the characteristic polynomial.
The generic fiber is an abelian variety (the Prym variety
of the spectral curve). This is an algebraically completely
integrable Hamiltonian system. -/
structure HitchinSystem where
  curve : List Int
  rank : Nat
  hitchinBase : List Int
  spectralCurve : List Int -> List Int
  prymVariety : List Int


end MiniModuliSpaces
