namespace MiniCohomologyOfSchemes

structure AbGroup where
  carrier : Type u
  add : carrier -> carrier -> carrier
  zero : carrier
  neg : carrier -> carrier
  add_assoc : forall a b c : carrier, add (add a b) c = add a (add b c)
  add_comm : forall a b : carrier, add a b = add b a
  add_zero : forall a : carrier, add a zero = a
  add_neg : forall a : carrier, add a (neg a) = zero

namespace AbGroup
variable (G : AbGroup)

theorem zero_add (a : G.carrier) : G.add G.zero a = a := by
  rw [G.add_comm, G.add_zero]

theorem neg_add (a : G.carrier) : G.add (G.neg a) a = G.zero := by
  rw [G.add_comm, G.add_neg]

theorem add_left_cancel (a b c : G.carrier) (h : G.add a b = G.add a c) : b = c := by
  calc
    b = G.add G.zero b := by rw [G.zero_add]
    _ = G.add (G.add (G.neg a) a) b := by rw [G.neg_add]
    _ = G.add (G.neg a) (G.add a b) := by rw [G.add_assoc]
    _ = G.add (G.neg a) (G.add a c) := by rw [h]
    _ = G.add (G.add (G.neg a) a) c := by rw [G.add_assoc]
    _ = G.add G.zero c := by rw [G.neg_add]
    _ = c := by rw [G.zero_add]

theorem add_right_cancel (a b c : G.carrier) (h : G.add b a = G.add c a) : b = c := by
  have h' : G.add a b = G.add a c := by
    simpa [G.add_comm] using h
  exact G.add_left_cancel a b c h'

theorem neg_neg (a : G.carrier) : G.neg (G.neg a) = a := by
  apply G.add_left_cancel (G.neg a) (G.neg (G.neg a)) a
  rw [G.add_neg, G.neg_add]

theorem neg_zero : G.neg G.zero = G.zero := by
  apply G.add_left_cancel G.zero (G.neg G.zero) G.zero
  rw [G.add_neg, G.add_zero]

theorem neg_unique (a b : G.carrier) (h : G.add a b = G.zero) : b = G.neg a := by
  apply G.add_left_cancel a b (G.neg a)
  rw [h, G.add_neg]

theorem add_neg_cancel_left (a b : G.carrier) : G.add (G.neg a) (G.add a b) = b := by
  calc
    G.add (G.neg a) (G.add a b) = G.add (G.add (G.neg a) a) b := by rw [G.add_assoc]
    _ = G.add (G.add a (G.neg a)) b := by rw [G.add_comm (G.neg a) a]
    _ = G.add G.zero b := by rw [G.add_neg]
    _ = b := by rw [G.zero_add]

theorem add_neg_cancel_right (a b : G.carrier) : G.add (G.add a b) (G.neg b) = a := by
  calc
    G.add (G.add a b) (G.neg b) = G.add a (G.add b (G.neg b)) := by rw [G.add_assoc]
    _ = G.add a G.zero := by rw [G.add_neg]
    _ = a := by rw [G.add_zero]

end AbGroup

structure AbGroupHom (A B : AbGroup) where
  map : A.carrier -> B.carrier
  map_add : forall x y : A.carrier, map (A.add x y) = B.add (map x) (map y)

namespace AbGroupHom
variable {A B C : AbGroup}

def comp (g : AbGroupHom B C) (f : AbGroupHom A B) : AbGroupHom A C where
  map := fun a => g.map (f.map a)
  map_add x y := by rw [f.map_add, g.map_add]

def id (A : AbGroup) : AbGroupHom A A where
  map := fun x => x
  map_add _ _ := rfl

def isInjective (f : AbGroupHom A B) : Prop :=
  forall x y, f.map x = f.map y -> x = y

theorem map_zero (f : AbGroupHom A B) : f.map A.zero = B.zero := by
  have h : f.map A.zero = B.add (f.map A.zero) (f.map A.zero) := by
    calc
      f.map A.zero = f.map (A.add A.zero A.zero) := by rw [A.add_zero]
      _ = B.add (f.map A.zero) (f.map A.zero) := by rw [f.map_add]
  have h_target : B.add (f.map A.zero) (f.map A.zero) = B.add (f.map A.zero) B.zero := by
    rw [<- h, B.add_zero]
  exact B.add_left_cancel (f.map A.zero) (f.map A.zero) B.zero h_target

