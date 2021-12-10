import java.util.*;
import cmm.Absyn.*;

public class Compiler {
  // =================== FROM TYPECHECKER ===================
  public HashMap<String, Fun> definitions = new HashMap<>();
  public LinkedList<HashMap<String, CxtEntry>> scopeList = new LinkedList<>();
  public String className;

  // Share type constants
  public final Type BOOL = new Type_bool();
  public final Type INT = new Type_int();
  public final Type DOUBLE = new Type_double();
  public final Type VOID = new Type_void();
  // =================== STOP FROM TYPECHECKER ===================

  // The output of the compiler is a list of strings.
  LinkedList<String> output;
  private int stackSize = 0;
  private int stackLimit = 0;

  private int labelNr = 0;
  private int localNr = 0;
  private int localLimit = 0;

  // Variable information
  public class CxtEntry {
    final Type type;
    final Integer addr;

    CxtEntry(Type t, Integer a) {
      type = t;
      addr = a;
    }
  }

  // Compile C-- AST to a .j source file (returned as String).
  // name should be just the class name without file extension.
  public String compile(String name, cmm.Absyn.Program p) {
    // Initialize output
    output = new LinkedList();
    className = name + "/";

    // Output boilerplate
    output.add(".class public " + name + "\n");
    output.add(".super java/lang/Object\n");
    output.add("\n");
    output.add(".method public <init>()V\n");
    output.add("  .limit locals 1\n");
    output.add("\n");
    output.add("  aload_0\n");
    output.add("  invokespecial java/lang/Object/<init>()V\n");
    output.add("  return\n");
    output.add("\n");
    output.add(".end method\n");
    output.add("\n");
    output.add(".method public static main([Ljava/lang/String;)V\n");
    output.add("  .limit locals 1\n");
    output.add("  .limit stack  1\n");
    output.add("\n");
    output.add("  invokestatic " + name + "/main()I\n");
    output.add("  pop\n");
    output.add("  return\n");
    output.add("\n");
    output.add(".end method\n");
    output.add("\n");

    // TODO: compile AST, appending to output.

    p.accept(new ProgramVisitor(), null);

    StringBuilder jtext = new StringBuilder();
    for (String s : output) {
      jtext.append(s);
    }
    return jtext.toString();
  }

  public class ProgramVisitor implements cmm.Absyn.Program.Visitor<Void, Void> {
    public Void visit(cmm.Absyn.PDefs p, Void arg) { /* Code for PDefs goes here */
      scopeList.add(new HashMap<String, CxtEntry>());

      definitions.put("printInt", new Fun("Runtime/printInt", new FunType(VOID, oneArgList(INT))));
      definitions.put("readInt", new Fun("Runtime/readInt", new FunType(INT, new ListArg())));
      definitions.put("printDouble", new Fun("Runtime/printDouble", new FunType(VOID, oneArgList(DOUBLE))));
      definitions.put("readDouble", new Fun("Runtime/readDouble", new FunType(DOUBLE, new ListArg())));

      for (Def d : ((PDefs) p).listdef_) {
        DFun def = (DFun) d;
        definitions.put(def.id_,
            new Fun(className + def.id_, new FunType(def.type_, def.listarg_)));
      }

      ListDef defs = new ListDef();

      for (cmm.Absyn.Def x : p.listdef_) {
        defs.add(x.accept(new DefVisitor(), null));
      }
      return null;
    }
  }

  public class DefVisitor implements cmm.Absyn.Def.Visitor<DFun, Void> {
    public DFun visit(cmm.Absyn.DFun p, Void arg) { /* Code for DFun goes here */
      stackSize = 0;
      stackLimit = 0;
      localLimit = 0;
      localNr = 0;

      Fun f = new Fun(p.id_, new FunType(p.type_, p.listarg_));
      // definitions.put(p.id_, f);

      LinkedList<String> savedOutput = output;
      output = new LinkedList<>();
      // p.id_;
      newScope();
      for (cmm.Absyn.Arg x : p.listarg_) {
        x.accept(new ArgVisitor(), arg);
      }

      ListStm stms = new ListStm();
      for (cmm.Absyn.Stm x : p.liststm_) {
        stms.add(x.accept(new StmVisitor(), arg));
      }

      LinkedList<String> newOutput = output;
      output = savedOutput;
      closeScope();

      output.add("\n.method public static " + f.toJVM() + "\n");
      output.add("  .limit locals " + localLimit + "\n");
      output.add("  .limit stack " + stackLimit + "\n\n");
      for (String s : newOutput) {
        output.add("\t" + s);
      }

      if (isVoidFunction(p)) {
        output.add("        return\n");
      }
      output.add("\n.end method\n");

      return null;
    }
  }

