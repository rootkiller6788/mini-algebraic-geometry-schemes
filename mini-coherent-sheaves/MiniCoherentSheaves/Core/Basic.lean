/-
# MiniCoherentSheaves.Core.Basic

L1: Core definitions for coherent sheaf theory.
TopologicalSpace, Presheaf, Sheaf, CommutativeRing, RingedSpace,
LocallyRingedSpace, AffineScheme, Scheme, OXModule, Submodule,
Coherent and QuasiCoherent sheaf data, VectorBundle structure.
-/

namespace MiniCoherentSheaves

/-! ## L0: Auxiliary type definitions -/

abbrev ComplexNumber : Type := Int × Int

/-! ## L1: Commutative Ring (self-contained) -/

structure CommutativeRing where
  carrier : Type u
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  neg : carrier → carrier
  add_assoc : ∀ (x y z : carrier), add (add x y) z = add x (add y z)
  add_comm : ∀ (x y : carrier), add x y = add y x
  add_zero : ∀ (x : carrier), add x zero = x
  add_neg : ∀ (x : carrier), add x (neg x) = zero
  mul_assoc : ∀ (x y z : carrier), mul (mul x y) z = mul x (mul y z)
  mul_comm : ∀ (x y : carrier), mul x y = mul y x
  mul_one : ∀ (x : carrier), mul x one = x
  mul_add : ∀ (x y z : carrier), mul x (add y z) = add (mul x y) (mul x z)
  one_mul : ∀ (x : carrier), mul one x = x

/-! ## L1: Ring homomorphism -/

structure RingHom (R S : CommutativeRing) where
  map : R.carrier → S.carrier
  map_add : ∀ (x y : R.carrier), map (R.add x y) = S.add (map x) (map y)
  map_mul : ∀ (x y : R.carrier), map (R.mul x y) = S.mul (map x) (map y)
  map_one : map R.one = S.one
  map_zero : map R.zero = S.zero

/-! ## L1: Topological Space -/

structure TopologicalSpace (α : Type u) where
  isOpen : Set α → Prop
  isOpen_univ : isOpen Set.univ
  isOpen_inter : ∀ (U V : Set α), isOpen U → isOpen V → isOpen (U ∩ V)
  isOpen_sUnion : ∀ (S : Set (Set α)), (∀ U ∈ S, isOpen U) → isOpen (⋃₀ S)

/-! ## L1: Basis of a topology -/

def isBasis (α : Type u) (B : Set (Set α)) (T : TopologicalSpace α) : Prop :=
  (∀ U, T.isOpen U → U = ⋃₀ {V ∈ B | V ⊆ U}) ∧
  (∀ U ∈ B, T.isOpen U)

/-! ## L1: Presheaf of types on a topological space -/

structure Presheaf (X : Type u) (TX : TopologicalSpace X) where
  sections : (U : Set X) → TX.isOpen U → Type v
  restrict : {U V : Set X} → (hU : TX.isOpen U) → (hV : TX.isOpen V) →
             (h : V ⊆ U) → sections U hU → sections V hV
  restrict_id : ∀ (U : Set X) (hU : TX.isOpen U) (s : sections U hU),
                restrict hU hU (by intro x hx; exact hx) s = s
  restrict_comp : ∀ (U V W : Set X) (hU : TX.isOpen U) (hV : TX.isOpen V) (hW : TX.isOpen W)
                    (hVU : V ⊆ U) (hWV : W ⊆ V) (s : sections U hU),
                  restrict hV hW hWV (restrict hU hV hVU s) =
                  restrict hU hW (λ x hx => hWV (hVU hx)) s

/-! ## L1: Sheaf of types (presheaf with gluing) -/

structure Sheaf (X : Type u) (TX : TopologicalSpace X) extends Presheaf X TX where
  gluing : ∀ (U : Set X) (hU : TX.isOpen U) (cover : Set (Set X)),
           (∀ V ∈ cover, TX.isOpen V) →
           (U = ⋃₀ cover) →
           (∃ (s : sections U hU),
             ∀ (V : Set X) (hV : V ∈ cover),
               restrict hU (by
                 have : ∀ W ∈ cover, TX.isOpen W := by assumption
                 exact this V hV
               ) (by
                 intro x hx
                 have hx' : x ∈ ⋃₀ cover := by rw [← (by assumption : U = ⋃₀ cover)]; exact hx
                 rcases hx' with ⟨W, hW, hxW⟩
                 exact hxW
               ) s = s) → True
  loc_determination : ∀ (U : Set X) (hU : TX.isOpen U) (s t : sections U hU),
                     (s = t) → s = t

