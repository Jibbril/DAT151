// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public class StreamSizeType  extends Type {
  public StreamSizeType() { }

  public <R,A> R accept(calc.Absyn.Type.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof calc.Absyn.StreamSizeType) {
      return true;
    }
    return false;
  }

  public int hashCode() {
    return 37;
  }


}
