// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class Type_int  extends Type {
  public Type_int() { }

  public <R,A> R accept(cmm.Absyn.Type.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.Type_int) {
      return true;
    }
    return false;
  }

  public int hashCode() {
    return 37;
  }


}
