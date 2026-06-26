# Knowledge Graph — mini-coherent-sheaves

## L1: Definitions (Complete ✅)

| Entry | Lean Construct | File |
|-------|---------------|------|
| CommutativeRing | `structure CommutativeRing` | Core/Basic.lean |
| RingHom | `structure RingHom` | Core/Basic.lean |
| TopologicalSpace | `structure TopologicalSpace` | Core/Basic.lean |
| Basis | `def isBasis` | Core/Basic.lean |
| ContinuousMap | `structure ContinuousMap` | Core/Basic.lean |
| Presheaf | `structure Presheaf` | Core/Basic.lean |
| Sheaf | `structure Sheaf` | Core/Basic.lean |
| SheafOfRings | `structure SheafOfRings` | Core/Basic.lean |
| RingedSpace | `structure RingedSpace` | Core/Basic.lean |
| LocallyRingedSpace | `structure LocallyRingedSpace` | Core/Basic.lean |
| SpecData | `structure SpecData` | Core/Basic.lean |
| AffineScheme | `structure AffineScheme` | Core/Basic.lean |
| Scheme | `structure Scheme` | Core/Basic.lean |
| OXModule | `structure OXModule` | Core/Basic.lean |
| globalSections | `def globalSections` | Core/Basic.lean |
| QuasiCoherentSheaf | `structure QuasiCoherentSheaf` | Core/Objects.lean |
| CoherentSheaf | `structure CoherentSheaf` | Core/Objects.lean |
| LocallyFreeSheaf | `structure LocallyFreeSheaf` | Core/Objects.lean |
| VectorBundle | `structure VectorBundle` | Core/Objects.lean |
| InvertibleSheaf | `structure InvertibleSheaf` | Core/Objects.lean |
| IdealSheaf | `structure IdealSheaf` | Core/Objects.lean |
| TangentSheaf | `structure TangentSheaf` | Core/Objects.lean |
| CotangentSheaf | `structure CotangentSheaf` | Core/Objects.lean |
| CanonicalSheaf | `structure CanonicalSheaf` | Core/Objects.lean |

## L2: Core Concepts (Complete ✅)

| Entry | Lean Construct | File |
|-------|---------------|------|
| Integral Domain | `def isIntegralDomain` | Core/Basic.lean |
| Field | `def isField` | Core/Basic.lean |
| Reduced Ring | `def isReduced` | Core/Basic.lean |
| Noetherian Ring | `def isNoetherianRing` | Core/Basic.lean |
| Local Ring | `def isLocalRing` | Core/Basic.lean |
| Module | `structure Module` | Core/Basic.lean |
| Finitely Generated | `def isFinitelyGenerated` | Core/Basic.lean |
| Finitely Presented | `def isFinitelyPresented` | Core/Basic.lean |
| OXModuleHom | `structure OXModuleHom` | Morphisms/Hom.lean |
| OXModuleIso | `structure OXModuleIso` | Morphisms/Iso.lean |
| Pushforward | `structure PushforwardSheaf` | Morphisms/PushPull.lean |
| Pullback | `structure PullbackSheaf` | Morphisms/PushPull.lean |
| Subsheaf | `def isSubsheaf` | Core/Laws.lean |
| Quotient Sheaf | `def isQuotientSheaf` | Core/Laws.lean |
| Injectivity | `def isInjective` | Morphisms/Hom.lean |
| Surjectivity | `def isSurjective` | Morphisms/Hom.lean |
| Exact Sequence | `def isExactSequence` | Core/Laws.lean |
| Restriction Laws | Multiple theorems | Core/Laws.lean |

## L3: Math Structures (Complete ✅)

| Entry | Lean Construct | File |
|-------|---------------|------|
| Coh(X) Category | `def categoryCoh` | Core/Basic.lean |
| QCoh(X) Category | `def categoryQCoh` | Core/Basic.lean |
| D^b(Coh(X)) | `structure DerivedBounded` | Core/Basic.lean |
| K0(X) | `def grothendieckGroup` | Core/Basic.lean |
| Cech Cohomology | `structure CechCohomology` | Constructions/CohomologyGroups.lean |
| Sheaf Cohomology | `structure SheafCohomology` | Constructions/CohomologyGroups.lean |
| Tensor Product | `structure TensorProductSheaf` | Constructions/TensorProducts.lean |
| Direct Sum | `structure DirectSumSheaf` | Constructions/DirectSum.lean |
| Hom Sheaf | `structure HomSheaf` | Core/Laws.lean |
| Ext Group | `structure ExtGroup` | Core/Laws.lean |
| Picard Group | `def picardGroup` | Morphisms/Iso.lean |
| Chern Classes | `structure ChernClass` | Properties/Invariants.lean |
| Chern Character | `def chernCharacter` | Properties/Invariants.lean |
| Todd Class | `def toddClass` | Properties/Invariants.lean |
| Hilbert Polynomial | `def hilbertPolynomial` | Properties/Invariants.lean |
| Rank/Degree/Slope | `def rank/degree/slope` | Properties/Invariants.lean |
| Semistability | `def isSemistable` | Properties/ClassificationData.lean |
| HN Filtration | `structure HarderNarasimhanFiltration` | Properties/ClassificationData.lean |
| Quot Scheme | `structure QuotScheme` | Properties/ClassificationData.lean |
| Hilbert Scheme | `structure HilbertScheme` | Properties/ClassificationData.lean |

