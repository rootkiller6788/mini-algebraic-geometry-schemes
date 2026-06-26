/-
# MiniCurvesSurfaces: Bridges 鈥?To Geometry (L7)

Projective embeddings, canonical curves, pluricanonical maps,
minimal model program for surfaces.
-/

import MiniCurvesSurfaces.Core.Basic
import MiniCurvesSurfaces.Properties.Invariants
import MiniCurvesSurfaces.Constructions.Subobjects

namespace MiniCurvesSurfaces

/-! ## Projective Embeddings 鈥?L7 -/

/-- By Riemann-Roch: a divisor D with deg(D) 鈮?2g+1 is very ample,
    giving an embedding C 鈫?P^N where N = deg(D) - g. -/
def veryAmpleEmbeddingDim (degD g : Nat) : Nat := degD - g

/-- Canonical embedding: for non-hyperelliptic curves of genus g 鈮?3,
    |K| embeds C as a curve of degree 2g-2 in P^{g-1}. -/
def canonicalEmbeddingDim (g : Nat) : Nat :=
  if g >= 3 then g - 1 else 0

/-- Bicanonical map: |2K| is birational for g 鈮?2. -/
def bicanonicalMapDim (g : Nat) : Nat :=
  if g >= 2 then 3*g - 4 else 0

/-- Tricanonical map: |3K| is very ample for all g 鈮?2. -/
def tricanonicalIsVeryAmple : String :=
  "3K embeds C for all g 鈮?2 (universal projective embedding)"

/-! ## Intersection Theory on Surfaces 鈥?L7 -/

/-- For divisors C, D on a surface S, the intersection number C路D
    can be defined via Euler characteristic. -/
def intersectionNumberFormula : String :=
  "(C路D) = 蠂(O_S) - 蠂(O_S(-C)) - 蠂(O_S(-D)) + 蠂(O_S(-C-D))"

/-! ## Minimal Model Program for Surfaces 鈥?L8 -/

/-- Contract (-1)-curves until none remain 鈫?minimal model.
    Minimal models are: P2, ruled surfaces, or surfaces with K nef. -/
def surfaceMMP : String :=
  "Contract (-1)-curves 鈫?minimal model (P2, ruled, or K nef)"

/-- Abundance for surfaces: K nef 鈬?K semi-ample.
    This gives the Iitaka fibration 蠁_{|mK|} for m >> 0. -/
def abundanceForSurfaces : String :=
  "K nef 鈬?mK base-point-free for some m > 0 (Kawamata-Shokurov)"

#eval veryAmpleEmbeddingDim 5 2
#eval canonicalEmbeddingDim 3
#eval canonicalEmbeddingDim 5
#eval bicanonicalMapDim 2
#eval bicanonicalMapDim 3

/-! ## Embedding Theorems for Curves — L7

For a smooth projective curve C of genus g:
  - g=0: C ≅ P^1, the anticanonical embedding is P^1 ↪ P^1 (identity)
  - g=1: C embeds in P^2 as a cubic (via |3·O|, any point O)
  - g=2: C is hyperelliptic, canonical map is 2:1 to P^1
  - g≥3 non-hyperelliptic: |K| embeds C ↪ P^{g-1} as degree 2g-2

Max Noether's theorem: for g≥3, a general curve is non-hyperelliptic
and the canonical embedding is projectively normal. -/

def isProjectivelyNormal (g : Nat) : Bool := g ≥ 3

/-- Enriques-Babbage theorem: if the canonical map φ_|K|: C -> P^{g-1}
    is NOT an embedding, then C is either:
    1. Hyperelliptic (φ_|K| is 2:1 onto rational normal curve)
    2. Trigonal (g≥5, φ_|K| embeds C on a rational normal scroll)
    3. Plane quintic (g=6, φ_|K| factors through Veronese surface) -/

def canonicalMapExceptionType (g : Nat) : String :=
  if g == 0 then "P^1" else if g == 1 then "Cubic in P^2"
  else if g == 2 then "2:1 to P^1 (hyperelliptic)"
  else "Embedding in P^{g-1}, degree 2g-2"

/-! ## Surfaces: Detailed Classification by Kodaira Dimension — L7

κ = -∞ (Kodaira dimension -∞): precisely the ruled surfaces.
  - Rational surfaces: P^2, Hirzebruch Σ_n, blow-ups of P^2
  - Ruled surfaces over curves C of genus g>0: P^1-bundles

κ = 0: precisely the surfaces with K_S numerically trivial.
  - K3: K_S = 0, q=0, p_g=1, b_2=22, deformation equivalent
  - Enriques: 2K_S = 0, K_S ≠ 0, q=0, p_g=0, π_1=Z/2
  - Abelian: C^2/Λ, K_S = 0, q=2, p_g=1
  - Bielliptic/hyperelliptic: quotients of abelian surfaces

κ = 1: properly elliptic surfaces π: S -> C
  - General fiber is an elliptic curve
  - χ(S) = Σ χ(F_t) where F_t are singular fibers
  - K_S numerically equivalent to sum of multiples of fibers

