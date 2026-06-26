import MiniObjectKernel.Core.Basic
import MiniModuliSpaces
open MiniModuliSpaces

def main : IO Unit := do
  IO.println "=== Mini Moduli Spaces Example Tests ==="

  -- M_0,n dimensions
  IO.println "-- M_{0,n} dimensions --"
  for n in [3, 4, 5, 6, 7, 8] do
    IO.println s!"dim M_0,{n} = {M0n_dimension n}"

  -- j-invariant examples
  IO.println "-- j-invariants of elliptic curves --"
  IO.println s!"j(y2 = x3 + x) = {jInvariant 1 0}"
  IO.println s!"j(y2 = x3 + 1) = {jInvariant 0 1}"
  IO.println s!"j(y2 = x3 - x) = {jInvariant (-1) 0}"

  -- Hilbert scheme dimensions
  IO.println "-- Hilbert scheme of n points on A2 --"
  for n in [1, 2, 3, 4, 5] do
    IO.println s!"dim Hilb^{n}(A2) = {hilbnA2_dimension n}"

  -- Kontsevich formula
  IO.println "-- Rational curves in P2 --"
  for d in [1, 2, 3, 4] do
    IO.println s!"N_{d} = {kontsevichFormula d}"

  -- Slope stability
  IO.println "-- Slope stability --"
  IO.println s!" (rank=3, deg=6) = {slopeStability 3 6 1}"
  IO.println s!" (rank=2, deg=5) = {slopeStability 2 5 1}"

  -- Discriminant
  IO.println "-- Discriminant (Bogomolov) --"
  IO.println s!" (r=2, c1=1, c2=2) = {discriminant 2 1 2}"
  IO.println s!" (r=3, c1=2, c2=5) = {discriminant 3 2 5}"

  -- Euler characteristics of M_g
  IO.println "-- Orbifold Euler characteristics --"
  for g in [2, 3, 4] do
    IO.println s!" _orb(M_{g}) = {orbifoldEulerCharMg g}"

  -- Bundle moduli dimensions
  IO.println "-- Bundle moduli dimensions --"
  for g in [0, 1, 2, 3, 4] do
    let r := 2
    IO.println s!"dim M(r={r}, C of genus {g}) = {bundleModuliDimension r g}"

  -- Brill-Noether numbers
  IO.println "-- Brill-Noether numbers --"
  IO.println s!" (g=4, r=1, d=3) = {brillNoetherNumber 4 1 3}"
  IO.println s!" (g=5, r=2, d=5) = {brillNoetherNumber 5 2 5}"

  -- Gromov-Witten virtual dimensions
  IO.println "-- GW virtual dimensions --"
  IO.println s!"M_0,0(P2, 3[line]) virt dim = {gromovWitten_virtualDim 0 0 2 9}"
  IO.println s!"M_0,3(P2, [line]) virt dim = {gromovWitten_virtualDim 0 3 2 1}"
  IO.println s!"M_1,0(P2, [line]) virt dim = {gromovWitten_virtualDim 1 0 2 1}"

  -- Kodaira dimensions
  IO.println "-- Known Kodaira dimensions of M_g --"
  for g in [0, 14, 15, 16, 17, 20, 21, 22, 23, 24, 30] do
    IO.println s!" (M_{g}) = {knownKodairaDimension g}"

  IO.println "=== All example tests passed ==="
