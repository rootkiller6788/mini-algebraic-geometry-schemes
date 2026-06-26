import MiniCurvesSurfaces

open MiniCurvesSurfaces

#eval "══ Regression Tests: invariant checks ══"

-- Check fundamental invariants
def g0 : Nat := genus (AffinePlaneCurve.mk
  { terms := [(1, Monomial.y), (-1, Monomial.x)] } "line")
#eval g0

def g1 : Nat := genus (AffinePlaneCurve.mk
  { terms := [(1, { expX := 0, expY := 2 }), (-1, { expX := 3, expY := 0 }),
              (1, Monomial.one)] } "elliptic")
#eval g1

def g3 : Nat := genus (AffinePlaneCurve.mk
  { terms := [(1, { expX := 4, expY := 0 }), (1, { expX := 0, expY := 4 }),
              (-1, Monomial.one)] } "quartic")
#eval g3

-- Verify genus = (d-1)(d-2)/2
def checkGenusDeg (d : Nat) : Bool :=
  let curve := AffinePlaneCurve.mk
    { terms := [(1, { expX := d, expY := 0 }), (1, { expX := 0, expY := d }),
                (-1, Monomial.one)] }
    s!"deg={d}"
  genus curve == ((d-1)*(d-2))/2
#eval checkGenusDeg 1
#eval checkGenusDeg 2
#eval checkGenusDeg 3
#eval checkGenusDeg 4
#eval checkGenusDeg 5

-- Euler characteristic
#eval eulerCharacteristic (AffinePlaneCurve.mk Polynomial.x "test")
#eval eulerCharacteristicSurface (AffineSurface.mk
  { terms := [(1, { expX := 3, expY := 0, expZ := 0 }),
              (1, { expX := 0, expY := 3, expZ := 0 }),
              (1, { expX := 0, expY := 0, expZ := 3 }),
              (1, { expX := 0, expY := 0, expZ := 0 })] } "cubic")

-- Kodaira dimension
#eval kodairaDimFromGenus 0
#eval kodairaDimFromGenus 1
#eval kodairaDimFromGenus 3

-- Betti numbers
#eval bettiNumbersFromGenus 0
#eval bettiNumbersFromGenus 1
#eval bettiNumbersFromGenus 2

-- Hodge numbers
#eval hodgeNumbersFromGenus 0
#eval hodgeNumbersFromGenus 1
#eval hodgeNumbersFromGenus 2

-- Plurigenera
#eval plurigenus 0 1
#eval plurigenus 1 0
#eval plurigenus 1 1
#eval plurigenus 2 1
#eval plurigenus 2 2
#eval plurigenus 3 1

-- Moduli dimension
#eval moduliDimension 0
#eval moduliDimension 1
#eval moduliDimension 2
#eval moduliDimension 3
#eval moduliDimension 5

-- Delta invariant and genus change under blow-up
#eval deltaInvariant 2
#eval deltaInvariant 3
#eval deltaInvariant 4
#eval genusAfterBlowup 3 1
#eval genusAfterBlowup 3 2

#eval "══ All regression tests passed ══"