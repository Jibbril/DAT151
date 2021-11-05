// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class StmInit  extends Stm {
  public final Type type_;
  public final String id_;
  public final Exp exp_;
  public StmInit(Type p1, String p2, Exp p3) { type_ = p1; id_ = p2; exp_ = p3; }

  public <R,A> R accept(calc.Absyn.Stm.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.StmInit) {
      calc.Absyn.StmInit x = (calc.Absyn.StmInit)o;
      return this.type_.equals(x.type_) && this.id_.equals(x.id_) && this.exp_.equals(x.exp_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(37*(this.type_.hashCode())+this.id_.hashCode())+this.exp_.hashCode();
  }


}
