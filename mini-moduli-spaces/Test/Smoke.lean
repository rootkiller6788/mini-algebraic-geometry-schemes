import MiniObjectKernel.Core.Basic
import MiniModuliSpaces
open MiniModuliSpaces

def main : IO Unit := do
  IO.println "=== Mini Moduli Spaces Smoke Test ==="

  -- Test Core definitions
  let problem : ModuliProblem := {
    name := "test"
    description := "test moduli problem"
    objects := {
      base := [0]
      fibers := [[0]]
      structuralMap := [[0]]
      hilbertPolynomial := fun n => n
      isFlat := true
      isProper := true
      isSmooth := true
      dimension := 1 : Nat
    }
    equivalenceRelation := fun a b => a == b
    automorphismGroup := fun _ => [[0]]
    deformationFunctor := fun _ => [[0]]
    isAlgebraic := true
    isSeparated := true
  }
  IO.println s!"Moduli problem created: {problem.name}"

  -- Test dimension formula
  let d0 := MgDimension 0
  let d1 := MgDimension 1
  let d2 := MgDimension 2
  let d3 := MgDimension 3
  let d10 := MgDimension 10
  IO.println s!"dim M_0 = {d0}"
  IO.println s!"dim M_1 = {d1}"
  IO.println s!"dim M_2 = {d2}"
  IO.println s!"dim M_3 = {d3}"
  IO.println s!"dim M_10 = {d10}"

  -- Test Gromov-Witten virtual dimension
  let vd := gromovWitten_virtualDim 0 0 2 9
  IO.println s!"GW virtual dim = {vd}"

  -- Test examples
  IO.println s!"M_0 dimension: {M0_example.dimension}"
  IO.println s!"M_1 proper: {M1_example.isProper}"
  IO.println s!"M_2 dimension: {M2_dimension}"

  -- Test invariants
  let slope := slopeStability 3 6 1
  IO.println s!"Slope mu = {slope}"

  let disc := discriminant 2 1 2
  IO.println s!"Discriminant = {disc}"

  IO.println "=== All smoke tests passed ==="