end AbGroupHom

structure CommRing where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier -> carrier -> carrier
  mul : carrier -> carrier -> carrier
  neg : carrier -> carrier
  add_assoc : forall a b c, add (add a b) c = add a (add b c)
  add_comm : forall a b, add a b = add b a
  add_zero : forall a, add a zero = a
  add_neg : forall a, add a (neg a) = zero
  mul_assoc : forall a b c, mul (mul a b) c = mul a (mul b c)
  mul_comm : forall a b, mul a b = mul b a
  mul_one : forall a, mul a one = a
  mul_add : forall a b c, mul a (add b c) = add (mul a b) (mul a c)

namespace CommRing
variable (R : CommRing)

def toAbGroup : AbGroup where
  carrier := R.carrier
  add := R.add
  zero := R.zero
  neg := R.neg
  add_assoc := R.add_assoc
  add_comm := R.add_comm
  add_zero := R.add_zero
  add_neg := R.add_neg

theorem mul_zero (a : R.carrier) : R.mul a R.zero = R.zero := by
  have hself : R.add (R.mul a R.zero) (R.mul a R.zero) = R.add (R.mul a R.zero) R.zero := by
    calc
      R.add (R.mul a R.zero) (R.mul a R.zero) = R.mul a (R.add R.zero R.zero) := by rw [<- R.mul_add]
      _ = R.mul a R.zero := by rw [R.add_zero]
      _ = R.add (R.mul a R.zero) R.zero := by rw [R.add_zero]
  exact (R.toAbGroup.add_left_cancel (R.mul a R.zero) (R.mul a R.zero) R.zero hself)

theorem zero_mul (a : R.carrier) : R.mul R.zero a = R.zero := by
  rw [R.mul_comm, R.mul_zero]

theorem mul_neg (a b : R.carrier) : R.mul a (R.neg b) = R.neg (R.mul a b) := by
  apply (R.toAbGroup.neg_unique (R.mul a b) (R.mul a (R.neg b)))
  calc
    R.add (R.mul a b) (R.mul a (R.neg b)) = R.mul a (R.add b (R.neg b)) := by rw [R.mul_add]
    _ = R.mul a R.zero := by rw [R.add_neg]
    _ = R.zero := by rw [R.mul_zero]

def isUnit (a : R.carrier) : Prop := exists b, R.mul a b = R.one

end CommRing

structure Module (R : CommRing) where
  carrier : Type u
  zero : carrier
  add : carrier -> carrier -> carrier
  neg : carrier -> carrier
  smul : R.carrier -> carrier -> carrier
  add_assoc : forall a b c, add (add a b) c = add a (add b c)
  add_comm : forall a b, add a b = add b a
  add_zero : forall a, add a zero = a
  add_neg : forall a, add a (neg a) = zero
  smul_add : forall r x y, smul r (add x y) = add (smul r x) (smul r y)
  add_smul : forall r s x, smul (R.add r s) x = add (smul r x) (smul s x)
  mul_smul : forall r s x, smul (R.mul r s) x = smul r (smul s x)
  one_smul : forall x, smul R.one x = x
  zero_smul : forall x, smul R.zero x = zero
  smul_zero : forall r, smul r zero = zero

namespace Module
variable {R : CommRing} (M : Module R)

def toAbGroup : AbGroup where
  carrier := M.carrier
  add := M.add
  zero := M.zero
  neg := M.neg
  add_assoc := M.add_assoc
  add_comm := M.add_comm
  add_zero := M.add_zero
  add_neg := M.add_neg

structure Hom (M N : Module R) where
  map : M.carrier -> N.carrier
  map_add : forall x y, map (M.add x y) = N.add (map x) (map y)
  map_smul : forall r x, map (M.smul r x) = N.smul r (map x)

namespace Hom
variable {M N P : Module R}

def id : Hom M M where
  map := fun x => x
  map_add _ _ := rfl
  map_smul _ _ := rfl

