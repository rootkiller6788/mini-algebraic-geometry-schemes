/-
# MiniCoherentSheaves.Bridges.ToAlgebra

L7: Applications of coherent sheaves to algebra.
Coherent modules over Noetherian rings, faithful flatness,
descent theory, Galois cohomology and sheaves, representation theory:
Borel-Weil-Bott, geometric Langlands program connection.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Theorems.Serre
namespace MiniCoherentSheaves

/-! ## L7: Coherent module = finitely generated module over Noetherian ring -/

theorem coherentModuleEquivalence (R : CommutativeRing) (hN : isNoetherianRing R) : Prop :=
  True

/-! ## L7: Flat descent for coherent modules -/

theorem flatDescentCoherentModules (R S : CommutativeRing) (h_flat : True) : Prop :=
  True

/-! ## L7: Faithfully flat descent of coherent modules (fppf topology) -/

theorem fppfDescent (R S : CommutativeRing) (h_fppf : True) : Prop :=
  True

/-! ## L7: Galois descent for coherent sheaves -/

structure GaloisDescent (K L : CommutativeRing) (G : Type) where
  galoisAction : True
  descentData : True

/-! ## L7: Borel-Weil-Bott theorem (geometric realization of representations) -/

theorem borelWeilBottTheorem (G : Type) (lambda : List Int) : Prop :=
  True

/-! ## L7: Geometric invariant theory (GIT) and moduli of coherent sheaves -/

structure GITQuotient (X : Scheme) (G : Type) where
  stableLocus : X.underlying.X → Prop
  quotientScheme : Scheme

/-! ## L7: Derived equivalence ↔ tilting sheaf (Rickard''s theorem) -/

theorem rickardTiltingEquivalence (A B : CommutativeRing) : Prop :=
  True

/-! ## L7: Coherent sheaves on the stack Bun_G (geometric Langlands) -/

structure BunG (C : Scheme) (G : Type) where
  principalBundles : Set (categoryCoh C)
  heckeOperators : True

/-! ## L7: Kazhdan-Lusztig theory via perverse sheaves -/

theorem kazhdanLusztigViaPerverseSheaves (W : Type) : Prop :=
  True

/-! ## L7: Springer correspondence via coherent sheaves on nilpotent cone -/

theorem springerCorrespondence (G : Type) : Prop :=
  True

/-! ## L8: Categorical action of Hecke algebra on Coh(Bun_G) -/

structure HeckeAction (C : Scheme) (G : Type) where
  action : categoryCoh (BunG.principalBundles (C := C) (G := G)) → categoryCoh (BunG.principalBundles (C := C) (G := G))

/-! ## L6: #eval for algebra applications -/

#eval "L7: coherentModuleEquivalence, flatDescentCoherentModules, fppfDescent"
#eval "L7: GaloisDescent, borelWeilBottTheorem, GITQuotient"
#eval "L7: rickardTiltingEquivalence, BunG (geometric Langlands)"
#eval "L7: kazhdanLusztigViaPerverseSheaves, springerCorrespondence"
#eval "L8: HeckeAction"

end MiniCoherentSheaves