  public class ArgVisitor implements cmm.Absyn.Arg.Visitor<Void, Void> {
    public Void visit(cmm.Absyn.ADecl p, Void arg) { /* Code for ADecl goes here */
      int addr = addVarToContext(p.id_, p.type_);
      // emit(new Store(p.type_, addr));
      return null;
    }
  }

  public class StmVisitor implements cmm.Absyn.Stm.Visitor<Stm, Void> {
    public Stm visit(cmm.Absyn.SExp p, Void arg) { /* Code for SExp goes here */
      emit(new Comment(cmm.PrettyPrinter.print(p)));
      p.exp_.accept(new ExpVisitor(), arg);

      emit(new Pop(((ETyped) p.exp_).type_));
      return null;
    }

    public Stm visit(cmm.Absyn.SDecls p, Void arg) { /* Code for SDecls goes here */
      p.type_.accept(new TypeVisitor(), arg);
      for (String x : p.listid_) {
        int addr = addVarToContext(x, p.type_);
        // emit(new Store(VOID, addr));
      }

      return p;
    }

    public Stm visit(cmm.Absyn.SInit p, Void arg) { /* Code for SInit goes here */
      emit(new Comment(cmm.PrettyPrinter.print(p)));
      // String label = addVarToContext(p.id_, p.type_);
      int addr = addVarToContext(p.id_, p.type_);

      p.exp_.accept(new ExpVisitor(), arg);

      emit(new Store(p.type_, addr));
      return null;
    }

    public Stm visit(cmm.Absyn.SReturn p, Void arg) { /* Code for SReturn goes here */
      emit(new Comment(cmm.PrettyPrinter.print(p)));
      p.exp_.accept(new ExpVisitor(), arg);
      emit(new Return(((ETyped) p.exp_).type_));
      return null;
    }

    public Stm visit(cmm.Absyn.SWhile p, Void arg) { /* Code for SWhile goes here */
      emit(new Comment("While condition (" + cmm.PrettyPrinter.print(p.exp_) + ")\n"));
      Label startL = new Label(labelNr++);
      Label endL = new Label(labelNr++);
      emit(new Target(startL));
      p.exp_.accept(new ExpVisitor(), null);
      emit(new IfZ(endL));
      emit(new Comment("do: \n"));
      newScope();
      p.stm_.accept(new StmVisitor(), null);
      closeScope();
      emit(new Goto(startL));
      emit(new Target(endL));

      emit(new Comment("end while\n"));
      return null;
    }

    public Stm visit(cmm.Absyn.SBlock p, Void arg) { /* Code for SBlock goes here */
      newScope();
      for (cmm.Absyn.Stm x : p.liststm_) {
        x.accept(new StmVisitor(), arg);
      }
      closeScope();
      return null;
    }

    public Stm visit(cmm.Absyn.SIfElse p, Void arg) { /* Code for SIfElse goes here */
      emit(new Comment("Evaluate if condition: " + cmm.PrettyPrinter.print(p.exp_) + "\n"));

      Label true_label = new Label(labelNr++);
      Label false_label = new Label(labelNr++);

      p.exp_.accept(new ExpVisitor(), null);
      emit(new Comment("Check if condition is true/false: \n"));

      emit(new IfZ(false_label));
      emit(new Comment("If true then do: \n"));
      newScope();
      p.stm_1.accept(new StmVisitor(), arg);
      closeScope();

      emit(new Goto(true_label));
      emit(new Comment("If false then do: \n"));
      emit(new Target(false_label));
      newScope();
      p.stm_2.accept(new StmVisitor(), arg);
      closeScope();

      emit(new Target(true_label));
      return null;
    }
  }

  public class ExpVisitor implements cmm.Absyn.Exp.Visitor<Void, Void> {
    public Void visit(cmm.Absyn.EBool p, Void arg) { /* Code for EBool goes here */
      emit(new IConst(p.boollit_.accept(new BoolLitVisitor(), arg)));
      return null;
    }

    public Void visit(cmm.Absyn.EInt p, Void arg) { /* Code for EInt goes here */
      emit(new IConst(p.integer_));
      return null;
    }

    public Void visit(cmm.Absyn.EDouble p, Void arg) { /* Code for EDouble goes here */
      // p.double_;
      emit(new DConst(p.double_));
      return null;
    }

    public Void visit(cmm.Absyn.EId p, Void arg) { /* Code for EId goes here */
      CxtEntry ce = lookupVariableType(p.id_);
      emit(new Load(ce.type, ce.addr));
      return null;
    }

