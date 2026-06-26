/-
Mini Schemes: Basic Examples and Evaluations
Demonstrates core concepts from the mini-schemes formalization.
Each example includes #eval verification.

Topics:
- Ring theory: ideal membership, primality checks
- Spec Z: Zariski topology, basic open sets
- Sheaf computations on Spec Z
- Elliptic curve point counting
- Modular arithmetic and cryptographic examples
- Number theory: prime counting, divisors, perfect numbers
- Algebraic geometry: Hasse bound, Goppa codes
-/

import MiniSchemes
open MiniSchemes

/-! ================================================================
    RING THEORY EXAMPLES
    ================================================================ -/

-- The zero ideal contains only 0
example : (Ideal.zero : Ideal Int).carrier 0 := by
  simp [Ideal.zero]

example : ¬ ((Ideal.zero : Ideal Int).carrier 5) := by
  simp [Ideal.zero]

-- The principal ideal (6) contains multiples of 6
example : (Ideal.principal (6 : Int)).carrier 12 := by
  refine ⟨2, ?_⟩; ring

example : ¬ ((Ideal.principal (6 : Int)).carrier 5) := by
  intro h; rcases h with ⟨k, hk⟩; omega

-- The zero ideal is prime in Z
def zeroPrime : PrimeIdeal Int := zeroPrimeInZ

-- D(2) contains (0) since 2 ≠ 0
example : D (2 : Int) specZGeneric := by
  have h2 : (2 : Int) ≠ 0 := by decide
  intro h
  exact h2 h

-- V(0) = Spec Z
example : V (Ideal.zero : Ideal Int) = fun _ => True := V_zero

-- D(6) = D(2) ∩ D(3)
example : D ((2 : Int) * (3 : Int)) = (fun p => D (2 : Int) p ∧ D (3 : Int) p) := by
  rw [D_inter_D]

/-! ================================================================
    SPEC Z TOPOLOGY EXAMPLES
    ================================================================ -/

-- The generic point (0) is dense: its closure is Spec Z
-- Every non-empty open set contains (0)
-- The closed points are (p) for primes p

-- Zariski topology: closed sets are finite unions of V(p) plus Spec Z
-- Open sets are cofinite (all but finitely many closed points)

/-! ================================================================
    RING HOMOMORPHISM EXAMPLES
    ================================================================ -/

-- Reduction mod 2: Z -> Z/2Z
def mod2 : RingHom Int Int := {
  toFun := fun x => x % 2
  map_add := fun x y => by simp [Int.add_emod]
  map_mul := fun x y => by simp [Int.mul_emod]
  map_one := by simp
  map_zero := by simp
}

#eval mod2 0
#eval mod2 1
#eval mod2 2
#eval mod2 (-1)

-- Kernel of mod2: even integers = ideal (2)
example : mod2.ker 4 := by
  unfold RingHom.ker mod2; simp

example : ¬ (mod2.ker 5) := by
  unfold RingHom.ker mod2; simp

-- Identity homomorphism
example (R : Type u) [CommRing R] (x : R) : (RingHom.id : RingHom R R) x = x := rfl

-- Composition of homomorphisms
example : (mod2.comp RingHom.id) 5 = mod2 5 := rfl

/-! ================================================================
    MODULAR ARITHMETIC
    ================================================================ -/

-- Modular exponentiation: base^exp mod modulus
#eval modPow 3 5 7
#eval modPow 2 10 11
#eval modPow 5 100 97

-- Fermat''s Little Theorem: a^{p-1} ≡ 1 mod p for prime p, a not divisible by p
#eval modPow 2 6 7    -- 2^6 = 64 ≡ 1 mod 7 ✓
#eval modPow 3 6 7    -- 3^6 = 729 ≡ 1 mod 7 ✓
#eval modPow 2 10 11  -- 2^10 = 1024 ≡ 1 mod 11 ✓

-- GCD computations
#eval Nat.gcd 48 18
#eval Nat.gcd 1071 462
#eval Nat.gcd 0 5

-- Totient function: φ(n) = count of k in [1,n] with gcd(k,n)=1
#eval totient 10
#eval totient 100

-- Euler''s theorem: a^{φ(n)} ≡ 1 mod n for gcd(a,n)=1
#eval modPow 3 (totient 10) 10   -- 3^4 = 81 ≡ 1 mod 10 ✓
#eval modPow 7 (totient 15) 15   -- 7^8 mod 15 = 5764801 mod 15 = 1 ✓

/-! ================================================================
    PRIME NUMBERS
    ================================================================ -/

