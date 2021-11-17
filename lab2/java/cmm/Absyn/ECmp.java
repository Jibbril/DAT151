// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class ECmp  extends Exp {
  public final Exp exp_1, exp_2;
  public final CmpOp cmpop_;
  public ECmp(Exp p1, CmpOp p2, Exp p3) { exp_1 = p1; cmpop_ = p2; exp_2 = p3; }

  public <R,A> R accept(cmm.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.ECmp) {
      cmm.Absyn.ECmp x = (cmm.Absyn.ECmp)o;
      return this.exp_1.equals(x.exp_1) && this.cmpop_.equals(x.cmpop_) && this.exp_2.equals(x.exp_2);
    }
    return false;
  }

  public int hashCode() {
    return 37*(37*(this.exp_1.hashCode())+this.cmpop_.hashCode())+this.exp_2.hashCode();
  }


}
