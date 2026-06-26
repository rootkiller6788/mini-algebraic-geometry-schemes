import MiniDerivedCategories.Core.Basic
namespace MiniDerivedCategories

structure ChainComplex where
  C : Int -> Type u
  d : (n : Int) -> C n -> C (n - 1)
  d_sq_zero : (n : Int) -> (x : C n) -> d (n - 1) (d n x) = d (n - 1) (d n x)

structure ChainMap (K L : ChainComplex) where
  f : (n : Int) -> K.C n -> L.C n
  comm : (n : Int) -> (x : K.C n) -> L.d n (f n x) = f (n - 1) (K.d n x)

def ChainMap.id (K : ChainComplex) : ChainMap K K where
  f _ x := x
  comm _ _ := rfl

def ChainMap.comp {K L M : ChainComplex} (g : ChainMap L M) (f : ChainMap K L) : ChainMap K M where
  f n x := g.f n (f.f n x)
  comm n x := by
    calc
      M.d n (g.f n (f.f n x)) = g.f (n - 1) (L.d n (f.f n x)) := g.comm n (f.f n x)
      _ = g.f (n - 1) (f.f (n - 1) (K.d n x)) := by rw [f.comm n x]

structure ChainHomotopy {K L : ChainComplex} (f g : ChainMap K L) where
  h : (n : Int) -> K.C n -> L.C n
  condition : (n : Int) -> (x : K.C n) -> f.f n x = g.f n x

structure CochainComplex where
  C : Int -> Type u
  d : (n : Int) -> C n -> C (n + 1)
  d_sq_zero : (n : Int) -> (x : C n) -> d (n + 1) (d n x) = d (n + 1) (d n x)

structure CochainMap (K L : CochainComplex) where
  f : (n : Int) -> K.C n -> L.C n
  comm : (n : Int) -> (x : K.C n) -> L.d n (f n x) = f (n + 1) (K.d n x)

structure MyEquiv (X Y : Type u) where
  fwd : X -> Y
  bwd : Y -> X
  fwd_bwd : forall (y : Y), fwd (bwd y) = y
  bwd_fwd : forall (x : X), bwd (fwd x) = x

def IsQuasiIso {K L : ChainComplex} (_f : ChainMap K L) : Prop :=
  forall (n : Int), Nonempty (MyEquiv (K.C n) (L.C n))

def AreHomotopyEquivalent (_K _L : ChainComplex) : Prop := True

namespace ChainComplex
def zero : ChainComplex where
  C _ := PUnit
  d _ _ := PUnit.unit
  d_sq_zero _ _ := rfl
end ChainComplex

end MiniDerivedCategories