#eval isPrimeN 2
#eval isPrimeN 3
#eval isPrimeN 17
#eval isPrimeN 91
#eval isPrimeN 97
#eval isPrimeN 101

-- List primes up to 50
#eval (List.range 50).filter isPrimeN

-- Mersenne primes: 2^p - 1
def mersenne (p : Nat) : Nat := (2 ^ p) - 1
#eval mersenne 2
#eval mersenne 3
#eval mersenne 5
#eval mersenne 7

-- Prime counting: π(x) = #{p ≤ x : p prime}
#eval primePi 10
#eval primePi 50

-- Twin primes
def isTwinPrime (p : Nat) : Bool := isPrimeN p && isPrimeN (p+2)
#eval (List.range 50).filter isTwinPrime

/-! ================================================================
    ELLIPTIC CURVES
    ================================================================ -/

-- Count points on y^2 = x^3 + a*x + b over F_p
#eval countEC 2 3 7
#eval countEC 0 1 5
#eval countEC 1 1 7
#eval countEC 0 1 11
#eval countEC 1 0 5

-- Hasse bound verification
#eval hasseCheck 7 (countEC 2 3 7)
#eval hasseCheck 5 (countEC 0 1 5)
#eval hasseCheck 11 (countEC 0 1 11)

-- Trace of Frobenius: a_q = q+1 - #E(F_q)
#eval traceFrobeniusEC 7 2 3
#eval traceFrobeniusEC 5 0 1

-- Weierstrass discriminant
#eval weierstrassDisc 0 1
#eval weierstrassDisc (-1) 0

-- Legendre symbol (quadratic residuosity)
#eval legendre 2 7
#eval legendre 3 7
#eval legendre 5 11

/-! ================================================================
    CRYPTOGRAPHY
    ================================================================ -/

-- RSA encryption/decryption
#eval rsaEncrypt 42 7 143
#eval rsaDecrypt (rsaEncrypt 42 7 143) 103 143

-- Diffie-Hellman shared secret
#eval dhShared 23 5 6 15

-- Goppa code parameters
#eval goppaParams 32 14 3
#eval goppaParams 64 20 4

-- Hermitian curve data
#eval hermitianGenus 2
#eval hermitianPoints 2
#eval hermitianGenus 3
#eval hermitianPoints 3

/-! ================================================================
    FIBONACCI AND COMBINATORICS
    ================================================================ -/

#eval fib 10
#eval fib 20
#eval fibList 10

#eval fac 5
#eval fac 10
#eval facList 8

-- Binomial coefficients
#eval choose 5 2
#eval choose 10 3
#eval choose 10 5

-- Pascal''s triangle
#eval pascalRow 0
#eval pascalRow 1
#eval pascalRow 5

-- Catalan numbers
#eval catalan 0
#eval catalan 1
#eval catalan 5
#eval catalan 10

-- Partitions
#eval partitions 1
#eval partitions 5
#eval partitions 10

/-! ================================================================
    NUMBER THEORY
    ================================================================ -/

-- Perfect numbers
#eval isPerfectN 6
#eval isPerfectN 28
#eval isPerfectN 496
#eval isPerfectN 12

-- Divisor sums
#eval sumDivisors 6
#eval sumDivisors 28
#eval sumDivisors 12

-- Number of divisors
#eval numDivisors 1
#eval numDivisors 6
#eval numDivisors 36

-- Möbius function
#eval moebius 1
#eval moebius 2
#eval moebius 6
#eval moebius 30

-- Modular square root (p ≡ 3 mod 4)
#eval modSqrt 2 7
#eval modSqrt 4 7

/-! ================================================================
    VERIFICATION OF KNOWN FACTS
    ================================================================ -/

-- Verify all computed values
#eval verifyAll

-- Individual verifications
example : modPow 3 5 7 = 5 := by decide
example : Nat.gcd 48 18 = 6 := by decide
example : fib 10 = 55 := by decide
example : fac 5 = 120 := by decide
example : sumList (List.range 11) = 55 := by decide

-- Ring identities
example (a b : Int) : (a+b)*(a+b) = a*a + 2*a*b + b*b := by ring
example : (-1 : Int) * (-1 : Int) = 1 := by decide
example (x : Int) : (x+1)*(x-1) + 1 = x*x := by ring

-- Modular arithmetic identities
example : (3 + 5) % 7 = 1 := by decide
example : (3 * 4) % 11 = 1 := by decide

-- Simple invariants
example : primePi 10 = 4 := by decide
example : sumDivisors 6 = 12 := by decide

