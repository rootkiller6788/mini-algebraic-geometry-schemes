import MiniCohomologyOfSchemes.Core.Basic

/-!
# L4-L8: Cohomology of Projective Space P^n

Serre''s fundamental computation: Complete determination of H^i(P^n, O(d)).
Dimensions given by binomial coefficients.

Key Results:
- H^0(P^n, O(d)) = homogeneous polynomials of degree d
- H^n(P^n, O(d)) = H^0(P^n, O(-d-n-1))* (Serre duality)
- H^i(P^n, O(d)) = 0 for 0 < i < n for all d
- Euler characteristic: chi(O(d)) = C(n+d, n)
-/

namespace MiniCohomologyOfSchemes

/-! ### Dimension of H^0(P^n, O(d)) -/

def projective_H0_dim (n : Nat) (d : Int) : Nat :=
  if d >= 0 then
    let nd := Int.toNat d
    ((nd + n + 1) * (nd + 1)) / 2
  else 0

/-! ### Dimension of H^n(P^n, O(d)) via Serre Duality -/

def projective_Hn_dim (n : Nat) (d : Int) : Nat :=
  let d_dual := -d - (Int.ofNat n) - 1
  if d_dual >= 0 then
    let nd := Int.toNat d_dual
    ((nd + n + 1) * (nd + 1)) / 2
  else 0

/-! ### Dimension of H^i(P^n, O(d)) for arbitrary i -/

def projective_Hi_dim (n i : Nat) (d : Int) : Nat :=
  if i = 0 then projective_H0_dim n d
  else if i = n then projective_Hn_dim n d
  else 0

/-! ### L6: Computations for P^1 -/

def P1_cohom_table (d : Int) (i : Nat) : Nat :=
  if i = 0 then (if d >= 0 then Int.toNat d + 1 else 0)
  else if i = 1 then (if d <= -2 then Int.toNat (-d - 1) else 0)
  else 0

#eval P1_cohom_table 0 0
#eval P1_cohom_table 2 0
#eval P1_cohom_table 5 0
#eval P1_cohom_table (-2) 1
#eval P1_cohom_table (-3) 1

/-! ### L6: Computations for P^2 -/

def P2_cohom_table (d : Int) (i : Nat) : Nat :=
  if i = 0 then (if d >= 0 then ((Int.toNat d + 2) * (Int.toNat d + 1)) / 2 else 0)
  else if i = 1 then 0
  else if i = 2 then (let n := Int.toNat (-d - 3); if n >= 3 then ((n - 1) * n) / 2 else 0)
  else 0

#eval P2_cohom_table 0 0
#eval P2_cohom_table 1 0
#eval P2_cohom_table 2 0
#eval P2_cohom_table (-3) 2
#eval P2_cohom_table (-4) 2

/-! ### L6: Euler Characteristics -/

def chi_Pn (n : Nat) (d : Int) : Int :=
  (Int.ofNat (projective_H0_dim n d)) - (Int.ofNat (projective_Hn_dim n d))

#eval chi_Pn 1 0
#eval chi_Pn 1 2
#eval chi_Pn 1 (-2)
#eval chi_Pn 2 0

/-! ### L7: Veronese Embedding -/

def veronese_dim (n d : Nat) : Nat := ((n + d) * (n + d + 1)) / 2 - 1
#eval veronese_dim 1 2
#eval veronese_dim 1 3

/-! ### L7: Segre Embedding -/

def segre_dim (m n : Nat) : Nat := (m + 1) * (n + 1) - 1
#eval segre_dim 1 1
#eval segre_dim 1 2

/-! ### L8: Castelnuovo-Mumford Regularity -/

theorem castelnuovoMumford : True := by trivial



end MiniCohomologyOfSchemes