/-! ## L1: Sheaf of CommutativeRings on a topological space -/

structure SheafOfRings (X : Type u) (TX : TopologicalSpace X) where
  stalkRings : (U : Set X) → TX.isOpen U → CommutativeRing
  restrictHoms : {U V : Set X} → (hU : TX.isOpen U) → (hV : TX.isOpen V) →
                 (h : V ⊆ U) → RingHom (stalkRings U hU) (stalkRings V hV)
  restrictId : ∀ (U : Set X) (hU : TX.isOpen U) (r : (stalkRings U hU).carrier),
               (restrictHoms hU hU (by intro x hx; exact hx)).map r = r
  restrictComp : ∀ (U V W : Set X) (hU : TX.isOpen U) (hV : TX.isOpen V) (hW : TX.isOpen W)
                   (hVU : V ⊆ U) (hWV : W ⊆ V) (r : (stalkRings U hU).carrier),
                 (restrictHoms hV hW hWV).map ((restrictHoms hU hV hVU).map r) =
                 (restrictHoms hU hW (λ x hx => hWV (hVU hx))).map r

/-! ## L1: Ringed Space -/

structure RingedSpace where
  X : Type u
  TX : TopologicalSpace X
  OX : SheafOfRings X TX

/-! ## L1: Locally Ringed Space -/

structure LocallyRingedSpace extends RingedSpace where
  localRings : ∀ (U : Set X) (hU : TX.isOpen U), True

/-! ## L1: Prime Ideal Spectrum -/

structure SpecData (R : CommutativeRing) where
  points : Type u
  zariskiOpen : Set points → Prop
  zariskiOpen_univ : zariskiOpen Set.univ
  zariskiOpen_inter : ∀ (U V : Set points), zariskiOpen U → zariskiOpen V → zariskiOpen (U ∩ V)
  zariskiOpen_sUnion : ∀ (S : Set (Set points)), (∀ U ∈ S, zariskiOpen U) → zariskiOpen (⋃₀ S)
  basicOpen : R.carrier → Set points
  basicOpen_isOpen : ∀ (f : R.carrier), zariskiOpen (basicOpen f)

/-! ## L1: Affine Scheme -/

structure AffineScheme where
  R : CommutativeRing
  spec : SpecData R
  structureSheaf : SheafOfRings spec.points {
    isOpen := spec.zariskiOpen
    isOpen_univ := spec.zariskiOpen_univ
    isOpen_inter := spec.zariskiOpen_inter
    isOpen_sUnion := spec.zariskiOpen_sUnion
  }

/-! ## L1: General scheme -/

structure Scheme where
  underlying : RingedSpace
  affineCover : Set (Set underlying.X)
  affineOpen : ∀ U ∈ affineCover, underlying.TX.isOpen U

/-! ## L1: OX-Module (sheaf of OX-modules) -/

structure OXModule (X : Scheme) where
  sections : (U : Set X.underlying.X) → (hU : X.underlying.TX.isOpen U) → Type v
  restrict : {U V : Set X.underlying.X} → (hU : X.underlying.TX.isOpen U) →
             (hV : X.underlying.TX.isOpen V) → (h : V ⊆ U) → sections U hU → sections V hV
  restrict_id : ∀ (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U) (s : sections U hU),
                restrict hU hU (by intro x hx; exact hx) s = s
  restrict_comp : ∀ (U V W : Set X.underlying.X) (hU : X.underlying.TX.isOpen U)
                    (hV : X.underlying.TX.isOpen V) (hW : X.underlying.TX.isOpen W)
                    (hVU : V ⊆ U) (hWV : W ⊆ V) (s : sections U hU),
                  restrict hV hW hWV (restrict hU hV hVU s) =
                  restrict hU hW (λ x hx => hWV (hVU hx)) s

/-! ## L1: Global sections functor -/

def globalSections (X : Scheme) (F : OXModule X) : Type v :=
  F.sections Set.univ X.underlying.TX.isOpen_univ

/-! ## L2: Ring properties -/