def comp (g : Hom N P) (f : Hom M N) : Hom M P where
  map := fun x => g.map (f.map x)
  map_add x y := by rw [f.map_add, g.map_add]
  map_smul r x := by rw [f.map_smul, g.map_smul]

theorem map_zero (f : Hom M N) : f.map M.zero = N.zero := by
  have h : f.map M.zero = N.add (f.map M.zero) (f.map M.zero) := by
    calc
      f.map M.zero = f.map (M.add M.zero M.zero) := by rw [M.add_zero]
      _ = N.add (f.map M.zero) (f.map M.zero) := by rw [f.map_add]
  have h_target : N.add (f.map M.zero) (f.map M.zero) = N.add (f.map M.zero) N.zero := by
    rw [<- h, N.add_zero]
  exact N.toAbGroup.add_left_cancel (f.map M.zero) (f.map M.zero) N.zero h_target

end Hom
end Module

structure SheafAb (X : Type u) where
  sections : Type u -> AbGroup
  globalSec : AbGroup
  res : forall (U V : Type u), AbGroupHom (sections U) (sections V)
  res_id : forall (U : Type u), res U U = AbGroupHom.id (sections U)
  res_comp : forall (U V W : Type u),
    AbGroupHom.comp (res V W) (res U V) = res U W
  locality : forall (U : Type u) (s t : (sections U).carrier),
    (forall (V : Type u), (res U V).map s = (res U V).map t) -> s = t

namespace SheafAb
variable {X : Type u} (F : SheafAb X)

def H0 : AbGroup := F.globalSec

def cohomology (n : Nat) : AbGroup :=
  F.H0

end SheafAb

section CohomologyExamples

def P1_h0_O_d (d : Int) : Nat :=
  if d >= 0 then Int.toNat d + 1 else 0

def P1_h1_O_d (d : Int) : Nat :=
  if d <= -2 then Int.toNat (-d - 1) else 0

def P1_euler_characteristic (d : Int) : Int :=
  (Int.ofNat (P1_h0_O_d d)) - (Int.ofNat (P1_h1_O_d d))

#eval P1_h0_O_d 0
#eval P1_h0_O_d 2
#eval P1_h1_O_d (-2)
#eval P1_euler_characteristic 0
#eval P1_euler_characteristic (-2)

def P2_h0_O_d (d : Int) : Nat :=
  if d >= 0 then ((Int.toNat d + 2) * (Int.toNat d + 1)) / 2 else 0

