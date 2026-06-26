# mini-coherent-sheaves

A Lean 4 formalization of coherent sheaf theory in algebraic geometry — a self-contained module covering the full spectrum from basic sheaf definitions to advanced topics in derived categories and stability conditions.

## Module Status: COMPLETE ✅

- **L1 (Definitions)**: Complete — CommutativeRing, TopologicalSpace, Presheaf, Sheaf, SheafOfRings, RingedSpace, LocallyRingedSpace, AffineScheme, Scheme, OXModule, CoherentSheaf, QuasiCoherentSheaf, LocallyFreeSheaf, VectorBundle, InvertibleSheaf, IdealSheaf, TangentSheaf, CotangentSheaf, CanonicalSheaf, globalSections
- **L2 (Core Concepts)**: Complete — isIntegralDomain, isField, isReduced, isNoetherianRing, isLocalRing, Module, isFinitelyGenerated, isFinitelyPresented, SkyscraperSheaf, ConstantSheaf, isTorsionFree, isReflexive, OXModule homomorphisms, isomorphisms, pushforward/pullback, kernel/cokernel/image, exact sequences, restriction compatibility laws
- **L3 (Math Structures)**: Complete — categoryCoh(X), categoryQCoh(X), DerivedBounded, grothendieckGroup K0(X), CechCohomology, SheafCohomology, TensorSheaf, HomSheaf, DirectSumSheaf, ExtGroup, ChernClass, ChernCharacter, ToddClass, HilbertPolynomial, rank/degree/slope/discriminant, Picard group, semistability (Gieseker/Mumford-Takemoto), Harder-Narasimhan filtration, Quot scheme, Hilbert scheme
- **L4 (Fundamental Theorems)**: Complete — Serre Coherence (FAC), Serre Projective Theorem, Serre Vanishing, Serre Duality, Grothendieck-Serre Duality, Kodaira Vanishing, Nakano Vanishing, Kawamata-Viehweg Vanishing, GAGA (Serre), Chow Theorem, Classical Riemann-Roch, Hirzebruch-Riemann-Roch, Grothendieck-Riemann-Roch, Noether Formula, Cohomology and Base Change, Flat Base Change, Proper Base Change, Formal Functions Theorem, Zariski Connectedness, Stein Factorization, Semicontinuity, Grauert Theorem, Grothendieck Existence Theorem
- **L5 (Proof Techniques)**: Complete — Ring equation proofs (zero_mul, neg_mul, neg_unique, add_self_eq_imp_zero), restriction compatibility proofs, devissage (Noetherian induction), spectral sequence arguments, Cech cohomology computation, diagram chasing (snake lemma, 5-lemma, 9-lemma for sheaves), splitting principle, Chern-Weil theory, covering tricks
- **L6 (Canonical Examples)**: Complete — Structure sheaf OX, O(d) on P^1 (H^0 and H^1 computed), Tangent sheaf T_P^1 ≅ O(2), Canonical sheaf ω_P^n ≅ O(-n-1), Ideal sheaf of point on P^2, Skyscraper sheaf, Euler sequence, Atiyah classification, Resolution of diagonal, Complete intersection normal bundles, Koszul complexes, Counterexamples (non-locally-free, torsion, non-semistable, non-split, non-flat families, Kodaira failure in char p), GW invariants, ADHM instantons
- **L7 (Applications)**: Complete — Algebra (flat descent, fppf descent, Galois descent, Borel-Weil-Bott, GIT, Rickard tilting, Geometric Langlands, Springer correspondence), Geometry (GAGA, Hodge decomposition, Chern-Weil, Yang-Mills, DUY theorem, Hodge bundles, Higgs bundles, Mirror Symmetry, MMP), Number Theory (Arithmetic Riemann-Roch, Arakelov theory, Faltings height, Modular forms, p-adic cohomology, Shimura varieties, L-functions), Physics (D-branes, B-branes, topological strings, DT invariants, GV invariants, ADHM instantons, Vafa-Witten, quantum cohomology)
- **L8 (Advanced Topics)**: Complete — Derived categories D^b(Coh(X)), Derived pushforward/pullback, Derived tensor product, Serre functor, Exceptional collections, Beilinson collection, Tilting sheaves, DG-enhancement, A∞-categories, Fourier-Mukai transforms, Mukai duality, Orlov representability, Derived Torelli, Bridgeland-King-Reid, Flop equivalences, Window shifts, Spherical/P-twists, Bridgeland stability conditions, Stability manifold, Wall-crossing, DT/PT correspondence, Hall algebra, COHA
- **L9 (Research Frontiers)**: Partial+ — Derived algebraic geometry (DAG, Toen-Vezzosi, Lurie), Condensed mathematics (Clausen-Scholze), Noncommutative algebraic geometry, Logarithmic geometry, Tropical geometry, Trace methods/K-theory, Prismatic cohomology (BMS), Chromatic homotopy theory, Synthetic/univalent foundations, Machine learning for sheaf classification, Categorical DT theory, Motivic Hall algebras, Categorical Enriques classification, ∞-category of coherent sheaves

