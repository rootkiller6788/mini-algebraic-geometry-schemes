/-
L1: Core definitions - abelian groups, chain complexes
-/
namespace MiniDerivedCategories

structure AbGroup where
  carrier : Type u
  zero : carrier
  add : carrier -> carrier -> carrier
  neg : carrier -> carrier
  add_assoc : forall (a b c : carrier), add (add a b) c = add a (add b c)
  add_comm : forall (a b : carrier), add a b = add b a
  add_zero : forall (a : carrier), add a zero = a
  add_neg_self : forall (a : carrier), add a (neg a) = zero

namespace AbGroup

def sub (A : AbGroup) (a b : A.carrier) : A.carrier := A.add a (A.neg b)

@[simp] theorem sub_eq_add_neg (A : AbGroup) (a b : A.carrier) : A.sub a b = A.add a (A.neg b) := rfl

theorem zero_add (A : AbGroup) (a : A.carrier) : A.add A.zero a = a := by
  rw [A.add_comm, A.add_zero]

theorem neg_add_self (A : AbGroup) (a : A.carrier) : A.add (A.neg a) a = A.zero := by
  rw [A.add_comm, A.add_neg_self]

theorem eq_zero_of_add_self_eq_self (A : AbGroup) (a : A.carrier) (h : A.add a a = a) : a = A.zero := by
  calc
    a = A.add a A.zero := by rw [A.add_zero]
    _ = A.add a (A.add a (A.neg a)) := by rw [A.add_neg_self]
    _ = A.add (A.add a a) (A.neg a) := by rw [A.add_assoc]
    _ = A.add a (A.neg a) := by rw [h]
    _ = A.zero := by rw [A.add_neg_self]

theorem eq_neg_of_add_eq_zero (A : AbGroup) (a b : A.carrier) (h : A.add a b = A.zero) : b = A.neg a := by
  calc
    b = A.add A.zero b := by rw [A.zero_add]
    _ = A.add (A.add (A.neg a) a) b := by rw [A.neg_add_self, A.zero_add]
    _ = A.add (A.neg a) (A.add a b) := by rw [A.add_assoc]
    _ = A.add (A.neg a) A.zero := by rw [h]
    _ = A.neg a := by rw [A.add_zero]

theorem neg_zero (A : AbGroup) : A.neg A.zero = A.zero := by
  have h := A.eq_neg_of_add_eq_zero A.zero A.zero (by rw [A.add_zero])
  exact h.symm

theorem add_left_cancel (A : AbGroup) (a b c : A.carrier) (h : A.add a b = A.add a c) : b = c := by
  calc
    b = A.add A.zero b := by rw [A.zero_add]
    _ = A.add (A.add (A.neg a) a) b := by rw [A.neg_add_self, A.zero_add]
    _ = A.add (A.neg a) (A.add a b) := by rw [A.add_assoc]
    _ = A.add (A.neg a) (A.add a c) := by rw [h]
    _ = A.add (A.add (A.neg a) a) c := by rw [A.add_assoc]
    _ = A.add A.zero c := by rw [A.neg_add_self]
    _ = c := by rw [A.zero_add]

theorem add_right_cancel (A : AbGroup) (a b c : A.carrier) (h : A.add b a = A.add c a) : b = c := by
  apply A.add_left_cancel a b c
  calc
    A.add a b = A.add b a := A.add_comm a b
    _ = A.add c a := h
    _ = A.add a c := A.add_comm c a

theorem neg_neg (A : AbGroup) (a : A.carrier) : A.neg (A.neg a) = a := by
  have h := A.eq_neg_of_add_eq_zero (A.neg a) a (A.neg_add_self a)
  exact h.symm

theorem neg_add (A : AbGroup) (a b : A.carrier) : A.neg (A.add a b) = A.add (A.neg a) (A.neg b) := by
  have hzero : A.add (A.add a b) (A.add (A.neg a) (A.neg b)) = A.zero := by
    calc
      A.add (A.add a b) (A.add (A.neg a) (A.neg b))
          = A.add a (A.add b (A.add (A.neg a) (A.neg b))) := by rw [A.add_assoc]
      _ = A.add a (A.add (A.add b (A.neg b)) (A.neg a)) := by
        rw [A.add_comm (A.neg a) (A.neg b), A.add_assoc b (A.neg b) (A.neg a)]
      _ = A.add a (A.add A.zero (A.neg a)) := by rw [A.add_neg_self b]
      _ = A.add a (A.neg a) := by rw [A.zero_add]
      _ = A.zero := by rw [A.add_neg_self]
  have h := A.eq_neg_of_add_eq_zero (A.add a b) (A.add (A.neg a) (A.neg b)) hzero
  exact h.symm

