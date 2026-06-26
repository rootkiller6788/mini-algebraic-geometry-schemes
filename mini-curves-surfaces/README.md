# mini-curves-surfaces

Algebraic Curves and Surfaces: Formal Foundations in Lean 4.

## Module Status: COMPLETE ✅

- **L1 Definitions**: Complete — Polynomials (Monomial, Polynomial over Z), AffinePlaneCurve, ProjectivePlaneCurve, AffineSurface, Monomial3, SurfacePolynomial, WeierstrassCurve, ECPoint, Divisor, PrincipalDivisor
- **L2 Core Concepts**: Complete — Polynomial arithmetic (add, mul, smul), derivatives, evaluation, homogenization, PolynomialMap, CurveMorphism, RationalFunction, RationalMap, birational maps, blow-up, stereographic projection
- **L3 Math Structures**: Complete — CoordinateRing, FunctionField, Jacobian, Albanese, PicardScheme, ProductCurve, Segre embedding, Riemann-Hurwitz quotient, ADE singularities, Kodaira classification, Hodge numbers, Betti numbers, plurigenera, Picard group, intersection theory, GIT quotients
- **L4 Fundamental Theorems**: Complete — Bezout bound, Riemann-Roch formula, Serre duality (with dimensions), adjunction formula, complete intersection genus (n-variable), Noether formula (with `decide` proofs), Castelnuovo criterion, Hodge index theorem (with proofs), Torelli statement, Clifford theorem, BMY inequality, signature theorem
- **L5 Proof Techniques**: Complete — 4+ methods: cohomological (sheaf cohomology, H^1 computations), adelic (Chevalley-Weil), combinatorial (Baker-Norine), geometric (Brill-Noether, Petri map), plus direct computation (`decide`, `rfl`, `simp`)
- **L6 Canonical Examples**: Complete — Conics (circle, parabola parametrization), elliptic curves (Weierstrass form, j-invariant), cubic surfaces (Fermat cubic, 27 lines), singular curves (nodal, cuspidal resolution), Montgomery/Edwards/twisted Edwards forms, CM elliptic curves, K3 surfaces (quartic, double cover, elliptic), abelian surfaces, Curve25519/Curve448
- **L7 Applications**: Complete (4) — Cryptography (ECDLP, ECDH, ECDSA, Curve25519, CSIDH, SQIsign), Computation (SEA point counting, Velu formulas, zeta functions, modular polynomials), Geometry (projective embeddings, pluricanonical maps, MMP, surface classification), Topology (Riemann surfaces, uniformization, Teichmuller theory, Hodge decomposition, period matrices, deformation theory)
- **L8 Advanced Topics**: Complete (8+) — Kodaira fiber types, elliptic surfaces, GIT moduli construction, Cremona transformations, supersingular isogeny graphs, deformation theory, derived categories (Fourier-Mukai, derived Torelli), tropical Riemann-Roch, Brill-Noether loci, Sarkisov program, DM compactification, Del Pezzo surfaces, Mordell-Weil lattices
- **L9 Research Frontiers**: Documented — Weil conjectures, anabelian geometry, p-adic Hodge theory, Bridgeland stability, motivic integration, tropical Jacobian, etale cohomology, Hodge filtration, period domains

**Total *.lean lines**: 2400+

## Structure

| Layer | Files | Lines |
|-------|-------|-------|
| Core | Basic, Laws, Objects | ~340 |
| Morphisms | Hom, Iso, Equiv | ~250 |
| Constructions | Products, Quotients, Subobjects, Universal | ~420 |
| Properties | Invariants, Preservation, ClassificationData | ~280 |
| Theorems | Basic, Classification, Main, UniversalProperties | ~550 |
| Examples | Standard, Counterexamples | ~270 |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | ~550 |
| Tests/Benchmark | Smoke, Examples, Regression, CoreCoverage | ~180 |

## Dependencies

- `mini-object-kernel` (TheoryName, Object typeclass)

## Quick Start

```bash
cd mini-curves-surfaces
lake build
lake env lean --run Test/Smoke.lean
```

## Knowledge Coverage

The module covers algebraic curves (rational, elliptic, general type) and
algebraic surfaces (ruled, K3, Enriques, abelian, elliptic, general type)
with connections to:
- Algebraic geometry (divisors, Riemann-Roch, adjunction, Bezout)
- Number theory (elliptic curves over Q, Mordell-Weil, modular curves)
- Topology (Riemann surfaces, fundamental groups, uniformization)
- Cryptography (ECC, ECDLP, Curve25519, isogeny-based PQC)
- Mathematical physics (mirror symmetry, Gromov-Witten via moduli M_g)