// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class PDefs  extends Program {
  public final ListDef listdef_;
  public PDefs(ListDef p1) { listdef_ = p1; }

  public <R,A> R accept(cmm.Absyn.Program.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.PDefs) {
      cmm.Absyn.PDefs x = (cmm.Absyn.PDefs)o;
      return this.listdef_.equals(x.listdef_);
    }
    return false;
  }

  public int hashCode() {
    return this.listdef_.hashCode();
  }


}
