// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public class DFun  extends Def {
  public final Type type_;
  public final String id_;
  public final ListArg listarg_;
  public final ListStm liststm_;
  public DFun(Type p1, String p2, ListArg p3, ListStm p4) { type_ = p1; id_ = p2; listarg_ = p3; liststm_ = p4; }

  public <R,A> R accept(cmm.Absyn.Def.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof cmm.Absyn.DFun) {
      cmm.Absyn.DFun x = (cmm.Absyn.DFun)o;
      return this.type_.equals(x.type_) && this.id_.equals(x.id_) && this.listarg_.equals(x.listarg_) && this.liststm_.equals(x.liststm_);
    }
    return false;
  }

  public int hashCode() {
    return 37*(37*(37*(this.type_.hashCode())+this.id_.hashCode())+this.listarg_.hashCode())+this.liststm_.hashCode();
  }

  public String getId() {return id_;}

}
