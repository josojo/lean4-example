import Mathlib.Data.Nat.Prime
import Mathlib.Data.Nat.Factorial.Basic

open Nat

namespace Nat


def build_bigger_prime (n: Nat) : Nat := minFac ( Nat.factorial n + 1)


theorem infinite_primes (n : ℕ) : ∃ p, n ≤ p ∧ Prime p :=
  let p := build_bigger_prime n
  have f1 : n ! + 1 ≠ 1 := Nat.ne_of_gt <| Nat.succ_lt_succ <| Nat.factorial_pos _
  have p_is_prime : Prime p := Nat.minFac_prime f1
  have p_bt_n : n ≤ p :=
    le_of_not_ge fun h =>
      have h₁ : p ∣ n ! := dvd_factorial (minFac_pos _) h
      have h₂ : p ∣ 1 := (Nat.dvd_add_iff_right h₁).2 (minFac_dvd _)
      p_is_prime.not_dvd_one h₂
  ⟨p, p_bt_n, p_is_prime⟩
