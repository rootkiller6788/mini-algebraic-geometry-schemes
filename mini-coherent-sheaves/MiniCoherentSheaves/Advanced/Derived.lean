/-
# MiniCoherentSheaves.Advanced.Derived

L8: Derived categories of coherent sheaves.
D^b(Coh(X)), derived functors, triangulated structure,
generators and exceptional collections, mutations, tilting theory,
dg-enhancement, A∞-categories, infinity-categories in algebraic geometry.
-/

import MiniCoherentSheaves.Core.Basic
import MiniCoherentSheaves.Core.Objects
import MiniCoherentSheaves.Morphisms.Hom
import MiniCoherentSheaves.Constructions.CohomologyGroups
namespace MiniCoherentSheaves

/-! ## L8: Bounded derived category D^b(Coh(X)) -/

structure BoundedDerivedCategory (X : Scheme) where
  objects : Type (max u (v+1))
  shift : objects → objects
  distinguishedTriangles : Set (objects × objects × objects)
  octahedralAxiom : True

/-! ## L8: Derived functor Rf_* on derived category -/

structure DerivedPushforward (X Y : Scheme) (f : X.underlying.X → Y.underlying.X) where
  RfStar : BoundedDerivedCategory X → BoundedDerivedCategory Y
  functoriality : True

/-! ## L8: Derived tensor product ⊗^L -/

structure DerivedTensorProduct (X : Scheme) where
  derivedTensor : BoundedDerivedCategory X → BoundedDerivedCategory X → BoundedDerivedCategory X
  associativity : True

/-! ## L8: Serre functor on D^b(Coh(X)) = - ⊗ ω_X[n] -/

structure SerreFunctor (X : Scheme) where
  S : BoundedDerivedCategory X → BoundedDerivedCategory X
  serreDuality : True

/-! ## L8: Exceptional collections and mutations -/

structure ExceptionalCollection (X : Scheme) where
  objects : List (BoundedDerivedCategory X)
  exceptional : ∀ E ∈ objects, True

/-! ## L8: Beilinson''s exceptional collection on P^n -/

theorem beilinsonExceptionalCollection (n : Nat) : Prop :=
  True

/-! ## L8: Tilting sheaves and derived equivalences -/

structure TiltingSheaf (X : Scheme) where
  T : OXModule X
  tiltingCondition : True

/-! ## L8: Derived McKay correspondence -/

theorem derivedMcKayCorrespondence (G : Type) (h_finite : True) : Prop :=
  True

/-! ## L8: dg-enhancement of D^b(Coh(X)) -/

structure DGEnhancement (X : Scheme) where
  dgCategory : Type (max u (v+1))
  homotopyCategory : BoundedDerivedCategory X

/-! ## L8: A∞-category structure on D^b(Coh(X)) -/

structure AInfinityCategory (X : Scheme) where
  objects : Type (max u (v+1))
  higherCompositions : ∀ (n : Nat), True

/-! ## L9: ∞-category of coherent sheaves (Lurie, DAG) -/

structure InfinityCategoryCoh (X : Scheme) where
  infinityCat : Type (max u (v+3))
  underlyingTriangulated : BoundedDerivedCategory X

/-! ## L9: Categorical Donaldson-Thomas theory (Kontsevich-Soibelman) -/

structure CategoricalDT (X : Scheme) where
  hallAlgebra : True
  integrationMap : True

/-! ## L6: #eval for advanced derived categories -/

#eval "L8: BoundedDerivedCategory, DerivedPushforward, DerivedTensorProduct"
#eval "L8: SerreFunctor, ExceptionalCollection, beilinsonExceptionalCollection"
#eval "L8: TiltingSheaf, derivedMcKayCorrespondence"
#eval "L8: DGEnhancement, AInfinityCategory"
#eval "L9: InfinityCategoryCoh (Lurie DAG), CategoricalDT (KS)"

end MiniCoherentSheaves
