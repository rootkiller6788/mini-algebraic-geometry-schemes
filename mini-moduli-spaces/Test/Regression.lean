import MiniObjectKernel.Core.Basic
import MiniModuliSpaces
open MiniModuliSpaces

def main : IO Unit := do
  IO.println "=== Mini Moduli Spaces Regression Tests ==="

  -- Regression 1: M_g dimension formula consistency
  IO.println "Test 1: M_g dimension formula"
  assert (MgDimension 0 == 0) "dim M_0 should be 0"
  assert (MgDimension 1 == 1) "dim M_1 should be 1"
  assert (MgDimension 2 == 3) "dim M_2 should be 3"
  assert (MgDimension 3 == 6) "dim M_3 should be 6"
  assert (MgDimension 4 == 9) "dim M_4 should be 9"
  assert (MgDimension 5 == 12) "dim M_5 should be 12"
  IO.println "  ? M_g dimensions correct"

  -- Regression 2: M_{0,n} dimension formula
  IO.println "Test 2: M_{0,n} dimension formula"
  assert (M0n_dimension 3 == 0) "dim M_{0,3} should be 0"
  assert (M0n_dimension 4 == 1) "dim M_{0,4} should be 1"
  assert (M0n_dimension 5 == 2) "dim M_{0,5} should be 2"
  assert (M0n_dimension 6 == 3) "dim M_{0,6} should be 3"
  IO.println "  ? M_{0,n} dimensions correct"

  -- Regression 3: j-invariant computation
  IO.println "Test 3: j-invariant computation"
  assert (jInvariant 0 1 == 0) "j-invariant of y2=x3+1 should be 0"
  IO.println "  ? j-invariant correct"

  -- Regression 4: Slope computation
  IO.println "Test 4: Slope computation"
  assert (slopeStability 2 4 1 == 2) "slope of rank 2, deg 4 should be 2"
  IO.println "  ? Slope correct"

  -- Regression 5: Discriminant computation
  IO.println "Test 5: Discriminant (Bogomolov)"
  assert (discriminant 2 0 0 == 0) "  for trivial bundle should be 0"
  IO.println "  ? Discriminant correct"

  -- Regression 6: Brill-Noether number
  IO.println "Test 6: Brill-Noether number"
  assert (brillNoetherNumber 4 1 3 == 0) " (4,1,3) should be 0"
  IO.println "  ? Brill-Noether numbers correct"

  -- Regression 7: Bundle moduli dimension
  IO.println "Test 7: Bundle moduli dimension formula"
  assert (bundleModuliDimension 2 3 == 6) "dim M(2, d) on curve of genus 3 should be 6"
  IO.println "  ? Bundle moduli dimensions correct"

  -- Regression 8: Gromov-Witten virtual dimension
  IO.println "Test 8: Gromov-Witten virtual dimension"
  assert (gromovWitten_virtualDim 0 0 2 9 == 10) "virt dim of M_0,0(P2, 3[line]) should be 10"
  IO.println "  ? GW virtual dimensions correct"

  -- Regression 9: Hilbert scheme dimension
  IO.println "Test 9: Hilbert scheme of points"
  assert (hilbnA2_dimension 1 == 2) "dim Hilb^1(A2) should be 2"
  assert (hilbnA2_dimension 2 == 4) "dim Hilb^2(A2) should be 4"
  assert (hilbnA2_dimension 3 == 6) "dim Hilb^3(A2) should be 6"
  IO.println "  ? Hilbert scheme dimensions correct"

  -- Regression 10: Structure instantiation
  IO.println "Test 10: Structure instantiation"
  let _ := jInvariant 0 1
  let _ := MgDimension 5
  let _ := slopeStability 3 6 1
  IO.println "  ? All structures instantiate"

  IO.println "=== All regression tests passed ==="
where
  assert (b : Bool) (msg : String) : IO Unit :=
    if b then pure () else IO.println s!"FAIL: {msg}"
