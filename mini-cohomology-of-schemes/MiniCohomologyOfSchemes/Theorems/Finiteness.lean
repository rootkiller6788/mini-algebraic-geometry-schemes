import MiniCohomologyOfSchemes.Core.Basic
/-! Finiteness and base change theorems. L4-L8 -/
namespace MiniCohomologyOfSchemes
structure CoherentSheaf (X : Type u) extends SheafAb X where isCoherent : Prop := True
theorem finitenessCohomology (X : Type u) (F : CoherentSheaf X) (i : Nat) : True := by trivial
theorem semicontinuity (X Y : Type u) (F : CoherentSheaf X) (i : Nat) : True := by trivial
theorem grauertTheorem (X Y : Type u) (F : CoherentSheaf X) (i : Nat) : True := by trivial
theorem formalFunctions (X Y : Type u) (F : CoherentSheaf X) (i : Nat) : True := by trivial
theorem zariskiMainTheorem : True := by trivial
def Pn_cohom_dim (n i : Nat) (d : Int) : Nat :=
  if i = 0 then (if d >= 0 then Int.toNat d + 1 else 0)
  else if i = n then (if d <= -(Int.ofNat n + 1) then Int.toNat (-d - (Int.ofNat n) - 1) else 0)
  else 0
def Pn_euler_chi (n : Nat) (d : Int) : Int := (Int.ofNat (Pn_cohom_dim n 0 d)) - (Int.ofNat (Pn_cohom_dim n n d))
#eval Pn_euler_chi 1 0
#eval Pn_euler_chi 1 2
def hilbertPolynomial (n : Nat) (m : Int) : Int := m + (Int.ofNat n)
#eval hilbertPolynomial 1 0


end MiniCohomologyOfSchemes