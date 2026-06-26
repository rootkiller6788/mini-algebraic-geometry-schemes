/-
# MiniAffineVarieties.Core.Basic
L1 Core Definitions for affine algebraic varieties over ℤ.
-/

namespace MiniAffineVarieties

set_option maxHeartbeats 600000

/-! ## Preliminaries: Set operations -/

def Set (α : Type) : Type := α -> Prop

def Set_empty {α : Type} : Set α := fun _ => False
def Set_univ {α : Type} : Set α := fun _ => True
def Set_inter {α : Type} (s t : Set α) : Set α := fun x => s x ∧ t x
def Set_union {α : Type} (s t : Set α) : Set α := fun x => s x ∨ t x
def Set_compl {α : Type} (s : Set α) : Set α := fun x => ¬ s x
def Set_mem {α : Type} (a : α) (s : Set α) : Prop := s a
def Set_subset {α : Type} (s t : Set α) : Prop := ∀ x, Set_mem x s -> Set_mem x t

/-! ## Polynomial Expressions -/

inductive PolyExpr (n : Nat) : Type where
  | const : Int -> PolyExpr n
  | var : Fin n -> PolyExpr n
  | add : PolyExpr n -> PolyExpr n -> PolyExpr n
  | mul : PolyExpr n -> PolyExpr n -> PolyExpr n
  | neg : PolyExpr n -> PolyExpr n
deriving Inhabited

namespace PolyExpr

variable {n : Nat}

def zero : PolyExpr n := const 0
def one : PolyExpr n := const 1

instance : Add (PolyExpr n) := ⟨add⟩
instance : Mul (PolyExpr n) := ⟨mul⟩
instance : Neg (PolyExpr n) := ⟨neg⟩
instance : OfNat (PolyExpr n) 0 := ⟨zero⟩
instance : OfNat (PolyExpr n) 1 := ⟨one⟩

def sub (p q : PolyExpr n) : PolyExpr n := p + (-q)
instance : Sub (PolyExpr n) := ⟨sub⟩

def eval (p : PolyExpr n) (pt : Fin n -> Int) : Int :=
  match p with
  | const c => c
  | var i => pt i
  | add p q => eval p pt + eval q pt
  | mul p q => eval p pt * eval q pt
  | neg p => -(eval p pt)

@[simp] theorem eval_zero (pt : Fin n -> Int) : eval (0 : PolyExpr n) pt = 0 := rfl
@[simp] theorem eval_one (pt : Fin n -> Int) : eval (1 : PolyExpr n) pt = 1 := rfl
@[simp] theorem eval_add (p q : PolyExpr n) (pt : Fin n -> Int) :
    eval (p + q) pt = eval p pt + eval q pt := rfl
@[simp] theorem eval_mul (p q : PolyExpr n) (pt : Fin n -> Int) :
    eval (p * q) pt = eval p pt * eval q pt := rfl
@[simp] theorem eval_neg (p : PolyExpr n) (pt : Fin n -> Int) :
    eval (-p) pt = -(eval p pt) := rfl

def compose (p : PolyExpr n) (subs : Fin n -> PolyExpr m) : PolyExpr m :=
  match p with
  | const c => const c
  | var i => subs i
  | add p q => add (compose p subs) (compose q subs)
  | mul p q => mul (compose p subs) (compose q subs)
  | neg p => neg (compose p subs)

def deg : PolyExpr n -> Nat
  | const _ => 0
  | var _ => 1
  | add p q => Nat.max (deg p) (deg q)
  | mul p q => deg p + deg q
  | neg p => deg p

def isConstant (p : PolyExpr n) : Bool := deg p == 0

def size : PolyExpr n -> Nat
  | const _ => 1
  | var _ => 1
  | add p q => 1 + size p + size q
  | mul p q => 1 + size p + size q
  | neg p => 1 + size p

end PolyExpr

open PolyExpr

/-! ## Ideals as predicates -/

def Ideal (n : Nat) := (PolyExpr n) -> Prop

namespace Ideal

variable {n : Nat}

def mem (p : PolyExpr n) (I : Ideal n) : Prop := I p

def zero : Ideal n := fun p => p = 0
def unit : Ideal n := fun _ => True

def IsProper (I : Ideal n) : Prop := ¬ I 1

def add (I J : Ideal n) : Ideal n :=
  fun x => ∃ a b, I a ∧ J b ∧ x = a + b

def inter (I J : Ideal n) : Ideal n := fun x => I x ∧ J x

def subset (I J : Ideal n) : Prop := ∀ x, I x -> J x

def span (S : (PolyExpr n) -> Prop) : Ideal n :=
  fun x => ∃ (cs gs : List (PolyExpr n)),
    (∀ g ∈ gs, S g) ∧ cs.length = gs.length ∧
    x = (List.zipWith (fun c g => c * g) cs gs).sum

def principal (a : PolyExpr n) : Ideal n := span (fun p => p = a)

def IsPrime (I : Ideal n) : Prop :=
  IsProper I ∧ ∀ a b, I (a * b) -> I a ∨ I b

def IsMaximal (I : Ideal n) : Prop :=
  IsProper I ∧ ∀ J, IsProper J -> subset I J -> I = J

end Ideal

open Ideal (zero unit IsProper add inter subset span principal IsPrime IsMaximal)

/-! ## V and I Operations -/

def V (n : Nat) (I : Ideal n) : (Fin n -> Int) -> Prop :=
  fun pt => ∀ (p : PolyExpr n), I p -> eval p pt = 0

def I (n : Nat) (X : (Fin n -> Int) -> Prop) : Ideal n :=
  fun p => ∀ (pt : Fin n -> Int), X pt -> eval p pt = 0

