import java.util.*;
import fun.Absyn.*;

public class Interpreter {

  final Strategy strategy;

  public HashMap<String, Exp> definitions = new HashMap<>();
  public LinkedList<HashMap<String, Value>> contexts = new LinkedList<>();
  final Environment EMPTY = new Environment();

  public Interpreter(Strategy strategy) {
    this.strategy = strategy;
  }

  public void interpret(Program p) {
    Value v = p.accept(new ProgramVisitor(), null);
    System.out.println(v.intValue());
  }

  public class ProgramVisitor implements fun.Absyn.Program.Visitor<Value, Void> {
    public Value visit(fun.Absyn.Prog p, Void arg) { /* Code for Prog goes here */
      for (fun.Absyn.Def x : p.listdef_) {
        x.accept(new DefVisitor(), null);
      }
      return p.main_.accept(new MainVisitor(), null);
    }
  }

  public class MainVisitor implements fun.Absyn.Main.Visitor<Value, Void> {
    public Value visit(fun.Absyn.DMain p, Void arg) { /* Code for DMain goes here */
      return evalClosed(p.exp_);
    }
  }

  public class DefVisitor implements fun.Absyn.Def.Visitor<Void, Void> {
    public Void visit(fun.Absyn.DDef p, Void arg) { /* Code for DDef goes here */
      Exp e = p.exp_;
      Collections.reverse(p.listident_);

      for (String x : p.listident_) {
        e = new EAbs(x, e);
      }
      definitions.put(p.ident_, e);

      return null;
    }
  }

  public class EvalVisitor implements Exp.Visitor<Value, Environment> {
    public Value visit(fun.Absyn.EVar p, Environment env) {
      try {
        Value v = env.lookup(p.ident_);
        if (strategy == Strategy.CallByName)
          // Note to examiner (if Oskar): Overloading the apply
          // function worked, thanks!
          return v.apply();
        return v;
      } catch (Unbound x) {
        Exp e = definitions.get(p.ident_);
        if (e == null)
          throw new RuntimeException("Unbound variable: " + p.ident_);
        else
          return evalClosed(e);
      }

    }

    public Value visit(fun.Absyn.EInt p, Environment env) {
      return new VInt(p.integer_);
    }

    public Value visit(fun.Absyn.EAbs p, Environment env) {
      return new VFun(p.ident_, p.exp_, env);
    }

    public Value visit(fun.Absyn.EApp p, Environment env) {
      Value fClosure = p.exp_1.accept(new EvalVisitor(), env);
      Value v;
      if (strategy == Strategy.CallByName) {
        String fName = ((VFun) fClosure).getSig();
        v = new VFun(fName, p.exp_2, env);
      } else
        v = p.exp_2.accept(new EvalVisitor(), env);

      return fClosure.apply(v);
    }

    public Interpreter.Value visit(EAdd p, Interpreter.Environment env) {
      Value v1 = p.exp_1.accept(new EvalVisitor(), env);
      Value v2 = p.exp_2.accept(new EvalVisitor(), env);
      return new VInt(v1.intValue() + v2.intValue());
    }

    public Interpreter.Value visit(ESub p, Interpreter.Environment env) {
      Value v1 = p.exp_1.accept(new EvalVisitor(), env);
      Value v2 = p.exp_2.accept(new EvalVisitor(), env);
      return new VInt(v1.intValue() - v2.intValue());
    }

    public Interpreter.Value visit(ELt p, Interpreter.Environment env) {
      Value v1 = p.exp_1.accept(new EvalVisitor(), env);
      Value v2 = p.exp_2.accept(new EvalVisitor(), env);
      if (v1.intValue() < v2.intValue())
        return new VInt(1);
      else
        return new VInt(0);
    }

    public Interpreter.Value visit(EIf p, Interpreter.Environment env) {
      Value checkCondition = p.exp_1.accept(new EvalVisitor(), env);
      if (checkCondition.intValue() != 0)
        return p.exp_2.accept(new EvalVisitor(), env);
      else
        return p.exp_3.accept(new EvalVisitor(), env);
    }
  }

  public Value evalClosed(Exp e) {
    return eval(e, EMPTY);
  }

  public Value eval(Exp e, Environment env) {
    return e.accept(new EvalVisitor(), env);
  }

  class Environment {
    Value lookup(String x) throws Unbound {
      throw new Unbound(x);
    }
  }

  class Extend extends Environment {
    public final String x;
    public final Value v;
    public final Environment env;

    public Extend(String x, Value v, Environment env) {
      this.x = x;
      this.v = v;
      this.env = env;
    }

    Value lookup(String y) throws Unbound {
      if (y.equals(x))
        return v;
      else
        return env.lookup(y);
    }
  }

  class Unbound extends Exception {
    public Unbound(String x) {
      super("Unbound identifier: " + x);
    }
  }

  class Value {
    public int intValue() {
      throw new RuntimeException("Value is not an integer");
    }

    public Value apply() {
      throw new RuntimeException("Value is not an integer");
    }

    public Value apply(Value v) {
      throw new RuntimeException("Value is not an integer");
    }
  }

  class VInt extends Value {
    final int i;

    public VInt(int i) {
      this.i = i;
    }

    public int intValue() {
      return i;
    }
  }

  class VFun extends Value {
    final String x;
    final Exp e;
    final Environment env;

    public VFun(String x, Exp e, Environment env) {
      this.x = x;
      this.e = e;
      this.env = env;
    }

    public Value apply(Value v) {
      return eval(e, new Extend(x, v, env));
    }

    public Value apply() {
      return eval(e, env);
    }

    public String getSig() {
      return this.x;
    }
  }

}
