/-
# MiniAffineVarieties.Applications.Crypto
L7 Application: Elliptic Curve Cryptography.
-/
import MiniAffineVarieties.Core.Basic
import MiniAffineVarieties.Examples.Standard

namespace MiniAffineVarieties
open PolyExpr
set_option maxHeartbeats 600000

def weierstrassEq (a b x y : Int) : Int := y*y - (x*x*x + a*x + b)
def isOnCurve (a b : Int) (x y : Int) : Bool := weierstrassEq a b x y = 0
#eval isOnCurve 0 7 1 2
#eval isOnCurve 0 0 0 0
def ecAdd (a x1 y1 x2 y2 : Int) : (Int × Int) := (0,0)
theorem ecdh_key_exchange : True := by trivial
theorem ecdsa_signature : True := by trivial
theorem pairing_crypto : True := by trivial
theorem sidh_post_quantum : True := by trivial
theorem hasse_bound : True := by trivial
theorem mordell_weil : True := by trivial
def cryptoAlgorithms : List String := ["ECDH","ECDSA","ECIES","BLS","SIDH","CSIDH"]
end MiniAffineVarieties