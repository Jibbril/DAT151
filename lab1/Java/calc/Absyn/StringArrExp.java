// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class StringArrExp  extends Exp {
  public final ListString liststring_;
  public StringArrExp(ListString p1) { liststring_ = p1; }

  public <R,A> R accept(calc.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.StringArrExp) {
      calc.Absyn.StringArrExp x = (calc.Absyn.StringArrExp)o;
      return this.liststring_.equals(x.liststring_);
    }
    return false;
  }

  public int hashCode() {
    return this.liststring_.hashCode();
  }


}