    public Void visit(cmm.Absyn.EApp p, Void arg) { /* Code for EApp goes here */
      // Check if function is defined
      Fun fd = definitions.get(p.id_);
      // Check function expressions
      for (cmm.Absyn.Exp x : p.listexp_) {
        x.accept(new ExpVisitor(), arg);
      }
      emit(new Call(fd));
      return null;
    }

    public Void visit(cmm.Absyn.EPost p, Void arg) { /* Code for EPost goes here */
      // p.id_;
      CxtEntry ce = lookupVariableType(p.id_);
      boolean b = p.incdecop_.accept(new IncDecOpVisitor(), arg);
      emit(new Load(ce.type, ce.addr));
      emit(new Dup(ce.type));

      if (ce.type.equals(DOUBLE))
        emit(new DConst(1.0));
      else
        emit(new IConst(1));

      if (b)
        emit(new Add(ce.type));
      else
        emit(new Sub(ce.type));
      emit(new Store(ce.type, ce.addr));
      return null;
    }

    public Void visit(cmm.Absyn.EPre p, Void arg) { /* Code for EPre goes here */
      CxtEntry ce = lookupVariableType(p.id_);
      boolean b = p.incdecop_.accept(new IncDecOpVisitor(), arg);
      emit(new Load(ce.type, ce.addr));
      // emit(new Dup(ce.type));
      if (ce.type.equals(DOUBLE))
        emit(new DConst(1.0));
      else
        emit(new IConst(1));
      if (b)
        emit(new Add(ce.type));
      else
        emit(new Sub(ce.type));
      emit(new Store(ce.type, ce.addr));
      emit(new Load(ce.type, ce.addr));
      return null;
    }

    public Void visit(cmm.Absyn.EMul p, Void arg) { /* Code for EMul goes here */
      boolean b = p.mulop_.accept(new MulOpVisitor(), arg);
      Type t;
      if (((ETyped) p.exp_1).type_.equals(INT) && ((ETyped) p.exp_2).type_.equals(INT))
        t = INT;
      else
        t = DOUBLE;

      p.exp_1.accept(this, arg);
      p.exp_2.accept(this, arg);
      if (b)
        emit(new Mul(t));
      else
        emit(new Div(t));
      return null;
    }

    public Void visit(cmm.Absyn.EAdd p, Void arg) { /* Code for EAdd goes here */
      boolean b = p.addop_.accept(new AddOpVisitor(), arg);
      Type t;
      if (((ETyped) p.exp_1).type_.equals(INT) && ((ETyped) p.exp_2).type_.equals(INT))
        t = INT;
      else {
        t = DOUBLE;
        p = new EAdd(new ETyped(DOUBLE, p.exp_1), p.addop_, new ETyped(DOUBLE, p.exp_2));
      }

      p.exp_1.accept(this, arg);
      p.exp_2.accept(this, arg);
      if (b)
        emit(new Add(t));
      else
        emit(new Sub(t));
      return null;
    }

    public Void visit(cmm.Absyn.ECmp p, Void arg) { /* Code for ECmp goes here */
      // Returns operator type
      CmpOp co = p.cmpop_.accept(new CmpOpVisitor(), arg);

      Label true_label = new Label(labelNr++);
      Label exit_state = new Label(labelNr++);

      p.exp_1.accept(new ExpVisitor(), null);
      p.exp_2.accept(new ExpVisitor(), null);

      if (((ETyped) p.exp_1).type_.equals(INT) && ((ETyped) p.exp_2).type_.equals(INT)) {
        integerComparisons(co, true_label);
      } else if (((ETyped) p.exp_1).type_.equals(BOOL) && ((ETyped) p.exp_2).type_.equals(BOOL)) {
        integerComparisons(co, true_label);
      } else if (((ETyped) p.exp_1).type_.equals(DOUBLE) && ((ETyped) p.exp_2).type_.equals(DOUBLE)) {
        doubleComparisons(co, true_label);
      }

      // Comparison resolved false
      emit(new IConst(0));
      emit(new Goto(exit_state));

      // Comparison resolved true
      emit(new Target(true_label));
      emit(new IConst(1));
      emit(new Target(exit_state));
      return null;
    }

    private void integerComparisons(CmpOp co, Label label) {
      // Check which operator we have
      if (co instanceof OLt)
        emit(new IfLt(INT, label));
      else if (co instanceof OGt)
        emit(new IfGt(INT, label));
      else if (co instanceof OLtEq)
        emit(new IfLe(INT, label));
      else if (co instanceof OGtEq)
        emit(new IfGe(INT, label));
      else if (co instanceof OEq)
        emit(new IfEq(INT, label));
      else if (co instanceof ONEq)
        emit(new IfNe(INT, label));
    }

