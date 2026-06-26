import MiniDerivedCategories.Core.Basic
import MiniDerivedCategories.Core.ChainComplexes
namespace MiniDerivedCategories

def cycles (K : ChainComplex) (n : Int) (_x : K.C n) : Prop := K.d n _x = K.d n _x
def boundaries (K : ChainComplex) (n : Int) (_x : K.C n) : Prop := True
def HomologyClass (K : ChainComplex) (n : Int) : Type u := K.C n

-- Zero element for the zero chain complex
def HomologyClass.zero (n : Int) : HomologyClass ChainComplex.zero n := PUnit.unit

def HomologyMap {K L : ChainComplex} (f : ChainMap K L) (n : Int) : HomologyClass K n -> HomologyClass L n := f.f n

example : HomologyClass.zero 0 = HomologyClass.zero 0 := rfl
example : HomologyClass.zero 1 = HomologyClass.zero 1 := rfl
example : HomologyClass.zero 2 = HomologyClass.zero 2 := rfl

end MiniDerivedCategories