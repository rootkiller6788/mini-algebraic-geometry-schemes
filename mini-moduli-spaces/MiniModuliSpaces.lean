/-
# MiniModuliSpaces

Moduli space theory in algebraic geometry, formalized in Lean 4:
fine/coarse moduli spaces, representable functors, Hilbert schemes,
moduli of curves (M_g), moduli of vector bundles, GIT quotients,
deformation theory, and fundamental structure theorems.

## Sub-packages
- Core         -- ModuliProblem, ModuliFunctor, FineModuliSpace, CoarseModuliSpace
- Morphisms    -- Morphisms of moduli problems, natural transformations
- Constructions -- GIT quotients, product moduli, universal families
- Properties   -- Tangent spaces, obstruction theory, invariants
- Theorems     -- Existence theorems, Deligne-Mumford, Narasimhan-Seshadri
- Examples     -- M_g, Hilbert schemes, Quot schemes, moduli of bundles
- Bridges      -- Enumerative geometry, physics, algebra, topology
- Advanced     -- Stacks, derived moduli, virtual fundamental classes
-/
import MiniModuliSpaces.Core.All
import MiniModuliSpaces.Morphisms.All
import MiniModuliSpaces.Constructions.All
import MiniModuliSpaces.Properties.All
import MiniModuliSpaces.Theorems.All
import MiniModuliSpaces.Examples.All
import MiniModuliSpaces.Bridges.All
import MiniModuliSpaces.Advanced.All
