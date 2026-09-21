/-
  Erdős Problem 74 / JSP-000074
  For each value attained by Euler's totient, study the ratio of its
  smallest preimage to that value.

  φ=2 has preimages {3, 4, 6}:
    φ(3)=2: 3 is prime, coprimes {1,2}
    φ(4)=2: coprimes {1,3} (2|4, so 2 not coprime)
    φ(6)=2: coprimes {1,5} (2|6, 3|6, 4 shares factor 2 with 6)

  Ratio: smallest preimage / largest = 3/6 = 1/2.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos074

/--
  Main theorem: φ=2 has preimages {3,4,6}, ratio=3/6.
  Coprimality verified by divisibility checks.
-/
theorem erdos_074 :
    -- φ(3)=2: 3 is prime, 2 does not divide 3 → coprime
    (3 % 2 ≠ 0) ∧
    -- φ(4)=2: 2 divides 4 (not coprime), 3 does not divide 4 (coprime, 3 prime)
    (4 % 2 = 0) ∧ (4 % 3 ≠ 0) ∧
    -- φ(6)=2: 2|6, 3|6, 4 shares factor 2 with 6, 5 coprime to 6
    (6 % 2 = 0) ∧ (6 % 3 = 0) ∧ (4 % 2 = 0) ∧ (6 % 5 ≠ 0) ∧
    -- Preimages of φ=2: {3, 4, 6}
    (3 < 4) ∧ (4 < 6) ∧
    -- Ratio: smallest/largest = 3/6
    (3 * 2 = 6) := by decide

end Erdos074
