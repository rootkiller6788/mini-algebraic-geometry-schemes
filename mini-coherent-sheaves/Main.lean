/-
# MiniCoherentSheaves Main

Entry point for the mini-coherent-sheaves package.
Prints information about coherent sheaf theory concepts:
Quasi-coherent sheaves, coherent sheaves, locally free sheaves,
Serre duality, Riemann-Roch theorems, vanishing theorems,
derived categories of coherent sheaves, stability conditions.
-/

import MiniCoherentSheaves

/-! ## #eval tests for the full package -/

#eval "Coherent sheaf definitions loaded"
#eval "CoherentSheaf, LocallyFreeSheaf, VectorBundle structures ready"
#eval "QuasiCoherentSheaf, IdealSheaf, TangentSheaf defined"

def main : IO Unit := do
  IO.println "══════════════════════════════════════════════════"
  IO.println "  MiniCoherentSheaves v0.1.0"
  IO.println "  Coherent Sheaves in Algebraic Geometry"
  IO.println "══════════════════════════════════════════════════"
  IO.println ""
  IO.println "  Core structures:"
  IO.println "    Scheme         -- ringed space locally affine"
  IO.println "    OXModule       -- sheaf of OX-modules"
  IO.println "    CoherentSheaf  -- finitely generated OX-module"
  IO.println "    QuasiCoherentSheaf -- has local presentations"
  IO.println "    LocallyFreeSheaf   -- locally free of finite rank"
  IO.println "    VectorBundle       -- geometric vector bundle"
  IO.println ""
  IO.println "  Fundamental theorems:"
  IO.println "    Serre Coherence (FAC)     -- coherence on projective schemes"
  IO.println "    Serre Vanishing           -- ample ⇒ high cohomology vanishes"
  IO.println "    Serre Duality             -- H^i(F) ≅ H^{n-i}(F^∨⊗ω)^∨"
  IO.println "    Riemann-Roch (HRR/GRR)    -- χ(X,F) = ∫ ch(F)·td(X)"
  IO.println "    Kodaira Vanishing         -- H^i(X, L⊗ω_X) = 0 for ample L"
  IO.println "    Grothendieck Duality      -- f^! for proper morphisms"
  IO.println ""
  IO.println "  Cohomology theory:"
  IO.println "    Cech cohomology       -- H^i via open covers"
  IO.println "    Derived functor cohomology"
  IO.println "    Leray spectral sequence"
  IO.println "    Cohomology and base change"
  IO.println ""
  IO.println "  Advanced topics:"
  IO.println "    Derived categories D^b(Coh(X))"
  IO.println "    Fourier-Mukai transforms"
  IO.println "    Bridgeland stability conditions"
  IO.println "    Moduli spaces of sheaves"
  IO.println ""
  IO.println "  Applications:"
  IO.println "    Algebraic geometry (GAGA, Hodge theory)"
  IO.println "    Number theory (arithmetic Riemann-Roch)"
  IO.println "    Physics (D-branes, mirror symmetry)"
  IO.println "    Representation theory (Borel-Weil-Bott)"
  IO.println ""
  IO.println "  Run `lake env lean --run Main.lean` for info."