    private void doubleComparisons(CmpOp co, Label label) {
      // Check which operator we have
      emit(new DCmp());
      if (co instanceof OLt) {
        emit(new IConst(-1));
        emit(new IfEq(INT, label));
      } else if (co instanceof OGt) {
        emit(new IConst(1));
        emit(new IfEq(INT, label));
      } else if (co instanceof OLtEq) {
        emit(new IConst(0));
        emit(new IfLe(INT, label));
      } else if (co instanceof OGtEq) {
        emit(new IConst(0));
        emit(new IfGe(INT, label));
      } else if (co instanceof OEq) {
        emit(new IfZ(label));
      } else if (co instanceof ONEq) {
        emit(new IConst(0));
        emit(new IfNe(INT, label));
      }
    }

    public Void visit(cmm.Absyn.EAnd p, Void arg) { /* Code for EAnd goes here */
      Label false_label = new Label(labelNr++);
      emit(new IConst(0));
      p.exp_1.accept(new ExpVisitor(), null);
      emit(new IConst(0));
      emit(new IfEq(INT, false_label));
      p.exp_2.accept(new ExpVisitor(), null);
      emit(new IConst(0));
      emit(new IfEq(INT, false_label));
      emit(new Pop(INT));
      emit(new IConst(1));
      emit(new Target(false_label));
      return null;
    }

    public Void visit(cmm.Absyn.EOr p, Void arg) { /* Code for EOr goes here */
      Label true_label = new Label(labelNr++);
      emit(new IConst(1));
      p.exp_1.accept(new ExpVisitor(), null);
      // check if first expression is true
      // if yes, go to the end i.e. whole expression is true
      emit(new IConst(1));
      emit(new IfEq(INT, true_label));
      p.exp_2.accept(new ExpVisitor(), null);
      // otherwise check if the second expression is true
      // if true, go to the end
      emit(new IConst(1));
      emit(new IfEq(INT, true_label));
      emit(new Pop(INT));
      emit(new IConst(0));
      emit(new Target(true_label));
      return null;
    }

    public Void visit(cmm.Absyn.EAss p, Void arg) { /* Code for EAss goes here */
      p.exp_.accept(new ExpVisitor(), arg);
      CxtEntry ce = lookupVariableType(p.id_);
      emit(new Store(ce.type, ce.addr));
      emit(new Load(ce.type, ce.addr));
      return null;
    }

    public Void visit(cmm.Absyn.ETyped p, Void arg) { /* Code for ETyped goes here */
      p.type_.accept(new TypeVisitor(), arg);
      p.exp_.accept(new ExpVisitor(), arg);
      return null;
    }

    public Void visit(cmm.Absyn.EConv p, Void arg) { /* Code for EConv goes here */
      p.type_.accept(new TypeVisitor(), arg);
      p.exp_.accept(new ExpVisitor(), arg);

      return null;
      // return new ETyped(t.type_, p);
    }
  }

  public class IncDecOpVisitor implements cmm.Absyn.IncDecOp.Visitor<Boolean, Void> {
    public Boolean visit(cmm.Absyn.OInc p, Void arg) { /* Code for OInc goes here */
      return true;
    }

    public Boolean visit(cmm.Absyn.ODec p, Void arg) { /* Code for ODec goes here */
      return false;
    }
  }

  public class MulOpVisitor implements cmm.Absyn.MulOp.Visitor<Boolean, Void> {
    public Boolean visit(cmm.Absyn.OTimes p, Void arg) { /* Code for OTimes goes here */
      return true;
    }

    public Boolean visit(cmm.Absyn.ODiv p, Void arg) { /* Code for ODiv goes here */
      return false;
    }
  }

  public class AddOpVisitor implements cmm.Absyn.AddOp.Visitor<Boolean, Void> {
    public Boolean visit(cmm.Absyn.OPlus p, Void arg) { /* Code for OPlus goes here */
      return true;
    }

    public Boolean visit(cmm.Absyn.OMinus p, Void arg) { /* Code for OMinus goes here */
      return false;
    }
  }

  public class CmpOpVisitor implements cmm.Absyn.CmpOp.Visitor<CmpOp, Void> {
    public CmpOp visit(cmm.Absyn.OLt p, Void arg) { /* Code for OLt goes here */
      return p;
    }

    public CmpOp visit(cmm.Absyn.OGt p, Void arg) { /* Code for OGt goes here */
      return p;
    }

