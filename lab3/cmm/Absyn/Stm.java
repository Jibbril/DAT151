// File generated by the BNF Converter (bnfc 2.9.3).

package cmm.Absyn;

public abstract class Stm implements java.io.Serializable {
  public abstract <R,A> R accept(Stm.Visitor<R,A> v, A arg);
  public interface Visitor <R,A> {
    public R visit(cmm.Absyn.SExp p, A arg);
    public R visit(cmm.Absyn.SDecls p, A arg);
    public R visit(cmm.Absyn.SInit p, A arg);
    public R visit(cmm.Absyn.SReturn p, A arg);
    public R visit(cmm.Absyn.SWhile p, A arg);
    public R visit(cmm.Absyn.SBlock p, A arg);
    public R visit(cmm.Absyn.SIfElse p, A arg);

  }

}
