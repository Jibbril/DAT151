// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public abstract class MulOp implements java.io.Serializable {
  public abstract <R,A> R accept(MulOp.Visitor<R,A> v, A arg);
  public interface Visitor <R,A> {
    public R visit(cmm.Absyn.OTimes p, A arg);
    public R visit(cmm.Absyn.ODiv p, A arg);

  }

}