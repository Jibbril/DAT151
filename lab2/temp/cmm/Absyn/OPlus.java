// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class OPlus  extends AddOp {
  public OPlus() { }

  public <R,A> R accept(cmm.Absyn.AddOp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.OPlus) {
      return true;
    }
    return false;
  }

  public int hashCode() {
    return 37;
  }


}
