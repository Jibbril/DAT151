// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class OGtEq  extends CmpOp {
  public OGtEq() { }

  public <R,A> R accept(cmm.Absyn.CmpOp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.OGtEq) {
      return true;
    }
    return false;
  }

  public int hashCode() {
    return 37;
  }


}
