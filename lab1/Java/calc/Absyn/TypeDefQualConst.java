// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class TypeDefQualConst  extends Stm {
  public final Exp exp_;
  public final String id_;
  public TypeDefQualConst(Exp p1, String p2) { exp_ = p1; id_ = p2; }

  public <R,A> R accept(calc.Absyn.Stm.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.TypeDefQualConst) {
      calc.Absyn.TypeDefQualConst x = (calc.Absyn.TypeDefQualConst)o;
      return this.exp_.equals(x.exp_) && this.id_.equals(x.id_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(this.exp_.hashCode())+this.id_.hashCode();
  }


}
