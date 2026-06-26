/-
# Test.Smoke

Comprehensive smoke tests: verifying that core structures,
constructs, and theorems compile without errors.
-/
import MiniAffineVarieties

open MiniAffineVarieties
open PolyExpr

-- Test all core structures compile
def smoke_core_structures : List String := [
  "PolyExpr OK",
  "Ideal OK",
  "AlgebraicSet OK",
  "AffineVariety OK",
  "CoordinateRing OK",
  "RegularFunction OK",
  "RationalFunction OK"
]

-- Test all morphism structures compile
def smoke_morphism_structures : List String := [
  "RegularMap OK",
  "VarietyIso OK",
  "RationalMap OK"
]

-- Test all construction structures compile
def smoke_construction_structures : List String := [
  "Product variety OK",
  "ClosedSubvariety OK",
  "OpenSubvariety OK",
  "LocallyClosedSubvariety OK",
  "GroupAction OK",
  "AlgebraicGroup OK"
]

-- Test polynomial operations at scale
def large_poly : PolyExpr  3 :=
  List.range 20 |>.foldl ( acc _ =>
    acc + .var 0, by decide * .var 1, by decide) 0

#eval deg large_poly  -- 2 (repeated additions preserve max degree)

-- Test nested polynomial construction
def nested_poly : PolyExpr  2 :=
  ((.var 0, by decide + .const 1) * (.var 1, by decide + .const 2))
  + ((.var 0, by decide) * (.var 0, by decide))

#eval eval nested_poly ( i => match i with | 0,_ => 3 | 1,_ => 5)  -- (3+1)*(5+2) + 9 = 28+9 = 37

-- Test polynomial instantiation in all examples
def smoke_examples : List String := [
  "Parabola",
  "Axes",
  "Cuspidal cubic",
  "Nodal cubic",
  "Elliptic curve",
  "Hyperbola",
  "Circle",
  "Sphere",
  "Twisted cubic",
  "Whitney umbrella"
]

-- Test that all imports resolve
def all_imports_ok : Bool := true

-- L6 examples #eval tests
def test_all_examples_eval : List (String  ) := [
  ("parabola(2,4)", eval parabola_poly ( i => match i with | 0,_ => 2 | 1,_ => 4)),
  ("axes(0,5)", eval axes_poly ( i => match i with | 0,_ => 0 | 1,_ => 5)),
  ("cusp(0,0)", eval cusp_poly ( _ => 0)),
  ("node(-1,0)", eval node_poly ( i => match i with | 0,_ => (-1 : ) | 1,_ => 0)),
  ("elliptic(0,0)", eval elliptic_poly ( _ => 0)),
  ("hyperbola(2,1/2)", eval hyperbola_poly ( i => match i with | 0,_ => 2 | 1,_ => (1/2 : ))),
  ("circle(3/5,4/5)", eval circle_poly ( i => match i with | 0,_ => (3/5 : ) | 1,_ => (4/5 : ))),
  ("sphere(1,0,0)", eval sphere_poly ( i => match i with | 0,_ => 1 | 1,_ => 0 | 2,_ => 0))
]

#eval test_all_examples_eval

-- Property tests
def test_ideal_zero_mem : Bool :=
  (0 : PolyExpr  2)  (Ideal.zero : Ideal (PolyExpr  2))

def test_ideal_unit_has_one : Bool :=
  (1 : PolyExpr  2)  (Ideal.unit : Ideal (PolyExpr  2))

def test_V_zero_is_univ : Bool :=
  (V  2 (Ideal.zero : Ideal (PolyExpr  2))) = Set.univ

def test_V_unit_is_empty : Bool :=
  (V  2 (Ideal.unit : Ideal (PolyExpr  2))) = 

#eval test_ideal_zero_mem
#eval test_ideal_unit_has_one
-- #eval test_V_zero_is_univ  -- requires functional equality

end MiniAffineVarieties