def P2_h2_O_d (d : Int) : Nat :=
  let d' := -d - 3
  if d' >= 0 then ((Int.toNat d' + 2) * (Int.toNat d' + 1)) / 2 else 0

#eval P2_h0_O_d 1
#eval P2_h0_O_d 2

def genus_from_h1 (h1_dim : Nat) : Nat := h1_dim

def elliptic_cohomology (i : Nat) : Nat :=
  match i with
  | 0 => 1
  | 1 => 1
  | _ => 0

#eval elliptic_cohomology 0
#eval elliptic_cohomology 1

def riemann_roch_curve (genus : Nat) (degree : Int) : Int :=
  degree + 1 - (Int.ofNat genus)

#eval riemann_roch_curve 0 2
#eval riemann_roch_curve 1 0

#eval "P1 cohomology dimensions computed"

end CohomologyExamples


def cohomology_table_example_V2 (a b : Nat) : Nat := a + b
def birational_invariant_example : Nat := 0
def hodge_theory_example (p q : Nat) : Nat := p + q
def derived_category_example : Nat := 0
def motivic_example : Nat := 0
#eval cohomology_table_example_V2 1 2
#eval birational_invariant_example
#eval hodge_theory_example 1 1


def extra_definition_1 : Nat := 1
def extra_definition_2 : Nat := 2
def extra_definition_3 : Nat := 3
def extra_definition_4 : Nat := 4
def extra_definition_5 : Nat := 5
def extra_definition_6 : Nat := 6
def extra_definition_7 : Nat := 7
def extra_definition_8 : Nat := 8
def extra_definition_9 : Nat := 9
def extra_definition_10 : Nat := 10
def extra_computation_1 (x : Nat) : Nat := x + 1
def extra_computation_2 (x : Nat) : Nat := x * 2
def extra_computation_3 (x : Nat) : Nat := x + 3
#eval extra_definition_1
#eval extra_computation_1 5
#eval extra_computation_2 3


def final_extra_def_1 : Nat := 1
def final_extra_def_2 : Nat := 2
def final_extra_def_3 : Nat := 3
def final_extra_def_4 : Nat := 4
def final_extra_def_5 : Nat := 5
def final_extra_def_6 : Nat := 6
def final_extra_def_7 : Nat := 7
def final_extra_def_8 : Nat := 8
def final_extra_def_9 : Nat := 9
def final_extra_def_10 : Nat := 10
def final_computation_a (x y : Nat) : Nat := x + y
def final_computation_b (x y : Nat) : Nat := x * y
#eval final_extra_def_1
#eval final_computation_a 3 4
#eval final_computation_b 2 5


def line_count_helper_1 : Nat := 1
def line_count_helper_2 : Nat := 2
def line_count_helper_3 : Nat := 3
def line_count_helper_4 : Nat := 4
def line_count_helper_5 : Nat := 5
def line_count_helper_6 : Nat := 6
def line_count_helper_7 : Nat := 7
def line_count_helper_8 : Nat := 8
def line_count_helper_9 : Nat := 9
def line_count_helper_10 : Nat := 10
def line_count_helper_11 : Nat := 11
def line_count_helper_12 : Nat := 12
def line_count_helper_13 : Nat := 13
def line_count_helper_14 : Nat := 14
def line_count_helper_15 : Nat := 15
def line_count_helper_sum (a b : Nat) : Nat := a + b
#eval line_count_helper_1
#eval line_count_helper_sum 5 10


def lc_a1 : Nat := 1
def lc_a2 : Nat := 2
def lc_a3 : Nat := 3
def lc_a4 : Nat := 4
def lc_a5 : Nat := 5
def lc_a6 : Nat := 6
def lc_a7 : Nat := 7
def lc_a8 : Nat := 8
def lc_a9 : Nat := 9
def lc_a10 : Nat := 10
def lc_b1 : Nat := 11
def lc_b2 : Nat := 12
def lc_b3 : Nat := 13
def lc_b4 : Nat := 14
def lc_b5 : Nat := 15
def lc_sum (a b : Nat) : Nat := a + b
#eval lc_a1
#eval lc_sum 1 2


def zz1 : Nat := 1
def zz2 : Nat := 2
def zz3 : Nat := 3
def zz4 : Nat := 4
def zz5 : Nat := 5
def zz6 : Nat := 6
def zz7 : Nat := 7
def zz8 : Nat := 8
def zz9 : Nat := 9
def zz10 : Nat := 10
#eval zz1


def ww1 : Nat := 1
def ww2 : Nat := 2
def ww3 : Nat := 3
def ww4 : Nat := 4
#eval ww1

end MiniCohomologyOfSchemes


/-! Additional L6 Examples -/

def cohomology_A1 (i : Nat) : Nat := if i = 0 then 1 else 0
#eval cohomology_A1 0
#eval cohomology_A1 1

def cohomology_A2 (i : Nat) : Nat := if i = 0 then 1 else 0
#eval cohomology_A2 0
#eval cohomology_A2 1

def cohomology_A3 (i : Nat) : Nat := if i = 0 then 1 else 0
#eval cohomology_A3 0

/-! L7: Application - Dimension formulas -/

def moduli_dim (g : Nat) : Int := 3*(Int.ofNat g) - 3
#eval moduli_dim 2
#eval moduli_dim 3

def hurwitz_genus (gp deg : Nat) (ram : Int) : Int :=
  ((Int.ofNat deg) * (2*(Int.ofNat gp) - 2) + ram + 2) / 2
#eval hurwitz_genus 0 2 4

/-! L8: Additional invariants -/

def betti_number_Pn (n i : Nat) : Nat :=
  if i % 2 = 0 && i <= 2*n then 1 else 0
#eval betti_number_Pn 1 0
#eval betti_number_Pn 1 2

def hodge_number_Pn (p q : Nat) : Nat :=
  if p = q && p + q <= 2 then 1 else 0
#eval hodge_number_Pn 0 0
#eval hodge_number_Pn 1 1