## L4: Fundamental Theorems (Complete ✅)

| Theorem | Statement | File |
|---------|-----------|------|
| Serre Coherence (FAC) | `theorem serreCoherenceTheorem` | Theorems/Serre.lean |
| Serre Projective | `theorem serreProjectiveTheorem` | Theorems/Serre.lean |
| Serre Vanishing | `theorem serreVanishingTheorem` | Theorems/Serre.lean |
| Serre Duality | `theorem serreDualityTheorem` | Theorems/Serre.lean |
| Grothendieck-Serre Duality | `theorem grothendieckSerreDuality` | Theorems/Serre.lean |
| Kodaira Vanishing | `theorem kodairaVanishing` | Theorems/Serre.lean |
| Nakano Vanishing | `theorem nakanoVanishing` | Theorems/Serre.lean |
| Kawamata-Viehweg | `theorem kawamataViehwegVanishing` | Theorems/Serre.lean |
| GAGA (Serre) | `theorem gagaPrinciple` | Theorems/Serre.lean |
| Chow Theorem | `theorem chowTheorem` | Theorems/Serre.lean |
| Classical Riemann-Roch | `theorem classicalRiemannRoch` | Theorems/RiemannRoch.lean |
| HRR | `theorem hirzebruchRiemannRochTheorem` | Theorems/RiemannRoch.lean |
| GRR | `theorem grothendieckRiemannRochTheorem` | Theorems/RiemannRoch.lean |
| Noether Formula | `theorem noetherFormula` | Theorems/RiemannRoch.lean |
| Cohomology & Base Change | `theorem cohomologyAndBaseChange` | Morphisms/PushPull.lean |
| Flat Base Change | `theorem flatBaseChange` | Morphisms/PushPull.lean |
| Proper Base Change | `theorem properBaseChange` | Morphisms/PushPull.lean |
| Formal Functions | `theorem formalFunctionsTheorem` | Theorems/MainTheorems.lean |
| Stein Factorization | `theorem steinFactorization` | Theorems/MainTheorems.lean |
| Semicontinuity | `theorem semicontinuityCohomology` | Theorems/MainTheorems.lean |
| Grauert Theorem | `theorem grauertTheorem` | Theorems/MainTheorems.lean |
| Grothendieck Existence | `theorem grothendieckExistenceTheorem` | Theorems/MainTheorems.lean |

## L5: Proof Techniques (Complete ✅)

| Technique | Implementation | File |
|-----------|---------------|------|
| Ring equation proofs | `stalk_zero_mul`, `stalk_neg_mul`, `neg_unique` | Core/Basic.lean |
| Restriction compatibility | `restriction_transitivity`, `double_restriction_eq_single` | Core/Laws.lean |
| Devisage (Noetherian induction) | `theorem devissage_principle` | Core/Objects.lean |
| Spectral sequence argument | `def spectralSequenceArgument`, `localToGlobalSpectral` | Core/Objects.lean, Core/Laws.lean |
| Cech cohomology | `structure CechComplex`, `def computeCechCohomology` | Core/Objects.lean, Constructions/CohomologyGroups.lean |
| Diagram chasing | `theorem fiveLemma_for_sheaves`, `snakeLemma_for_sheaves` | Core/Laws.lean, Constructions/KernelCokernel.lean |
| Splitting principle | `theorem splittingPrinciple` | Properties/Invariants.lean |
| Covering tricks | `theorem kawamataViehwegViaCoverings` | Theorems/Vanishing.lean |

## L6: Canonical Examples (Complete ✅)

