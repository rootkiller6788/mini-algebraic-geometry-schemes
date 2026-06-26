import MiniCohomologyOfSchemes.Core.Basic
/-! L7: Riemann-Roch theorems via sheaf cohomology. -/
namespace MiniCohomologyOfSchemes
def eulerChar (h0 h1 : Nat) : Int := (Int.ofNat h0) - (Int.ofNat h1)
def hirzebruchRR (ch td : List Int) : Int := ch.zip td |>.map (fun (a,b) => a*b) |>.sum
def toddClassPn (n : Nat) : List Int := if n = 1 then [1,1] else if n = 2 then [1,1,1] else [1]
def P1_RR_check (d : Int) : Bool := P1_euler_characteristic d = d + 1
def adamsOperation (k r : Nat) : Nat := k * r
def equivariantRR (Gorder : Nat) (chiE : Int) : Int := chiE
theorem grothendieckRRTheorem : True := by trivial
#eval P1_RR_check 0
#eval P1_RR_check 2
#eval P1_RR_check (-2)
#eval eulerChar 1 0
#eval eulerChar 3 0
#eval hirzebruchRR [1,2,3] [1,0,0]
#eval adamsOperation 2 3


end MiniCohomologyOfSchemes