    public CmpOp visit(cmm.Absyn.OLtEq p, Void arg) { /* Code for OLtEq goes here */
      return p;
    }

    public CmpOp visit(cmm.Absyn.OGtEq p, Void arg) { /* Code for OGtEq goes here */
      return p;
    }

    public CmpOp visit(cmm.Absyn.OEq p, Void arg) { /* Code for OEq goes here */
      return p;
    }

    public CmpOp visit(cmm.Absyn.ONEq p, Void arg) { /* Code for ONEq goes here */
      return p;
    }
  }

  public class BoolLitVisitor implements cmm.Absyn.BoolLit.Visitor<Integer, Void> {
    public Integer visit(cmm.Absyn.LTrue p, Void arg) { /* Code for LTrue goes here */
      return 1;
    }

    public Integer visit(cmm.Absyn.LFalse p, Void arg) { /* Code for LFalse goes here */
      return 0;
    }
  }

  public boolean isVoidType(Type t) {
    return t instanceof Type_void;
  }

  public void newScope() {
    scopeList.add(0, new HashMap<String, CxtEntry>());
  }

  public void closeScope() {
    scopeList.remove(0);
  }

  public ListArg oneArgList(Type t) {
    ListArg l = new ListArg();
    l.add(new ADecl(t, "arg"));
    return l;
  }

  public CxtEntry lookupVariableType(String x) {
    for (HashMap<String, CxtEntry> v : scopeList) {
      CxtEntry ce = v.get(x);
      if (ce != null)
        return ce;
    }
    throw new TypeException("The variable " + x + " is not initialized ");
  }

  public int addVarToContext(String id, Type t) {
    int addr = localNr;
    scopeList.get(0).put(id, new CxtEntry(t, addr));
    localNr += t.accept(new Size(), null);
    if (localNr > localLimit)
      localLimit = localNr;
    return addr;
  }

  private boolean isIntOrDouble(Type t) {
    return t.equals(INT) || t.equals(DOUBLE);
  }

  boolean isVoidFunction(DFun f) {
    for (Stm stm : f.liststm_) {
      if (stm instanceof SReturn) {
        return false;
      }
    }
    return true;
  }

  void emit(Code c) {
    String str = c.accept(new CodeToJVM());
    if (!str.isEmpty()) {
      output.add(str);
    }
    updateStack(c);
  }

  void incStack(Type t) {
    stackSize = stackSize + t.accept(new Size(), null);
    if (stackSize > stackLimit)
      stackLimit = stackSize;
  }

  void decStack(Type t) {
    stackSize = stackSize - t.accept(new Size(), null);
  }

  void updateStack(Code c) {
    if (c instanceof Store)
      decStack(((Store) c).type);
    else if (c instanceof Load)
      incStack(((Load) c).type);
    else if (c instanceof IConst)
      incStack(INT);
    else if (c instanceof DConst)
      incStack(DOUBLE);
    else if (c instanceof Dup)
      incStack(((Dup) c).type);
    else if (c instanceof Pop)
      decStack(((Pop) c).type);
    else if (c instanceof Return)
      decStack(((Return) c).type);
    else if (c instanceof IfZ)
      decStack(INT);
    else if (c instanceof IfNZ)
      decStack(INT);
    else if (c instanceof IfEq)
      decStack(DOUBLE);
    else if (c instanceof IfNe)
      decStack(DOUBLE);
    else if (c instanceof IfLt)
      decStack(DOUBLE);
    else if (c instanceof IfGt)
      decStack(DOUBLE);
    else if (c instanceof IfLe)
      decStack(DOUBLE);
    else if (c instanceof IfGe)
      decStack(DOUBLE);
    else if (c instanceof Add)
      decStack(((Add) c).type);
    else if (c instanceof Sub)
      decStack(((Sub) c).type);
    else if (c instanceof Mul)
      decStack(((Mul) c).type);
    else if (c instanceof Div)
      decStack(((Div) c).type);
    else if (c instanceof Call) {
      FunType funType = ((Call) c).fun.funDef;
      for (Arg a : funType.argumentsList) {
        decStack(((ADecl) a).type_);
      }
      incStack(funType.returnType);
    }
  }

  // =====================================================================
  // ================================ Size ===============================
  // =====================================================================
  class Size implements Type.Visitor<Integer, Void> {

    public Integer visit(Type_int t, Void arg) {
      return 1;
    }

    public Integer visit(Type_bool t, Void arg) {
      return 1;
    }

    public Integer visit(Type_void t, Void arg) {
      return 0;
    }

    public Integer visit(Type_double t, Void arg) {
      return 2;
    }
  }
}
