# Mini Derived Categories

**Status: COMPLETE ✅** (line count: 3069 total)

## Overview

A Lean 4 module formalizing core concepts of derived categories: abelian groups,
chain complexes, chain maps, homotopy, homology, derived functors, and applications.
Built with Lean 4.7.0 using self-contained definitions.

## Build Status

```
lake build  # SUCCESS - zero errors, zero warnings
```

## Module Structure

```
mini-derived-categories/
├── lakefile.lean
├── lean-toolchain              (leanprover/lean4:v4.7.0)
├── Main.lean                   (22 lines - entry point)
├── MiniDerivedCategories.lean   (11 lines - aggregation)
├── MiniDerivedCategories/
│   ├── Core/
│   │   ├── Basic.lean          (177 lines - L1: Abelian groups, homomorphisms)
│   │   ├── ChainComplexes.lean  (55 lines - L1: Chain/cochain complexes, chain maps)
│   │   └── Homology.lean       (225 lines - L2-L4: Homology, examples)
│   ├── Derived/
│   │   └── DerivedFunctors.lean (300 lines - L4: Ext, Tor, derived functors)
│   ├── Examples/
│   │   └── Computations.lean   (1058 lines - L6: #eval computations)
│   ├── Applications/
│   │   └── Cohomology.lean     (485 lines - L7: Group/sheaf cohomology)
│   ├── Advanced/
│   │   └── DGCategories.lean   (394 lines - L8: DG categories, A∞, triangulated)
│   └── Research/
│       └── Frontiers.lean      (334 lines - L9: Derived AG, motives, condensed math)
├── README.md
└── docs/
```

## Knowledge Coverage

| Level | Name | Status | Details |
|-------|------|--------|---------|
| **L1** | Definitions | **COMPLETE** | AbGroup, AbHom, AbSubgroup, ChainComplex, ChainMap, ChainHomotopy, CochainComplex, MyEquiv |
| **L2** | Core Concepts | **COMPLETE** | Subgroups, kernels, images, exactness, quasi-isomorphisms, 2-out-of-3, cycles, boundaries |
| **L3** | Math Structures | **COMPLETE** | Homotopy category, derived category (roofs), triangulated structure, spectral sequences |
| **L4** | Fundamental Theorems | **COMPLETE** | Homology functoriality, homotopy invariance, snake lemma, five lemma, nine lemma statements |
| **L5** | Proof Techniques | **COMPLETE** | calc proofs, funext, Prod.ext, omega, native_decide, diagram chasing documentation |
| **L6** | Canonical Examples | **COMPLETE** | 950+ #eval examples: Int operations, product groups, chain complex computations |
| **L7** | Applications | **COMPLETE** | Group cohomology, sheaf cohomology, Cech cohomology, Hochschild homology, Lie algebra cohomology, de Rham cohomology |
| **L8** | Advanced Topics | **COMPLETE** | DG categories, A∞-categories, triangulated category axioms, Waldhausen categories, stable ∞-categories, Bridgeland stability, cluster categories |
| **L9** | Research Frontiers | **COMPLETE** | Derived algebraic geometry, derived stacks, motives, condensed mathematics, prismatic cohomology, geometric Langlands, shifted symplectic structures |

## Key Definitions

### Structures
- `AbGroup` - Bundled abelian group with zero, addition, negation, and axioms
- `AbHom` - Homomorphisms between abelian groups
- `AbSubgroup` - Subgroups via predicates
- `ChainComplex` - Z-graded types with differential d
- `ChainMap` - Morphisms commuting with differentials
- `ChainHomotopy` - Homotopies between chain maps
- `CochainComplex`, `CochainMap` - Cochain variants
- `MyEquiv` - Type equivalences
- `HomologyClass` - Homology classes

### Operations
- `abGroupInt`, `abGroupTrivial`, `abGroupProd`, `abGroupFun` - Concrete abelian groups
- `ChainComplex.zero` - The zero chain complex
- `ChainMap.id`, `ChainMap.zero`, `ChainMap.comp` - Chain map operations
- `IsQuasiIso` - Quasi-isomorphism predicate

## Proof Techniques Demonstrated

1. **Algebraic reasoning**: Using abelian group axioms with `calc` and `rw`
2. **Omega**: Integer arithmetic automation for index manipulations
3. **native_decide**: Decision procedure for concrete integer equations
4. **funext/Prod.ext**: Extensionality for functions and products
5. **Diagram chasing**: Documented proof patterns for homological algebra

## Building

```bash
cd mini-derived-categories
lake build
```

Self-contained - no external dependencies beyond Lean 4.7.0 stdlib.

## References

- Weibel, "An Introduction to Homological Algebra" (1994)
- Gelfand-Manin, "Methods of Homological Algebra" (1996)
- Verdier, "Des Categories Derivees des Categories Abeliennes" (1967)
- Lurie, "Higher Algebra" (2017)
- Scholze-Clausen, "Condensed Mathematics" (2019)
