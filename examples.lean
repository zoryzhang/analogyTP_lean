import Mathlib
import LeanCopilot
import Aesop

set_option maxHeartbeats 0
set_option maxRecDepth 1000000000

-- ex0

open Nat (add_assoc add_comm)

def hello := "world"

theorem hello_world (a b c : Nat)
 : a + b + c = a + c + b := by
 rw [add_assoc, add_comm b, ←add_assoc]

-- ex1
-- telescoping trick

-- ex2

--def f (n : ℕ) : ℕ := n ^ 3 - n

example (n : ℕ ) : 2 ^ n > n := by
  have h (m : ℕ ) : (2 ^ m) > m → (2 ^ (m+1)) > (m+1) := by
    intro h
    rw [pow_succ]
    linarith
  induction n with
  | zero => simp
  | succ n ih => exact h n ih

example (n : ℕ ) : 3 ∣ n ^ 3 - n := by
  have h (m : ℕ ) : 3 ∣ m ^ 3 - m → 3 ∣ (m + 1) ^ 3 - (m + 1) := by
    intro h2
    ring_nf
    obtain ⟨k, hk⟩ := h2
    use m + m ^ 2 + k
    ring_nf
    rw [Nat.mul_comm k 3, ←hk]
    suggest_tactics
  induction n with
  | zero => simp [Nat.zero_eq, zero_add, forall_const]
  | succ n ih => exact h n ih