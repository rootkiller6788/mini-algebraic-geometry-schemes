# Mini Algebraic Geometry & Schemes

A collection of **from-scratch, zero-dependency Lean 4 implementations** of algebraic geometry theory, from affine varieties to derived categories and intersection theory. Each module formalizes a core topic in modern algebraic geometry, bridging graduate-level textbook theorems to verified, executable code.

## Sub-Modules

| Sub-Module | Topics | Key Courses |
|--------|--------|-------------|
| [mini-schemes](mini-schemes/) | Commutative rings, prime ideals, Spec(R), Zariski topology, ringed spaces, structure sheaves, fiber products, sheaf cohomology | Princeton MAT 560, Harvard Math 232B, Berkeley Math 256B |
| [mini-affine-varieties](mini-affine-varieties/) | Polynomial rings k[x₁,...,xₙ], ideals, algebraic sets V(I), Zariski topology, irreducible components, coordinate rings, Hilbert Nullstellensatz, Krull dimension | MIT 18.725, Harvard Math 232A, Berkeley Math 256A |
| [mini-coherent-sheaves](mini-coherent-sheaves/) | Quasi-coherent sheaves, coherent sheaves, locally free sheaves, vector bundles, Serre duality, Riemann-Roch theorems, vanishing theorems, stability conditions | Harvard Math 232B, Princeton MAT 560, MIT 18.725 |
| [mini-cohomology-of-schemes](mini-cohomology-of-schemes/) | Čech cohomology, derived functors, sheaf cohomology on schemes, étale cohomology, cohomology of projective space, Riemann-Roch for curves, K3 surface cohomology | Harvard Math 259X, Berkeley Math 256B |
| [mini-curves-surfaces](mini-curves-surfaces/) | Algebraic curves, Riemann-Roch for curves, algebraic surfaces, intersection theory on surfaces, minimal model program foundations, bridges to algebra and computation | Harvard Math 233, Columbia Math GR6360 |
| [mini-derived-categories](mini-derived-categories/) | Chain complexes, homotopy category K(A), triangulated categories, localization at quasi-isomorphisms, derived functors Ext/RHom, spectral sequences, DG categories | Harvard Math 253X, UChicago Math 28400 |
| [mini-intersection-theory](mini-intersection-theory/) | Cycles, rational equivalence, Chow groups, intersection product, multiplicities, Chern classes, Bezout theorem, projection formula, deformation to normal cone (Fulton) | MIT 18.726, Harvard Math 263 |
| [mini-moduli-spaces](mini-moduli-spaces/) | Fine/coarse moduli spaces, representable functors, Hilbert schemes, moduli of curves M_g, moduli of vector bundles, stacks, Bridgeland stability conditions | Harvard Math 259X, MIT 18.727 |

## Design Philosophy

- **Zero external dependencies beyond Lean 4** — pure Lean 4 (v4.7.0) formalizations, only core `Init` and `Std`
- **Self-contained modules** — each directory has its own `lakefile.lean`, `Main.lean`, `docs/`, `examples/`, `Benchmark/` or `Test/`
- **Theory-to-code mapping** — every module includes `docs/` with course-alignment notes, theorem-by-theorem references, and proof strategies
- **Predicate-based approach** — uses Lean's predicate types rather than `Set` for constructive, computable formalizations that align with classical algebraic geometry

## Building

Each module is standalone. Navigate to a module directory and run:

```bash
cd mini-schemes
lake build       # build the module
lake exe main    # run the main entry point
cd ../mini-cohomology-of-schemes
lake build       # build with cohomology computations
```

Requires **Lean 4** (v4.7.0) with **lake** build tool.

## Project Structure

```
mini-algebraic-geometry-schemes/
├── mini-schemes/                # Core Scheme Theory (Spec, Zariski, Ringed Spaces, Sheaves)
├── mini-affine-varieties/       # Affine Varieties (Hilbert Nullstellensatz, Dimension)
├── mini-coherent-sheaves/       # Coherent Sheaves (Serre Duality, Riemann-Roch, Vanishing)
├── mini-cohomology-of-schemes/  # Scheme Cohomology (Čech, Étale, Projective Space)
├── mini-curves-surfaces/        # Algebraic Curves & Surfaces
├── mini-derived-categories/     # Derived Categories (Triangulated, Derived Functors, DG)
├── mini-intersection-theory/    # Intersection Theory (Chow Groups, Chern Classes, Fulton)
└── mini-moduli-spaces/          # Moduli Spaces (Hilbert Schemes, Stacks)
```

## License

MIT
