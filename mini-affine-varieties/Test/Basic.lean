/-
# Test.Basic

Smoke tests for MiniAffineVarieties module.
Verifies that core definitions compile and basic evaluations work.
-/
import MiniAffineVarieties

open MiniAffineVarieties
open PolyExpr
open Ideal

-- L1: Test polynomial construction and evaluation
def test_poly_const : PolyExpr ℚ 2 := .const 42
#eval eval test_poly_const (λ _ => 0)  -- should be 42

def test_poly_var : PolyExpr ℚ 2 := .var ⟨0, by decide⟩
#eval eval test_poly_var (λ i => match i with | ⟨0,_⟩ => 7 | ⟨1,_⟩ => 0)  -- should be 7

def test_poly_add : PolyExpr ℚ 2 := test_poly_const + test_poly_var
#eval eval test_poly_add (λ i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => 0)  -- 43

def test_poly_mul : PolyExpr ℚ 2 := .var ⟨0, by decide⟩ * .var ⟨1, by decide⟩
#eval eval test_poly_mul (λ i => match i with | ⟨0,_⟩ => 3 | ⟨1,_⟩ => 5)  -- 15

-- L1: Test ideal operations
def test_zero_ideal : Ideal (PolyExpr ℚ 2) := Ideal.zero
def test_unit_ideal : Ideal (PolyExpr ℚ 2) := Ideal.unit

#eval (0 : PolyExpr ℚ 2) ∈ test_zero_ideal  -- true
#eval (1 : PolyExpr ℚ 2) ∈ test_unit_ideal  -- true

-- L1: Test V and I operations
def test_V_of_zero : Set (Fin 2 → ℚ) := V ℚ 2 test_zero_ideal
#eval test_V_of_zero.nonempty  -- true (A² is nonempty)

-- L3: Test algebraic set construction
def test_algebraic_set : AlgebraicSet ℚ 2 := AlgebraicSet.affineNSpace
#eval Set.univ.nonempty  -- true

-- L6: Test concrete polynomial examples
def test_parabola_point : Fin 2 → ℚ := λ i => match i with
  | ⟨0,_⟩ => 3
  | ⟨1,_⟩ => 9  -- = 3²

#eval eval parabola_poly test_parabola_point  -- should be 0

def test_axes_point : Fin 2 → ℚ := λ i => match i with
  | ⟨0,_⟩ => 0
  | ⟨1,_⟩ => 42

#eval eval axes_poly test_axes_point  -- should be 0

-- L6: Test that off-curve points give nonzero
def test_off_parabola : Fin 2 → ℚ := λ _ => 1
#eval eval parabola_poly test_off_parabola  -- should be -1+1=0? No: 1-1²=1-1=0 (1,1) IS on parabola
-- Let's use (1, 2)
#eval eval parabola_poly (λ i => match i with | ⟨0,_⟩ => 1 | ⟨1,_⟩ => 2)  -- 2-1=1 ≠ 0

-- Test basic algebraic operations
def test_sub : PolyExpr ℚ 2 := test_poly_const - test_poly_var
#eval eval test_sub (λ i => match i with | ⟨0,_⟩ => 7 | ⟨1,_⟩ => 0)  -- 42-7=35

-- Test degree function
#eval deg (test_poly_const)  -- 0
#eval deg (test_poly_var)   -- 1
#eval deg (test_poly_mul)   -- 2

-- Test commutativity of addition
def test_comm_add : PolyExpr ℚ 2 := .var ⟨0, by decide⟩ + .var ⟨1, by decide⟩
def test_comm_add' : PolyExpr ℚ 2 := .var ⟨1, by decide⟩ + .var ⟨0, by decide⟩
#eval eval test_comm_add (λ i => match i with | ⟨0,_⟩ => 2 | ⟨1,_⟩ => 3)  -- 5
#eval eval test_comm_add' (λ i => match i with | ⟨0,_⟩ => 2 | ⟨1,_⟩ => 3) -- 5 (same result)

-- Test ideal membership
def test_principal_ideal : Ideal (PolyExpr ℚ 2) := Ideal.principal (.var ⟨0, by decide⟩)
#eval (.var ⟨0, by decide⟩) ∈ test_principal_ideal  -- should be true
#eval (.var ⟨1, by decide⟩) ∈ test_principal_ideal  -- should be false

-- Test that V((x)) is the y-axis {x=0}
#eval eval (.var ⟨0, by decide⟩) (λ i => match i with | ⟨0,_⟩ => 0 | ⟨1,_⟩ => 42)  -- 0 (on V(x))

-- L4: Weak Nullstellensatz check (conceptual)
-- If I is proper, V(I) is nonempty
def test_proper_ideal : Ideal (PolyExpr ℚ 2) := Ideal.zero
#eval (1 : PolyExpr ℚ 2) ∉ test_proper_ideal  -- true (proper)

end MiniAffineVarieties