/- A list of Auxiliary definitions of SMT-LIB functions. -/

@[bv_normalize] def implies (a b : Bool) : Bool :=
  !a || b

namespace BitVec

@[bv_normalize] protected def nand {n : Nat} (x y : BitVec n) : BitVec n :=
  ~~~(x &&& y)

@[bv_normalize] protected def nor {n : Nat} (x y : BitVec n) : BitVec n :=
  ~~~(x ||| y)

@[bv_normalize] protected def xnor {n : Nat} (x y : BitVec n) : BitVec n :=
  ~~~(x ^^^ y)

@[bv_normalize] protected def compare (x y : BitVec n) : BitVec 1 :=
  bif x == y then 1#1 else 0#1

@[bv_normalize] protected def sgt {n : Nat} (x y : BitVec n) : Bool :=
  BitVec.slt y x

@[bv_normalize] protected def sge {n : Nat} (x y : BitVec n) : Bool :=
  BitVec.sle y x

/- TODO: bv_decide's default should be `sshiftRight'` -/
@[bv_normalize] theorem sshiftRight'_eq (x : BitVec w) (n : BitVec v) : x.sshiftRight' n = x.sshiftRight n.toNat :=
  rfl

end BitVec
