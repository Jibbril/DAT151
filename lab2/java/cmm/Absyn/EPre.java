// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class EPre  extends Exp {
  public final IncDecOp incdecop_;
  public final String id_;
  public EPre(IncDecOp p1, String p2) { incdecop_ = p1; id_ = p2; }

  public <R,A> R accept(cmm.Absyn.Exp.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.EPre) {
      cmm.Absyn.EPre x = (cmm.Absyn.EPre)o;
      return this.incdecop_.equals(x.incdecop_) && this.id_.equals(x.id_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(this.incdecop_.hashCode())+this.id_.hashCode();
  }


}
