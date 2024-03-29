// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class ADecl  extends Arg {
  public final Type type_;
  public final String id_;
  public ADecl(Type p1, String p2) { type_ = p1; id_ = p2; }

  public <R,A> R accept(calc.Absyn.Arg.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.ADecl) {
      calc.Absyn.ADecl x = (calc.Absyn.ADecl)o;
      return this.type_.equals(x.type_) && this.id_.equals(x.id_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(this.type_.hashCode())+this.id_.hashCode();
  }


}
