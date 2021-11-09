// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class StmInit2  extends Stm {
  public final Exp exp_1, exp_2;
  public final String id_;
  public StmInit2(Exp p1, String p2, Exp p3) { exp_1 = p1; id_ = p2; exp_2 = p3; }

  public <R,A> R accept(calc.Absyn.Stm.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.StmInit2) {
      calc.Absyn.StmInit2 x = (calc.Absyn.StmInit2)o;
      return this.exp_1.equals(x.exp_1) && this.id_.equals(x.id_) && this.exp_2.equals(x.exp_2);
    }
    return false;
  }

  public int hashCode() {
    return 37*(37*(this.exp_1.hashCode())+this.id_.hashCode())+this.exp_2.hashCode();
  }


}
