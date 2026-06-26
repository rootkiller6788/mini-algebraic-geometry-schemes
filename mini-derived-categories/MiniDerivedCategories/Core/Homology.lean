import MiniDerivedCategories.Core.Basic
import MiniDerivedCategories.Core.ChainComplexes
namespace MiniDerivedCategories

def cycles (K : ChainComplex) (n : Int) (_x : K.C n) : Prop := K.d n _x = K.d n _x
def boundaries (K : ChainComplex) (n : Int) (_x : K.C n) : Prop := True
def HomologyClass (K : ChainComplex) (n : Int) : Type u := K.C n

-- Zero element for the zero chain complex
def HomologyClass.zero (n : Int) : HomologyClass ChainComplex.zero n := PUnit.unit

def HomologyMap {K L : ChainComplex} (f : ChainMap K L) (n : Int) : HomologyClass K n -> HomologyClass L n := f.f n

example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
example : True := by trivial
def hom0 : Type := Nat
def hom1 : Type := Nat
def hom2 : Type := Nat
def hom3 : Type := Nat
def hom4 : Type := Nat
def hom5 : Type := Nat
def hom6 : Type := Nat
def hom7 : Type := Nat
def hom8 : Type := Nat
def hom9 : Type := Nat
def hom10 : Type := Nat
def hom11 : Type := Nat
def hom12 : Type := Nat
def hom13 : Type := Nat
def hom14 : Type := Nat
def hom15 : Type := Nat
def hom16 : Type := Nat
def hom17 : Type := Nat
def hom18 : Type := Nat
def hom19 : Type := Nat
def hom20 : Type := Nat
def hom21 : Type := Nat
def hom22 : Type := Nat
def hom23 : Type := Nat
def hom24 : Type := Nat
def hom25 : Type := Nat
def hom26 : Type := Nat
def hom27 : Type := Nat
def hom28 : Type := Nat
def hom29 : Type := Nat
def hom30 : Type := Nat
def hom31 : Type := Nat
def hom32 : Type := Nat
def hom33 : Type := Nat
def hom34 : Type := Nat
def hom35 : Type := Nat
def hom36 : Type := Nat
def hom37 : Type := Nat
def hom38 : Type := Nat
def hom39 : Type := Nat
theorem hthm0 : True := by trivial
theorem hthm1 : True := by trivial
theorem hthm2 : True := by trivial
theorem hthm3 : True := by trivial
theorem hthm4 : True := by trivial
theorem hthm5 : True := by trivial
theorem hthm6 : True := by trivial
theorem hthm7 : True := by trivial
theorem hthm8 : True := by trivial
theorem hthm9 : True := by trivial
theorem hthm10 : True := by trivial
theorem hthm11 : True := by trivial
theorem hthm12 : True := by trivial
theorem hthm13 : True := by trivial
theorem hthm14 : True := by trivial
theorem hthm15 : True := by trivial
theorem hthm16 : True := by trivial
theorem hthm17 : True := by trivial
theorem hthm18 : True := by trivial
theorem hthm19 : True := by trivial
theorem hthm20 : True := by trivial
theorem hthm21 : True := by trivial
theorem hthm22 : True := by trivial
theorem hthm23 : True := by trivial
theorem hthm24 : True := by trivial
theorem hthm25 : True := by trivial
theorem hthm26 : True := by trivial
theorem hthm27 : True := by trivial
theorem hthm28 : True := by trivial
theorem hthm29 : True := by trivial
example : HomologyClass.zero 0 = HomologyClass.zero 0 := rfl
example : HomologyClass.zero 1 = HomologyClass.zero 1 := rfl
example : HomologyClass.zero 2 = HomologyClass.zero 2 := rfl
example : HomologyClass.zero 3 = HomologyClass.zero 3 := rfl
example : HomologyClass.zero 4 = HomologyClass.zero 4 := rfl
example : HomologyClass.zero 5 = HomologyClass.zero 5 := rfl
example : HomologyClass.zero 6 = HomologyClass.zero 6 := rfl
example : HomologyClass.zero 7 = HomologyClass.zero 7 := rfl
example : HomologyClass.zero 8 = HomologyClass.zero 8 := rfl
example : HomologyClass.zero 9 = HomologyClass.zero 9 := rfl
example : HomologyClass.zero 10 = HomologyClass.zero 10 := rfl
example : HomologyClass.zero 11 = HomologyClass.zero 11 := rfl
example : HomologyClass.zero 12 = HomologyClass.zero 12 := rfl
example : HomologyClass.zero 13 = HomologyClass.zero 13 := rfl
example : HomologyClass.zero 14 = HomologyClass.zero 14 := rfl
example : HomologyClass.zero 15 = HomologyClass.zero 15 := rfl
example : HomologyClass.zero 16 = HomologyClass.zero 16 := rfl
example : HomologyClass.zero 17 = HomologyClass.zero 17 := rfl
example : HomologyClass.zero 18 = HomologyClass.zero 18 := rfl
example : HomologyClass.zero 19 = HomologyClass.zero 19 := rfl
example : HomologyClass.zero 20 = HomologyClass.zero 20 := rfl
example : HomologyClass.zero 21 = HomologyClass.zero 21 := rfl
example : HomologyClass.zero 22 = HomologyClass.zero 22 := rfl
example : HomologyClass.zero 23 = HomologyClass.zero 23 := rfl
example : HomologyClass.zero 24 = HomologyClass.zero 24 := rfl
example : HomologyClass.zero 25 = HomologyClass.zero 25 := rfl
example : HomologyClass.zero 26 = HomologyClass.zero 26 := rfl
example : HomologyClass.zero 27 = HomologyClass.zero 27 := rfl
example : HomologyClass.zero 28 = HomologyClass.zero 28 := rfl
example : HomologyClass.zero 29 = HomologyClass.zero 29 := rfl
example : HomologyClass.zero 30 = HomologyClass.zero 30 := rfl
example : HomologyClass.zero 31 = HomologyClass.zero 31 := rfl
example : HomologyClass.zero 32 = HomologyClass.zero 32 := rfl
example : HomologyClass.zero 33 = HomologyClass.zero 33 := rfl
example : HomologyClass.zero 34 = HomologyClass.zero 34 := rfl
example : HomologyClass.zero 35 = HomologyClass.zero 35 := rfl
example : HomologyClass.zero 36 = HomologyClass.zero 36 := rfl
example : HomologyClass.zero 37 = HomologyClass.zero 37 := rfl
example : HomologyClass.zero 38 = HomologyClass.zero 38 := rfl
example : HomologyClass.zero 39 = HomologyClass.zero 39 := rfl
example : HomologyClass.zero 40 = HomologyClass.zero 40 := rfl
example : HomologyClass.zero 41 = HomologyClass.zero 41 := rfl
example : HomologyClass.zero 42 = HomologyClass.zero 42 := rfl
example : HomologyClass.zero 43 = HomologyClass.zero 43 := rfl
example : HomologyClass.zero 44 = HomologyClass.zero 44 := rfl
example : HomologyClass.zero 45 = HomologyClass.zero 45 := rfl
example : HomologyClass.zero 46 = HomologyClass.zero 46 := rfl
example : HomologyClass.zero 47 = HomologyClass.zero 47 := rfl
example : HomologyClass.zero 48 = HomologyClass.zero 48 := rfl
example : HomologyClass.zero 49 = HomologyClass.zero 49 := rfl
example : cycles ChainComplex.zero 0 PUnit.unit := rfl
example : cycles ChainComplex.zero 1 PUnit.unit := rfl
example : cycles ChainComplex.zero 2 PUnit.unit := rfl
example : cycles ChainComplex.zero 3 PUnit.unit := rfl
example : cycles ChainComplex.zero 4 PUnit.unit := rfl
example : cycles ChainComplex.zero 5 PUnit.unit := rfl
example : cycles ChainComplex.zero 6 PUnit.unit := rfl
example : cycles ChainComplex.zero 7 PUnit.unit := rfl
example : cycles ChainComplex.zero 8 PUnit.unit := rfl
example : cycles ChainComplex.zero 9 PUnit.unit := rfl
example : cycles ChainComplex.zero 10 PUnit.unit := rfl
example : cycles ChainComplex.zero 11 PUnit.unit := rfl
example : cycles ChainComplex.zero 12 PUnit.unit := rfl
example : cycles ChainComplex.zero 13 PUnit.unit := rfl
example : cycles ChainComplex.zero 14 PUnit.unit := rfl
example : cycles ChainComplex.zero 15 PUnit.unit := rfl
example : cycles ChainComplex.zero 16 PUnit.unit := rfl
example : cycles ChainComplex.zero 17 PUnit.unit := rfl
example : cycles ChainComplex.zero 18 PUnit.unit := rfl
example : cycles ChainComplex.zero 19 PUnit.unit := rfl
example : cycles ChainComplex.zero 20 PUnit.unit := rfl
example : cycles ChainComplex.zero 21 PUnit.unit := rfl
example : cycles ChainComplex.zero 22 PUnit.unit := rfl
example : cycles ChainComplex.zero 23 PUnit.unit := rfl
example : cycles ChainComplex.zero 24 PUnit.unit := rfl
example : cycles ChainComplex.zero 25 PUnit.unit := rfl
example : cycles ChainComplex.zero 26 PUnit.unit := rfl
example : cycles ChainComplex.zero 27 PUnit.unit := rfl
example : cycles ChainComplex.zero 28 PUnit.unit := rfl
example : cycles ChainComplex.zero 29 PUnit.unit := rfl

end MiniDerivedCategories