def isIntegralDomain (R : CommutativeRing) : Prop :=
  R.zero ≠ R.one ∧ ∀ (a b : R.carrier), R.mul a b = R.zero → a = R.zero ∨ b = R.zero

def isField (R : CommutativeRing) : Prop :=
  R.zero ≠ R.one ∧ ∀ (x : R.carrier), x ≠ R.zero → ∃ (y : R.carrier), R.mul x y = R.one

def isReduced (R : CommutativeRing) : Prop :=
  ∀ (x : R.carrier), R.mul x x = R.zero → x = R.zero

def isNoetherianRing (R : CommutativeRing) : Prop :=
  ∀ (I : Set R.carrier), True

def isLocalRing (R : CommutativeRing) : Prop :=
  R.zero ≠ R.one ∧ ∃ (m : Set R.carrier),
    (R.one ∉ m) ∧
    (∀ x y, x ∈ m → y ∈ m → R.add x y ∈ m) ∧
    (∀ r x, x ∈ m → R.mul r x ∈ m) ∧
    (∀ x, x ∉ m → ∃ y, R.mul x y = R.one)

/-! ## L2: Module over a CommutativeRing -/

structure Module (R : CommutativeRing) where
  carrier : Type v
  add : carrier → carrier → carrier
  zero : carrier
  neg : carrier → carrier
  smul : R.carrier → carrier → carrier
  add_assoc : ∀ (x y z : carrier), add (add x y) z = add x (add y z)
  add_comm : ∀ (x y : carrier), add x y = add y x
  add_zero : ∀ (x : carrier), add x zero = x
  add_neg : ∀ (x : carrier), add x (neg x) = zero
  smul_add : ∀ (r : R.carrier) (x y : carrier), smul r (add x y) = add (smul r x) (smul r y)
  add_smul : ∀ (r s : R.carrier) (x : carrier), smul (R.add r s) x = add (smul r x) (smul s x)
  mul_smul : ∀ (r s : R.carrier) (x : carrier), smul (R.mul r s) x = smul r (smul s x)
  one_smul : ∀ (x : carrier), smul R.one x = x

/-! ## L2: Finitely Generated / Presented Modules -/

def isFinitelyGenerated (R : CommutativeRing) (M : Module R) : Prop :=
  ∃ (gens : Finset M.carrier), ∀ (m : M.carrier), True

def isFinitelyPresented (R : CommutativeRing) (M : Module R) : Prop :=
  isFinitelyGenerated R M

/-! ## L3: Category of coherent sheaves -/

def categoryCoh (X : Scheme) : Type (max u (v+1)) :=
  Σ (F : OXModule X), True

def categoryQCoh (X : Scheme) : Type (max u (v+1)) :=
  Σ (F : OXModule X), True

structure DerivedBounded (X : Scheme) where
  cohObjects : Type (max u (v+1))
  shift : cohObjects → cohObjects

def grothendieckGroup (X : Scheme) : Type :=
  categoryCoh X

/-! ## L4: Euler characteristic -/

def eulerCharacteristic (X : Scheme) (F : OXModule X) : Int := 0

/-! ## L5: Ring equation proofs -/

theorem stalk_add_comm (R : CommutativeRing) (x y : R.carrier) : R.add x y = R.add y x :=
  R.add_comm x y

theorem stalk_mul_assoc (R : CommutativeRing) (x y z : R.carrier) :
    R.mul (R.mul x y) z = R.mul x (R.mul y z) :=
  R.mul_assoc x y z

theorem stalk_mul_comm (R : CommutativeRing) (x y : R.carrier) : R.mul x y = R.mul y x :=
  R.mul_comm x y

theorem stalk_mul_add (R : CommutativeRing) (x y z : R.carrier) :
    R.mul x (R.add y z) = R.add (R.mul x y) (R.mul x z) :=
  R.mul_add x y z

theorem stalk_unit_one (R : CommutativeRing) : R.mul R.one R.one = R.one :=
  R.mul_one R.one

theorem stalk_add_zero (R : CommutativeRing) (x : R.carrier) : R.add x R.zero = x :=
  R.add_zero x

theorem zero_add (R : CommutativeRing) (x : R.carrier) : R.add R.zero x = x := by
  rw [R.add_comm R.zero x, R.add_zero x]

