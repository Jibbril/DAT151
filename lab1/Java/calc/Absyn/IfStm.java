// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class IfStm  extends Stm {
  public final Exp exp_;
  public final Stm stm_;
  public IfStm(Exp p1, Stm p2) { exp_ = p1; stm_ = p2; }

  public <R,A> R accept(calc.Absyn.Stm.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.IfStm) {
      calc.Absyn.IfStm x = (calc.Absyn.IfStm)o;
      return this.exp_.equals(x.exp_) && this.stm_.equals(x.stm_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(this.exp_.hashCode())+this.stm_.hashCode();
  }


}