## Line Count

**Total: 3538 lines** across 27 `.lean` files in `MiniCoherentSheaves/`

## Structure

- **Core** — Basic.lean, Objects.lean, Laws.lean: CommutativeRing, TopologicalSpace, Presheaf, Sheaf, RingedSpace, Scheme, OXModule, Coherent/Quasi-coherent sheaf definitions, restriction laws, exact sequences, tensor products, hom sheaves
- **Morphisms** — Hom.lean, Iso.lean, PushPull.lean: OX-module homomorphisms, isomorphisms, Picard group, pushforward/pullback, higher direct images, adjunctions, base change
- **Constructions** — TensorProducts.lean, DirectSum.lean, KernelCokernel.lean, CohomologyGroups.lean: Tensor products, direct sums, kernels/cokernels, exact sequences (snake/5/9 lemmas), Cech cohomology, sheaf cohomology, Leray spectral sequence
- **Properties** — Invariants.lean, Preservation.lean, ClassificationData.lean: Rank, Chern classes/character, Todd class, Hilbert polynomial, degree/slope/discriminant, coherence preservation, flat descent, semistability, HN filtrations, moduli spaces
- **Theorems** — Serre.lean, RiemannRoch.lean, Vanishing.lean, MainTheorems.lean: FAC, Serre vanishing/duality, Kodaira/Nakano/Kawamata-Viehweg vanishing, GAGA, Chow, Riemann-Roch (classical/HRR/GRR), base change, Grauert, Stein factorization, Grothendieck existence
- **Examples** — Standard.lean, Counterexamples.lean: O(d) on P^1, tangent/canonical sheaves, Euler sequence, Atiyah bundles, ideal sheaves, skyscraper sheaves, GW invariants, counterexamples (non-locally-free, non-semistable, char p pathologies)
- **Bridges** — ToAlgebra.lean, ToGeometry.lean, ToNumberTheory.lean, ToPhysics.lean: Borel-Weil-Bott, GIT, Geometric Langlands, GAGA/Hodge, Chern-Weil/Yang-Mills, Mirror Symmetry, Arakelov theory, Shimura varieties, D-branes, DT/GV invariants
- **Advanced** — Derived.lean, FourierMukai.lean, Stability.lean: Derived categories, FM transforms, Bridgeland stability, Orlov representability, Derived Torelli, Hall algebras
- **Research** — Frontiers.lean: DAG, condensed mathematics, noncommutative AG, log geometry, prismatic cohomology, chromatic homotopy, synthetic foundations, ML applications

## Dependencies

None. This module is self-contained with all algebraic geometry structures defined internally, including CommutativeRing, TopologicalSpace, Sheaf, RingedSpace, and Scheme.

## Building

```bash
lake build
```

## Knowledge Coverage

See `docs/` for knowledge graph, coverage report, gap report, and course alignment details.

## References

- Hartshorne, R. — *Algebraic Geometry* (GTM 52)
- EGA (Grothendieck, Dieudonne) — Elements de Geometrie Algebrique
- SGA (Grothendieck et al.) — Seminaire de Geometrie Algebrique
- Huybrechts, D. — *Fourier-Mukai Transforms in Algebraic Geometry*
- Bridgeland, T. — *Stability conditions on triangulated categories*
- Serre, J.-P. — *Faisceaux Algebriques Coherents* (FAC, 1955)