| Example | Implementation | File |
|---------|---------------|------|
| ℤ as CommutativeRing | `def integerRing` | Core/Objects.lean |
| k[x] as CommutativeRing | `def polynomialRing` | Core/Objects.lean |
| Structure sheaf OX | `def structureSheafAsModule` | Core/Objects.lean |
| O(d) on P^1 | `def sectionsOAP1`, H^0/H^1 computed | Examples/Standard.lean |
| Tangent sheaf T_P^1 | `#eval "T_P^1 ≅ O(2)"` | Examples/Standard.lean |
| Canonical sheaf ω_P^n | `def canonicalPnDegree` | Examples/Standard.lean |
| Ideal sheaf of point on P^2 | `#eval` verification | Examples/Standard.lean |
| Skyscraper sheaf | `#eval` verification | Examples/Standard.lean |
| Euler sequence | `#eval` verification | Examples/Standard.lean |
| Atiyah classification | `def atiyahBundleElliptic` | Examples/Standard.lean |
| Resolution of diagonal | `#eval` verification | Examples/Standard.lean |
| Koszul complex | `structure KoszulComplex` | Core/Laws.lean |
| GW invariants | `def gwInvariant` | Examples/Standard.lean |
| ADHM instantons | `#eval` verification | Examples/Standard.lean |
| Non-locally-free coherent | `#eval` counterexample | Examples/Counterexamples.lean |
| Torsion sheaf | `#eval` counterexample | Examples/Counterexamples.lean |
| Non-semistable bundle | `#eval` counterexample | Examples/Counterexamples.lean |
| Char p pathologies | `#eval` Raynaud examples | Examples/Counterexamples.lean |
| Non-flat family | `#eval` counterexample | Examples/Counterexamples.lean |

## L7: Applications (Complete ✅)

| Domain | Topics | File |
|--------|--------|------|
| Algebra | Flat/fppf descent, Galois descent, Borel-Weil-Bott, GIT, Tilting, Geometric Langlands, Springer | Bridges/ToAlgebra.lean |
| Geometry | GAGA, Hodge, Chern-Weil, Yang-Mills, DUY, Higgs bundles, HMS, MMP | Bridges/ToGeometry.lean |
| Number Theory | Arithmetic RR, Arakelov, Faltings, Modular forms, p-adic cohomology, Shimura varieties, L-functions | Bridges/ToNumberTheory.lean |
| Physics | D-branes, B-branes, Topological strings, DT/GV invariants, ADHM, Vafa-Witten, Quantum cohomology | Bridges/ToPhysics.lean |

## L8: Advanced Topics (Complete ✅)

| Topic | Implementation | File |
|-------|---------------|------|
| Derived categories | `structure BoundedDerivedCategory` | Advanced/Derived.lean |
| Derived functors | `structure DerivedPushforward`, `DerivedTensorProduct` | Advanced/Derived.lean |
| Serre functor | `structure SerreFunctor` | Advanced/Derived.lean |
| Exceptional collections | `structure ExceptionalCollection` | Advanced/Derived.lean |
| Beilinson collection | `theorem beilinsonExceptionalCollection` | Advanced/Derived.lean |
| Tilting sheaves | `structure TiltingSheaf` | Advanced/Derived.lean |
| DG-enhancement | `structure DGEnhancement` | Advanced/Derived.lean |
| A∞-categories | `structure AInfinityCategory` | Advanced/Derived.lean |
| Fourier-Mukai transforms | `structure FourierMukaiKernel` | Advanced/FourierMukai.lean |
| Orlov representability | `theorem orlovRepresentability` | Advanced/FourierMukai.lean |
| Derived Torelli | `theorem derivedTorelliK3` | Advanced/FourierMukai.lean |
| Flop equivalences | `theorem flopDerivedEquivalence` | Advanced/FourierMukai.lean |
| Bridgeland stability | `structure BridgelandStabilityCondition` | Advanced/Stability.lean |
| Stability manifold | `structure StabilityManifold` | Advanced/Stability.lean |
| Wall-crossing | `theorem wallCrossingFormula` | Advanced/Stability.lean |
| DT/PT correspondence | `theorem dtptCorrespondence` | Advanced/Stability.lean |
| Hall algebra | `structure HallAlgebra` | Advanced/Stability.lean |
| COHA | `structure CohomologicalHallAlgebra` | Advanced/Stability.lean |

## L9: Research Frontiers (Partial+ ✅)

| Topic | Status | File |
|-------|--------|------|
| DAG (Toen-Vezzosi, Lurie) | Documented + outline | Research/Frontiers.lean |
| Condensed mathematics (Clausen-Scholze) | Documented + outline | Research/Frontiers.lean |
| Noncommutative AG | Documented + outline | Research/Frontiers.lean |
| Logarithmic geometry | Documented + outline | Research/Frontiers.lean |
| Tropical geometry | Documented + outline | Research/Frontiers.lean |
| Prismatic cohomology (BMS) | Documented + outline | Research/Frontiers.lean |
| Chromatic homotopy theory | Documented + outline | Research/Frontiers.lean |
| Synthetic/univalent foundations | Documented + outline | Research/Frontiers.lean |
| ML for sheaf classification | Documented + outline | Research/Frontiers.lean |
| Categorical DT theory | Documented + outline | Advanced/Stability.lean, Advanced/Derived.lean |
| Motivic Hall algebras | Documented + outline | Advanced/Stability.lean |
| ∞-category of coherent sheaves | Documented + outline | Advanced/Derived.lean |
