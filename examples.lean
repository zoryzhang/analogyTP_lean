import Mathlib

theorem ex2_src (n : ℕ ) : 2 ^ n > n := by
  have h (m : ℕ ) : (2 ^ m) > m → (2 ^ (m+1)) > (m+1) := by
    intro h
    rw [pow_succ]
    linarith
  induction n with
  | zero => simp
  | succ n ih => exact h n ih

theorem ex2_tgt (n : ℕ ) : 3 ∣ n ^ 3 - n := by
  have h (m : ℕ ) : 3 ∣ m ^ 3 - m → 3 ∣ (m + 1) ^ 3 - (m + 1) := by
    intro h2
    obtain ⟨k, hk⟩ := h2
    use m + m ^ 2 + k
    ring_nf
    rw [Nat.mul_comm k 3, ←hk, Nat.sub_add_eq, ←Nat.add_sub_assoc]
    simp [Nat.add_comm, Nat.add_assoc]
    refine Nat.le_self_pow ?hn m
    norm_num
  induction n with
  | zero => simp [Nat.zero_eq, zero_add, forall_const]
  | succ n ih => exact h n ih

theorem t1 (p q : Prop) : p ∨ q → q ∨ p := by
  intro h
  cases h
  . apply Or.inr
    assumption
  . apply Or.inl
    assumption

theorem t2 (p q r : Prop) : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) := by
  apply Iff.intro
  . intro h
    match h with
    | ⟨_, Or.inl _⟩ => apply Or.inl; constructor <;> assumption
    | ⟨_, Or.inr _⟩ => apply Or.inr; constructor <;> assumption
  . intro h
    match h with
    | Or.inl ⟨hp, hq⟩ => constructor; exact hp; apply Or.inl; exact hq
    | Or.inr ⟨hp, hr⟩ => constructor; exact hp; apply Or.inr; exact hr