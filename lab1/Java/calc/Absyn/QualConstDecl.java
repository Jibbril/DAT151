// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class QualConstDecl  extends QualConst {
  public final String id_;
  public QualConstDecl(String p1) { id_ = p1; }

  public <R,A> R accept(calc.Absyn.QualConst.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.QualConstDecl) {
      calc.Absyn.QualConstDecl x = (calc.Absyn.QualConstDecl)o;
      return this.id_.equals(x.id_);
    }
    return false;
  }

  public int hashCode() {
    return this.id_.hashCode();
  }


}
