import MiniObjectKernel.Core.Basic
import MiniModuliSpaces.Core.Basic

namespace MiniModuliSpaces

/-
# Universal Families and Constructions (L3-L4)
Universal families over moduli spaces, tautological bundles,
Poincare bundles, and the universal curve over M_g.
-/

/-- The universal family over a fine moduli space M:
a family U -> M such that for every family X -> S of objects,
there exists a unique classifying map c: S -> M with X ? c*U. -/
structure UniversalFamilyConstruction where
  moduliSpace : FineModuliSpace
  totalSpace : List Int
  projection : List Int -> List Int
  fibers : List Int -> List (List Int)
  classifyingMap : FamilyOfObjects -> (List Int -> List Int)
  uniqueness : Bool


/-- The universal curve C_g -> M_g over the moduli space of curves.
For each point [C]  in  M_g, the fiber is the curve C.
This is NOT a family of curves over M_g (automorphisms cause issues)
but a Deligne-Mumford stack. -/
structure UniversalCurve where
  genus : Nat
  moduliSpace : FineModuliSpace
  totalSpace : List Int
  projection : List Int -> List Int
  sections : List (List Int)
  nodalFibers : List (List Int)


/-- The universal curve restricted to the locus of curves
without automorphisms gives an honest family.
Over this locus, the classifying map exists. -/
structure RestrictedUniversalCurve where
  universal : UniversalCurve
  automorphismFreeLocus : List Int
  restriction : FamilyOfObjects
  isFineOnRestriction : Bool


/-- Tautological classes on M_g:
omega_i = c_1(L_i) where L_i is the line bundle whose fiber
at (C, p?,...,p?) is T*_{p_i}C (cotangent line).
kappa_i = rho_*(omega_{n+1}^{i+1}) where rho: M_{g,n+1} -> M_{g,n}. -/
structure TautologicalClasses where
  genus : Nat
  psiClasses : List (List Int)
  kappaClasses : List (List Int)
  lambdaClasses : List (List Int)
  mumfordRelations : List (List Int -> List Int)


/-- Mumford's formula for the Chern character of the Hodge bundle:
ch(Lambda) = Omega B_{2m}/(2m)!    (kappa_{2m-1} - ...)
where Lambda = rho_* ..._{C/M_g} is the Hodge bundle. -/
structure HodgeBundle where
  genus : Nat
  bundle : List (List Int)
  rank : Nat
  chernCharacter : List Int
  mumfordFormula : Bool


/-- The Poincare bundle on Pic^0(C)    C:
a universal line bundle P such that for each [L]  in  Pic^0(C),
P|_{[L]  C} ? L. This makes Pic^0(C) a fine moduli space
(representing the Picard functor). -/
structure PoincareBundleConstruction where
  curve : List Int
  picardVariety : List Int
  totalSpace : List Int
  universalLineBundle : List (List Int)
  restrictionIsL : Bool


/-- The universal vector bundle on the moduli space of
stable bundles: exists when rank and degree are coprime.
Otherwise, only exists as a twisted universal bundle
on the rigidified stack. -/
structure UniversalVectorBundle where
  curve : List Int
  rank : Nat
  degree : Int
  isCoprime : Bool
  universalBundle : List (List (List Int))
  existsAsSheaf : Bool


/-- Construction of the Hilbert scheme via Grassmannians
and flattening stratification. Grothendieck's key insight:
embed Quot^P(E/X) into a Grassmannian of quotients of
a sufficiently ample twist of E. -/
structure HilbertSchemeConstruction where
  variety : List Int
  hilbertPolynomial : List Int -> Int
  grassmannianEmbedding : List Int -> List Int
  flatteningStrata : List (List Int)
  representabilityProof : Bool


/-- The Quot scheme as a closed subscheme of a Grassmannian:
Quot^P(E/X) ? Gr(R, rho_*E(m)) for m ? 0.
R = dim H^0(X, E(m)) - P(m) and rho: X    Gr -> Gr. -/
def grassmannianEmbeddingTarget (h0 : Nat) (Pm : Int) : Nat :=
  h0 - (Pm.toNat)

/-- The universal quotient sheaf on X    Quot:
a flat family of quotients E -> Q -> 0 such that for every
flat quotient E_S -> F -> 0 over S, there exists a unique
map S -> Quot pulling back the universal quotient to F. -/
structure UniversalQuotient where
  quotScheme : QuotScheme
  totalSpace : List Int
  universalMap : List Int -> List (List Int)
  isFlat : Bool
  representingProperty : Bool


/-- Virtual fundamental class: when the moduli space has
excess obstruction, the virtual fundamental class [M]^vir
corrects for this. Constructed via the intrinsic normal cone
(Behrend-Fantechi) or perfect obstruction theory (Li-Tian). -/
structure VirtualFundamentalClass where
  moduliSpace : FineModuliSpace
  expectedDimension : Int
  virtualDimension : Int
  perfectObstructionTheory : List Int
  behrendFantechiConstruction : Bool


end MiniModuliSpaces
