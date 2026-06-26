# Knowledge Graph: Cohomology of Schemes

## L1: Definitions
- AbGroup: abelian group (carrier, add, zero, neg, axioms)
- AbGroupHom: homomorphism of abelian groups
- CommRing: commutative ring (0,1,+,-,*, axioms)
- Module R: R-module (carrier, +, smul, axioms)
- TopSpace: topological space (opens, axioms)
- PresheafAb: presheaf of abelian groups (F, res, id, comp)
- SheafAb: sheaf of abelian groups (locality, gluing)
- QuasiCoherentSheaf: quasi-coherent sheaf on an affine scheme
- IdealSheaf, TangentSheaf, CoherentSheaf
- CechComplex, SpectralSequence, Resolution
- AmpleLineBundle, EtaleSite, DerivedCategory

## L2: Core Concepts
- AbGroupHom.kernel, .image, .comp, .id
- Module.Hom with kernel, image, injective, surjective
- SheafMorphism with naturality condition
- ExactAtSheaf, ShortExactSheaf (exact sequences of sheaves)
- Global sections functor Gamma(X, -)
- Cech cochain group, Cech differential
- Higher direct images R^i f_*
- Inverse image f^{-1} and pullback f^*
- Ext groups Ext^i(F, G)
- Trace map, Serre duality pairing

## L3: Math Structures
- Category of sheaves Sh(X): objects, morphisms, composition
- Right derived functors R^i F of a left exact functor
- Sheaf cohomology as R^i Gamma(X, F)
- Cech cohomology H^p_Cech(U, F) via open covers
- Leray spectral sequence: E_2^{p,q} = H^p(Y, R^q f_* F) => H^{p+q}(X, F)
- Cech-to-derived spectral sequence
- Local-to-global Ext spectral sequence
- Hodge-to-de Rham spectral sequence
- Filtered complexes, double complexes, exact couples
- Canonical sheaf / dualizing sheaf omega_X
- Koszul complex, Godement resolution

## L4: Fundamental Theorems
- Snake lemma for sheaves (connecting homomorphism)
- Five lemma for sheaves (isomorphism criterion)
- Serre vanishing (affine): H^n(Spec R, F~) = 0 for n > 0
- Serre computation (projective): H^i(P^n, O(d)) determination
- Serre duality: perfect pairing H^i x Ext^{n-i}(-,omega) -> H^n(omega) = k
- Grothendieck vanishing: H^i(X, F) = 0 for i > dim X
- Kodaira vanishing: H^i(X, omega otimes L) = 0 (i > 0, L ample, char 0)
- Cartan-Serre: Cech = derived for separated schemes
- Grothendieck-Serre duality for proper morphisms
- Cohomology and base change theorems

## L5: Proof Techniques
1. Element chasing on sheaf sections
2. Cech cocycle computation with explicit cover
3. Spectral sequence degeneration (acyclicity)
4. Devissage / Noetherian induction
5. Koszul resolution for complete intersections
6. Reduction to projective space via Chow's lemma
7. Covering tricks (Kawamata) for vanishing
8. Derived category methods (Grothendieck-Verdier)

## L6: Canonical Examples (#eval verified)
- P^1: H^0(O(d)) = d+1 (d>=0), H^1(O(d)) = -d-1 (d<=-2)
- P^2: H^0(O(d)) = C(d+2,2), H^2(O(d)) = C(-d-1,2)
- Elliptic curve: h^0(O) = h^1(O) = 1
- Euler characteristic: chi(P^1, O(d)) = d+1
- K3 surface: h^1(O) = 0, h^2(O) = 1
- Genus from cohomology: g = h^1(C, O_C)
- Serre duality checks on P^1, P^2
- Grassmannians: H^i(Gr(k,n), O) = 0 for i > 0
- Complete intersections via Koszul
- Veronese embedding dimensions

## L7: Applications
1. Riemann-Roch for curves: chi(L) = deg(L) + 1 - g
2. Riemann-Roch for surfaces: chi(D) = chi(O) + (D^2 - D.K)/2
3. Hirzebruch-Riemann-Roch: chi(E) = deg(ch(E).td(X))
4. Deformation theory: H^1(T_X) = first-order deformations
5. Moduli spaces: M_g dimension = 3g-3 = dim H^1(C, T_C)
6. Hilbert schemes: tangent = H^0(N), obstructions = H^1(N)
7. Kodaira-Spencer map for families
8. Weil conjectures via l-adic cohomology
9. Galois representations from etale cohomology
10. Algebraic cycles via motivic cohomology

## L8: Advanced Topics
- Derived categories D^b_coh(X) of coherent sheaves
- Grothendieck-Verdier duality: Rf_* adjoint to f^!
- Fourier-Mukai transforms and derived equivalences
- Semiorthogonal decompositions, Beilinson's collection
- Bridgeland stability conditions on D^b(X)
- Etale cohomology: proper/smooth base change
- l-adic cohomology and Galois representations
- Perverse sheaves on etale site
- Crystalline cohomology and de Rham comparison
- Derived deformation theory (Lurie)

## L9: Research Frontiers (Documented)
- Grothendieck motives and the Standard Conjectures
- Voevodsky's triangulated motives DM(k)
- Mixed motives: conjectural abelian category MM(k)
- Motivic homotopy theory SH(k) (Morel-Voevodsky)
- Noncommutative motives (Kontsevich)
- Condensed mathematics and motives (Clausen-Scholze)
- p-adic Hodge theory: Fontaine's comparison isomorphisms
- Motivic Galois group and Tannakian formalism
- Bloch-Beilinson filtration on Chow groups
- Beilinson's conjectures on L-function values
