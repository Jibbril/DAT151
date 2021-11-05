// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class DoubleExp  extends Exp {
  public final Double double_;
  public DoubleExp(Double p1) { double_ = p1; }

  public <R,A> R accept(calc.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.DoubleExp) {
      calc.Absyn.DoubleExp x = (calc.Absyn.DoubleExp)o;
      return this.double_.equals(x.double_);
    }
    return false;
  }

  public int hashCode() {
    return this.double_.hashCode();
  }


}
