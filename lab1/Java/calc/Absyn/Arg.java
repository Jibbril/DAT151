// File generated by the BNF Converter (bnfc 2.9.3).

package calc.Absyn;

public abstract class Arg implements java.io.Serializable {
  public abstract <R,A> R accept(Arg.Visitor<R,A> v, A arg);
  public interface Visitor <R,A> {
    public R visit(calc.Absyn.ArgDecl p, A arg);

  }

}