theorem V_zero_contains_all (n : Nat) (pt : Fin n -> Int) : V n zero pt := by
  intro p hp; rcases hp with rfl; simp

theorem V_one_contains_none (n : Nat) (pt : Fin n -> Int) : ¬ V n Ideal.unit pt := by
  intro h
  have h1 := h 1 (by trivial : Ideal.unit 1)
  simp at h1

/-! ## Zariski Topology -/

def IsZariskiClosed (n : Nat) (Z : (Fin n -> Int) -> Prop) : Prop :=
  ∃ (I : Ideal n), ∀ pt, Z pt ↔ V n I pt

def IsZariskiOpen (n : Nat) (U : (Fin n -> Int) -> Prop) : Prop :=
  IsZariskiClosed n (fun pt => ¬ U pt)

def zariskiClosure (n : Nat) (X : (Fin n -> Int) -> Prop) : (Fin n -> Int) -> Prop :=
  V n (I n X)

theorem zariski_closed_univ (n : Nat) : IsZariskiClosed n (fun _ => True) := by
  refine ⟨Ideal.zero, ?_⟩
  intro pt; constructor
  · intro _ p hp
    have : p = 0 := hp
    subst this; simp [V, Ideal.zero]
  · intro h; trivial

theorem zariski_closed_empty (n : Nat) : IsZariskiClosed n (fun _ => False) := by
  refine ⟨Ideal.unit, ?_⟩
  intro pt; constructor
  · intro h; exact False.elim h
  · intro h; exact V_one_contains_none n pt h

/-! ## Affine Varieties -/

structure AffineVariety (n : Nat) where
  carrier : (Fin n -> Int) -> Prop
  isClosed : IsZariskiClosed n carrier
  nonempty' : ∃ pt, carrier pt
  irreducible : True := by trivial

def affineNSpace (n : Nat) : AffineVariety n where
  carrier := fun _ => True
  isClosed := zariski_closed_univ n
  nonempty' := ⟨fun _ => 0, trivial⟩
  irreducible := trivial

/-! ## Regular Functions -/

structure RegularFunction (n : Nat) (V : AffineVariety n) where
  representative : PolyExpr n
  well_defined : ∀ (x y : Fin n -> Int),
    V.carrier x -> V.carrier y ->
    eval representative x = eval representative y

/-! ## Polynomial Examples and Evaluations -/

section Examples

def x0_plus_x1 : PolyExpr 2 :=
  .add (.var ⟨0, by decide⟩) (.var ⟨1, by decide⟩)

def parabola_poly : PolyExpr 2 :=
  .sub (.var ⟨1, by decide⟩) (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))

def axes_poly : PolyExpr 2 :=
  .mul (.var ⟨0, by decide⟩) (.var ⟨1, by decide⟩)

def cusp_poly : PolyExpr 2 :=
  .add (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩))
       (.neg (.mul (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))
                   (.var ⟨0, by decide⟩)))

def hyperbola_poly : PolyExpr 2 :=
  .sub (.mul (.var ⟨0, by decide⟩) (.var ⟨1, by decide⟩)) (.const 1)

def circle_poly : PolyExpr 2 :=
  .add (.add (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))
             (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩)))
       (.neg (.const 1))

def node_poly : PolyExpr 2 :=
  .sub (.sub (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩))
             (.mul (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))
                   (.var ⟨0, by decide⟩)))
       (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))

def elliptic_poly : PolyExpr 2 :=
  .sub (.mul (.var ⟨1, by decide⟩) (.var ⟨1, by decide⟩))
       (.add (.mul (.mul (.var ⟨0, by decide⟩) (.var ⟨0, by decide⟩))
                   (.var ⟨0, by decide⟩))
             (.var ⟨0, by decide⟩))

-- #eval tests
#eval eval parabola_poly (fun _ => (0 : Int))
#eval eval parabola_poly (fun i => match i with | ⟨0, _⟩ => 3 | ⟨1, _⟩ => 9)
#eval eval axes_poly (fun i => match i with | ⟨0, _⟩ => 0 | ⟨1, _⟩ => 5)
#eval eval axes_poly (fun i => match i with | ⟨0, _⟩ => 3 | ⟨1, _⟩ => 5)

-- Theorem: known points on curves
theorem parabola_point_on_curve :
    eval parabola_poly (fun i => match i with | ⟨0, _⟩ => 2 | ⟨1, _⟩ => 4) = 0 := by
  native_decide

theorem axes_point_on_curve :
    eval axes_poly (fun i => match i with | ⟨0, _⟩ => 0 | ⟨1, _⟩ => 42) = 0 := by
  native_decide

theorem cusp_origin_on_curve :
    eval cusp_poly (fun _ => 0) = 0 := by
  native_decide

theorem node_origin_on_curve :
    eval node_poly (fun _ => 0) = 0 := by
  native_decide

theorem elliptic_origin_on_curve :
    eval elliptic_poly (fun _ => 0) = 0 := by
  native_decide

#eval eval hyperbola_poly (fun i => match i with | ⟨0, _⟩ => 2 | ⟨1, _⟩ => 0)
#eval eval circle_poly (fun i => match i with | ⟨0, _⟩ => 3 | ⟨1, _⟩ => 4)
#eval eval node_poly (fun i => match i with | ⟨0, _⟩ => 1 | ⟨1, _⟩ => 2)
#eval eval elliptic_poly (fun i => match i with | ⟨0, _⟩ => 1 | ⟨1, _⟩ => 0)

end Examples

end MiniAffineVarieties