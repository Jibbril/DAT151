// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class StmDecl2  extends Stm {
  public final Exp exp_;
  public final String id_;
  public StmDecl2(Exp p1, String p2) { exp_ = p1; id_ = p2; }

  public <R,A> R accept(calc.Absyn.Stm.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.StmDecl2) {
      calc.Absyn.StmDecl2 x = (calc.Absyn.StmDecl2)o;
      return this.exp_.equals(x.exp_) && this.id_.equals(x.id_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(this.exp_.hashCode())+this.id_.hashCode();
  }


}
