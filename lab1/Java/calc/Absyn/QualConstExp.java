// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class QualConstExp  extends Exp {
  public final ListId listid_;
  public QualConstExp(ListId p1) { listid_ = p1; }

  public <R,A> R accept(calc.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.QualConstExp) {
      calc.Absyn.QualConstExp x = (calc.Absyn.QualConstExp)o;
      return this.listid_.equals(x.listid_);
    }
    return false;
  }

  public int hashCode() {
    return this.listid_.hashCode();
  }


}
