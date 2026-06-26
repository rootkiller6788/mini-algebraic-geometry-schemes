/-
MiniDerivedCategories - Derived Categories in Lean 4
Entry point: run with `lake env lean --run Main.lean`
-/

import MiniDerivedCategories

open MiniDerivedCategories

def main : IO Unit := do
  IO.println "═══════════════════════════════════════════════════════"
  IO.println "  MiniDerivedCategories v0.1.0"
  IO.println "  Derived Categories: Triangulated, Derived Functors, Duality"
  IO.println "═══════════════════════════════════════════════════════"
  IO.println s!"  Chain Complexes: Z-graded with differential d^2=0"
  IO.println s!"  Homotopy Category K(A): chain maps modulo homotopy"
  IO.println s!"  Derived Category D(A): localization at quasi-isomorphisms"
  IO.println s!"  Derived Functors: Ext^n via resolutions"
  IO.println s!"  Spectral Sequences from filtered complexes"
  IO.println s!"  Applications: Algebraic Geometry, Representation Theory"
  IO.println ""
  IO.println "  Self-contained - no external dependencies"