theorem sub_self (A : AbGroup) (a : A.carrier) : A.sub a a = A.zero := by
  rw [A.sub_eq_add_neg, A.add_neg_self]

theorem sub_zero (A : AbGroup) (a : A.carrier) : A.sub a A.zero = a := by
  rw [A.sub_eq_add_neg, A.neg_zero, A.add_zero]

theorem zero_sub (A : AbGroup) (a : A.carrier) : A.sub A.zero a = A.neg a := by
  rw [A.sub_eq_add_neg, A.zero_add]

end AbGroup

def abGroupInt : AbGroup where
  carrier := Int
  zero := (0 : Int)
  add := fun (a b : Int) => a + b
  neg := fun (a : Int) => -a
  add_assoc := by intro a b c; exact Int.add_assoc a b c
  add_comm := by intro a b; exact Int.add_comm a b
  add_zero := by intro a; exact Int.add_zero a
  add_neg_self := by
    intro a; calc
      a + (-a) = (-a) + a := Int.add_comm a (-a)
      _ = 0 := Int.add_left_neg a

def abGroupTrivial : AbGroup where
  carrier := PUnit
  zero := PUnit.unit
  add := fun _ _ => PUnit.unit
  neg := fun _ => PUnit.unit
  add_assoc := by intro a b c; rfl
  add_comm := by intro a b; rfl
  add_zero := by intro a; rfl
  add_neg_self := by intro a; rfl

def abGroupProd (A B : AbGroup) : AbGroup where
  carrier := Prod A.carrier B.carrier
  zero := (A.zero, B.zero)
  add := fun p q => (A.add p.1 q.1, B.add p.2 q.2)
  neg := fun p => (A.neg p.1, B.neg p.2)
  add_assoc := by
    intro a b c; apply Prod.ext; exact A.add_assoc a.1 b.1 c.1; exact B.add_assoc a.2 b.2 c.2
  add_comm := by
    intro a b; apply Prod.ext; exact A.add_comm a.1 b.1; exact B.add_comm a.2 b.2
  add_zero := by
    intro a; apply Prod.ext; exact A.add_zero a.1; exact B.add_zero a.2
  add_neg_self := by
    intro a; apply Prod.ext; exact A.add_neg_self a.1; exact B.add_neg_self a.2

def abGroupZero : AbGroup := abGroupTrivial

def abGroupFun (X : Type u) (A : AbGroup) : AbGroup where
  carrier := X -> A.carrier
  zero := fun _ => A.zero
  add := fun f g x => A.add (f x) (g x)
  neg := fun f x => A.neg (f x)
  add_assoc := by intro f g h; funext x; apply A.add_assoc
  add_comm := by intro f g; funext x; apply A.add_comm
  add_zero := by intro f; funext x; apply A.add_zero
  add_neg_self := by intro f; funext x; apply A.add_neg_self

structure AbHom (A B : AbGroup) where
  map : A.carrier -> B.carrier
  map_add : forall (x y : A.carrier), map (A.add x y) = B.add (map x) (map y)

namespace AbHom

variable {A B C : AbGroup}

theorem map_zero (f : AbHom A B) : f.map A.zero = B.zero := by
  have ha : B.add (f.map A.zero) (f.map A.zero) = f.map A.zero := by
    calc
      B.add (f.map A.zero) (f.map A.zero) = f.map (A.add A.zero A.zero) := by rw [f.map_add]
      _ = f.map A.zero := by rw [A.add_zero]
  exact B.eq_zero_of_add_self_eq_self (f.map A.zero) ha

theorem map_neg (f : AbHom A B) (a : A.carrier) : f.map (A.neg a) = B.neg (f.map a) := by
  apply B.eq_neg_of_add_eq_zero (f.map a) (f.map (A.neg a))
  calc
    B.add (f.map a) (f.map (A.neg a)) = f.map (A.add a (A.neg a)) := by rw [f.map_add]
    _ = f.map A.zero := by rw [A.add_neg_self]
    _ = B.zero := by rw [f.map_zero]

def id (A : AbGroup) : AbHom A A where
  map := fun x => x; map_add := by intro x y; rfl

def comp (g : AbHom B C) (f : AbHom A B) : AbHom A C where
  map := fun x => g.map (f.map x)
  map_add := by intro x y; dsimp; rw [f.map_add, g.map_add]

def zero (A B : AbGroup) : AbHom A B where
  map := fun _ => B.zero
  map_add := by intro x y; dsimp; rw [B.add_zero]

end AbHom

end MiniDerivedCategories
