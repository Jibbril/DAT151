// File generated by the BNF Converter (bnfc 2.9.3).

package fun.Absyn;

public abstract class Exp implements java.io.Serializable {
  public abstract <R,A> R accept(Exp.Visitor<R,A> v, A arg);
  public interface Visitor <R,A> {
    public R visit(fun.Absyn.EVar p, A arg);
    public R visit(fun.Absyn.EInt p, A arg);
    public R visit(fun.Absyn.EApp p, A arg);
    public R visit(fun.Absyn.EAdd p, A arg);
    public R visit(fun.Absyn.ESub p, A arg);
    public R visit(fun.Absyn.ELt p, A arg);
    public R visit(fun.Absyn.EIf p, A arg);
    public R visit(fun.Absyn.EAbs p, A arg);

  }

}