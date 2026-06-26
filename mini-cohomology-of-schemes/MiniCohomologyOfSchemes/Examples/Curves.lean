import MiniCohomologyOfSchemes.Core.Basic
/-! L6: Cohomology of algebraic curves: P^1, elliptic, hyperelliptic. -/
namespace MiniCohomologyOfSchemes
def genus_from_h1_cohom (h1 : Nat) : Nat := h1
def curve_canonicalDegree (g : Nat) : Int := 2*(Int.ofNat g) - 2
def rational_curve_H0 (d : Int) : Nat := P1_h0_O_d d
def rational_curve_H1 (d : Int) : Nat := P1_h1_O_d d
def elliptic_H0 (d : Int) : Nat := if d = 0 then 1 else if d > 0 then Int.toNat d else 0
def elliptic_H1 (d : Int) : Nat := if d = 0 then 1 else if d < 0 then Int.toNat (-d) else 0
def genus2_H0 (d : Int) : Nat := if d >= 3 then Int.toNat d - 1 else if d >= 0 then 1 else 0
def genus2_H1 (d : Int) : Nat := if d <= -1 then Int.toNat (-d) + 1 else if d <= 2 then 2 - Int.toNat d else 0
def genus3_H0 (d : Int) : Nat := if d >= 5 then Int.toNat d - 2 else if d >= 0 then 1 else 0
def genus3_H1 (d : Int) : Nat := if d <= -1 then Int.toNat (-d) + 3 else if d <= 4 then 3 - Int.toNat d else 0
def cliffordBound (g : Nat) (d : Nat) : Nat := d / 2
def brillNoether (g r d : Nat) : Int := (Int.ofNat g) - (Int.ofNat (r+1)) * ((Int.ofNat g) - (Int.ofNat d) + (Int.ofNat r))
def weierstrassGaps (g : Nat) : List Nat := List.range g |>.map (fun i => i+1)
def gonality (g : Nat) : Nat := (g + 3) / 2
def moduliDimension (g : Nat) : Int := if g >= 2 then 3*(Int.ofNat g) - 3 else -1
def hurwitzGenus (gp deg : Nat) (ram : Int) : Int := ((Int.ofNat deg) * (2*(Int.ofNat gp) - 2) + ram + 2) / 2
#eval rational_curve_H0 0
#eval rational_curve_H1 (-2)
#eval elliptic_H0 0
#eval elliptic_H1 0
#eval genus2_H0 3
#eval genus2_H1 0
#eval brillNoether 4 1 3
#eval weierstrassGaps 3
#eval gonality 1
#eval gonality 2
#eval moduliDimension 2
#eval moduliDimension 3
#eval hurwitzGenus 0 2 4
#eval curve_canonicalDegree 0
#eval curve_canonicalDegree 1


end MiniCohomologyOfSchemes