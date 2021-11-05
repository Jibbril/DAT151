// File generated by the BNF Converter (bnfc 2.9.3).

package calc;

/** Abstract Visitor */

public class AbstractVisitor<R,A> implements AllVisitor<R,A> {
    /* Program */
    public R visit(calc.Absyn.ProgDef p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Program p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Def */
    public R visit(calc.Absyn.QualConstDef p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.FuncDef p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Def p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Arg */
    public R visit(calc.Absyn.ArgDecl p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Arg p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Stm */
    public R visit(calc.Absyn.StmDef p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.StmDecl p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.StmDecl2 p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.StmDecls p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.StmInit p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.ReturnStm p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.WhileStm p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.IfStm p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.BlockStm p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.TypeDefStm p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.ConstTypeDefStm p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Stm p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Exp */
    public R visit(calc.Absyn.LShift p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.RShift p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.IndexExp p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.FunCallExp p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.IntExp p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.DoubleExp p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.StringExp p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.QualConstExp p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Exp p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Type */
    public R visit(calc.Absyn.BoolType p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.DoubleType p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.IntType p, A arg) { return visitDefault(p, arg); }
    public R visit(calc.Absyn.VoidType p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(calc.Absyn.Type p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }

}