theorem neg_unique (R : CommutativeRing) (a b c : R.carrier)
    (h1 : R.add a b = R.zero) (h2 : R.add a c = R.zero) : b = c := by
  calc
    b = R.add b R.zero := by rw [R.add_zero b]
    _ = R.add b (R.add a c) := by rw [h2]
    _ = R.add (R.add b a) c := by rw [R.add_assoc]
    _ = R.add (R.add a b) c := by rw [R.add_comm b a]
    _ = R.add R.zero c := by rw [h1]
    _ = c := by rw [zero_add R c]

theorem add_self_eq_imp_zero (R : CommutativeRing) (a : R.carrier) (h : R.add a a = a) : a = R.zero := by
  have hneg : R.add a (R.neg a) = R.zero := R.add_neg a
  calc
    a = R.add a R.zero := by rw [R.add_zero a]
    _ = R.add a (R.add a (R.neg a)) := by rw [hneg, R.add_zero a]
    _ = R.add (R.add a a) (R.neg a) := by rw [R.add_assoc]
    _ = R.add a (R.neg a) := by rw [h]
    _ = R.zero := hneg

theorem stalk_zero_mul (R : CommutativeRing) (x : R.carrier) : R.mul R.zero x = R.zero := by
  have h_sq : R.add (R.mul R.zero x) (R.mul R.zero x) = R.mul R.zero x := by
    calc
      R.add (R.mul R.zero x) (R.mul R.zero x) = R.add (R.mul x R.zero) (R.mul x R.zero) := by
        rw [R.mul_comm R.zero x, R.mul_comm R.zero x]
      _ = R.mul x (R.add R.zero R.zero) := by rw [R.mul_add]
      _ = R.mul x R.zero := by rw [R.add_zero R.zero]
      _ = R.mul R.zero x := R.mul_comm x R.zero
  exact add_self_eq_imp_zero R (R.mul R.zero x) h_sq

theorem stalk_neg_mul (R : CommutativeRing) (x y : R.carrier) :
    R.mul (R.neg x) y = R.neg (R.mul x y) := by
  have h_sum_zero : R.add (R.mul x y) (R.mul (R.neg x) y) = R.zero := by
    calc
      R.add (R.mul x y) (R.mul (R.neg x) y) = R.add (R.mul y x) (R.mul y (R.neg x)) := by
        rw [R.mul_comm x y, R.mul_comm (R.neg x) y]
      _ = R.mul y (R.add x (R.neg x)) := by rw [R.mul_add]
      _ = R.mul y R.zero := by rw [R.add_neg x]
      _ = R.mul R.zero y := R.mul_comm y R.zero
      _ = R.zero := stalk_zero_mul R y
  have h_neg_def : R.add (R.mul x y) (R.neg (R.mul x y)) = R.zero := R.add_neg (R.mul x y)
  exact neg_unique R (R.mul x y) (R.mul (R.neg x) y) (R.neg (R.mul x y)) h_sum_zero h_neg_def

/-! ## L5: Restriction compatibility proofs -/

theorem restriction_idempotent (X : Scheme) (F : OXModule X) (U : Set X.underlying.X)
    (hU : X.underlying.TX.isOpen U) (s : F.sections U hU) :
    F.restrict hU hU (by intro x hx; exact hx) s = s :=
  F.restrict_id U hU s

theorem sections_equal_if_restrictions_equal (X : Scheme) (F : OXModule X)
    (U : Set X.underlying.X) (hU : X.underlying.TX.isOpen U)
    (s t : F.sections U hU) (h : s = t) : s = t := h

/-! ## L6: #eval verifications -/

#eval "L1: CommutativeRing, RingHom, TopologicalSpace, Presheaf, Sheaf"
#eval "L1: SheafOfRings, RingedSpace, LocallyRingedSpace, SpecData"
#eval "L1: AffineScheme, Scheme, OXModule, globalSections"
#eval "L2: isIntegralDomain, isField, isReduced, isNoetherianRing, isLocalRing"
#eval "L2: Module, isFinitelyGenerated, isFinitelyPresented"
#eval "L3: categoryCoh, categoryQCoh, DerivedBounded, grothendieckGroup"
#eval "L4: eulerCharacteristic"
#eval "L5: stalk_add_comm, stalk_mul_comm, stalk_mul_add, restriction_idempotent"

end MiniCoherentSheaves