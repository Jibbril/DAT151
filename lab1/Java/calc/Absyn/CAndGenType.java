// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class CAndGenType  extends GenType {
  public final Type type_;
  public CAndGenType(Type p1) { type_ = p1; }

  public <R,A> R accept(calc.Absyn.GenType.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.CAndGenType) {
      calc.Absyn.CAndGenType x = (calc.Absyn.CAndGenType)o;
      return this.type_.equals(x.type_);
    }
    return false;
  }

  public int hashCode() {
    return this.type_.hashCode();
  }


}
