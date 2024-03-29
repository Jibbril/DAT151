// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public abstract class Type implements java.io.Serializable {
  public abstract <R,A> R accept(Type.Visitor<R,A> v, A arg);
  public interface Visitor <R,A> {
    public R visit(cmm.Absyn.Type_bool p, A arg);
    public R visit(cmm.Absyn.Type_int p, A arg);
    public R visit(cmm.Absyn.Type_double p, A arg);
    public R visit(cmm.Absyn.Type_void p, A arg);

  }

}