κ = 2: surfaces of general type
  - K_S is big (K^2 > 0), canonical model is projective
  - Castelnuovo inequality: K^2 ≥ 2p_g - 4 for irregular surfaces
  - Miyaoka-Yau: K^2 ≤ 9χ for minimal surfaces of general type -/

def surfaceKodairaDimensionDescription (kappa : Int) : String :=
  match kappa with
  | -1 => "κ=-∞: Ruled (including rational P^2 and Hirzebruch surfaces)"
  | 0  => "κ=0: K3, Enriques, Abelian, Bielliptic (K trivial or torsion)"
  | 1  => "κ=1: Properly elliptic (fibered over curve, general fiber elliptic)"
  | _  => "κ=2: General type (K big, canonical model exists)"

def k3SurfacesProperties : List String :=
  ["Simply connected, ω_S ≅ O_S",
   "H^2(S,Z) ≅ E8(-1)^2 ⊕ U^3, signature (3,19)",
   "b_2 = 22, ρ ≤ 20",
   "All K3 surfaces are diffeomorphic but not deformation equivalent",
   "Moduli space of dimension 20 (period domain)"]

def enriquesSurfacesProperties : List String :=
  ["π_1(S) = Z/2, double cover is K3 surface",
   "K_S is 2-torsion, K_S ≠ 0",
   "q = p_g = 0, b_2 = 10",
   "b_1 = 0, ρ = 10 (maximal Picard number)"]

def abelianSurfacesProperties : List String :=
  ["S = C^2 / Λ where Λ ≅ Z^4 is a lattice",
   "K_S = 0, q = 2, p_g = 1",
   "Alb(S) ≅ S, dual abelian variety S^dual",
   "End(S) ⊗ Q is a Q-algebra of dimension ≤ 16 (Albert classification)"]

/-! ## Canonical Embedding of Curves — L7

For a non-hyperelliptic curve C of genus g ≥ 3, the canonical map
φ_{|K|}: C -> P^{g-1} is an embedding. The image is a curve of
degree 2g-2 called the canonical curve.

Special cases:
  g=3: canonical curve is a plane quartic (degree 4 in P^2)
  g=4: complete intersection of quadric and cubic in P^3
  g=5: complete intersection of three quadrics in P^4
  g=6: either plane quintic or intersection of quadrics in P^5

Petri's theorem: for g ≥ 4, the ideal of a general canonical curve
is generated by quadrics, except for trigonal curves and plane quintics. -/

/-- The bicanonical map φ_{|2K|}: C -> P^{3g-4} is birational for all g ≥ 2.
    The tricanonical map φ_{|3K|} is an embedding for all g ≥ 2. -/

def pluricanonicalMapDims (g : Nat) : List (String × Nat) :=
  [("|K| dimension", if g ≥ 3 then g-1 else 0),
   ("|2K| dimension", 3*g - 4),
   ("|3K| dimension", 5*g - 6),
   ("|4K| dimension", 7*g - 7)]

/-! ## Surfaces: Castelnuovo-Enriques Classification

Minimal algebraic surfaces over C are classified by Kodaira dimension κ:
  κ=-∞: ruled surfaces (P^2, P^1×C, Hirzebruch surfaces Σ_n)
  κ=0:  K3 surfaces, Enriques surfaces, abelian surfaces, bielliptic
  κ=1:  properly elliptic surfaces (fibration π: S -> C, general fiber elliptic)
  κ=2:  surfaces of general type (canonical model is projective)

The classification uses:
  1. K_S² and χ(O_S) are invariants
  2. Noether formula: K² + e = 12χ
  3. Bogomolov-Miyaoka-Yau inequality: K² ≤ 9χ for general type
  4. Signature theorem: K² + e = 12χ, e = signature - 2·b₂⁺ + b₂⁻ -/

/-- Geography of surfaces: for general type surfaces (κ=2),
    (K², χ) must satisfy: 2χ - 6 ≤ K² ≤ 9χ.
    All integer points in this region occur as invariants of
    simply connected minimal surfaces of general type. -/

def geographyBounds (χ : Int) : String :=
  s!"For χ={χ}: {2*χ-6} ≤ K² ≤ {9*χ}"

#eval pluricanonicalMapDims 3
#eval pluricanonicalMapDims 5
#eval geographyBounds 5
#eval geographyBounds 10

#eval "── Surface Classification ──"
#eval surfaceKodairaDimensionDescription (-1)
#eval surfaceKodairaDimensionDescription 0
#eval surfaceKodairaDimensionDescription 1
#eval surfaceKodairaDimensionDescription 2
#eval isProjectivelyNormal 0
#eval isProjectivelyNormal 2
#eval isProjectivelyNormal 5
#eval canonicalMapExceptionType 0
#eval canonicalMapExceptionType 1
#eval canonicalMapExceptionType 2
#eval canonicalMapExceptionType 3
#eval k3SurfacesProperties
#eval enriquesSurfacesProperties
#eval abelianSurfacesProperties

end MiniCurvesSurfaces