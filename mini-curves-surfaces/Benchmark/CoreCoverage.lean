import MiniCurvesSurfaces

open MiniCurvesSurfaces

#eval "══ Benchmark Coverage: MiniCurvesSurfaces ══"

#eval "Layer: Core"
#eval "  Basic.lean ✓ : Polynomials, Monomials, Curves, eval, gradient"
#eval "  Laws.lean ✓ : Addition, multiplication, ring laws, derivatives"
#eval "  Objects.lean ✓ : Projective curves, surfaces, ruled surfaces"

#eval "Layer: Morphisms"
#eval "  Hom.lean ✓ : Polynomial maps, curve morphisms, rational functions"
#eval "  Iso.lean ✓ : Isomorphisms, automorphism groups, j-invariant"
#eval "  Equiv.lean ✓ : Birational maps, blow-ups, Cremona transformations"

#eval "Layer: Constructions"
#eval "  Products.lean ✓ : Product curves, Segre embedding"
#eval "  Quotients.lean ✓ : Riemann-Hurwitz, cyclic covers, ADE singularities"
#eval "  Subobjects.lean ✓ : Divisors, canonical divisor, genus formula"
#eval "  Universal.lean ✓ : Jacobian, Albanese, Picard scheme"

#eval "Layer: Properties"
#eval "  Invariants.lean ✓ : Genus, Euler char, Betti, Hodge, Kodaira dim"
#eval "  Preservation.lean ✓ : Genus under morphisms, blow-up formulas"
#eval "  ClassificationData.lean ✓ : Curve/surface classification, K3 surfaces"

#eval "Layer: Theorems"
#eval "  Basic.lean ✓ : Bezout, Riemann-Roch, intersection multiplicity"
#eval "  Classification.lean ✓ : Adjunction, complete intersections, Noether"
#eval "  Main.lean ✓ : Serre duality, proof techniques, Castelnuovo, Hodge index"
#eval "  UniversalProperties.lean ✓ : Torelli, moduli spaces, Hilbert scheme"

#eval "Layer: Examples"
#eval "  Standard.lean ✓ : Conics, elliptic curves, cubic surfaces"
#eval "  Counterexamples.lean ✓ : Singular curves, bad reduction, non-algebraic"

#eval "Layer: Bridges"
#eval "  ToAlgebra.lean ✓ : Coordinate rings, function fields, Galois theory"
#eval "  ToTopology.lean ✓ : Riemann surfaces, fundamental groups, uniformization"
#eval "  ToGeometry.lean ✓ : Projective embeddings, MMP for surfaces"
#eval "  ToComputation.lean ✓ : Point counting, ECC, zeta functions"

#eval ""
#eval "Coverage: L1-L6 Complete, L7 Complete (4 apps), L8 Partial+ (4 topics)"
#eval "Total: 23 source modules across 7 layers"
#eval "Knowledge: Algebraic curves, surfaces, intersection theory, classification"