import java.util.ArrayList;
import java.util.LinkedList;
import java.util.HashMap;

import cmm.Absyn.*;

public class TypeChecker {
    public HashMap<String, FunctionDefinition> definitions = new HashMap<>();
    public LinkedList<HashMap<String, Type>> scopeList = new LinkedList<>();

    // Return type of function we are checking
    private Type returnType;

    // Share type constants
    public final Type BOOL = new Type_bool();
    public final Type INT = new Type_int();
    public final Type DOUBLE = new Type_double();
    public final Type VOID = new Type_void();

    public Program typecheck(Program p) {
        ProgramVisitor pv = new ProgramVisitor();
        return p.accept(pv, null);
    }

    public class ProgramVisitor implements cmm.Absyn.Program.Visitor<Program, Void> {
        public Program visit(cmm.Absyn.PDefs p, Void arg) { /* Code for PDefs goes here */
            scopeList.add(new HashMap<String, Type>());

            definitions.put("printInt", new FunctionDefinition(VOID, oneArgList(INT)));
            definitions.put("readInt", new FunctionDefinition(INT, new ListArg()));
            definitions.put("printDouble", new FunctionDefinition(VOID, oneArgList(DOUBLE)));
            definitions.put("readDouble", new FunctionDefinition(DOUBLE, new ListArg()));

            for (cmm.Absyn.Def x : p.listdef_) {
                x.accept(new DefCheckerVisitor(), arg);
            }

            if (!definitions.containsKey("main")) {
                throw new TypeException("There is no main function");
            }

            if (!(definitions.get("main").returnType instanceof Type_int)) {
                throw new TypeException("Main function is not of type int");
            }

            if (!(definitions.get("main").argumentsList.isEmpty())) {
                throw new TypeException("Main function cannot have arguments");
            }

            ListDef defs = new ListDef();

            for (cmm.Absyn.Def x : p.listdef_) {
                defs.add(x.accept(new DefVisitor(), arg));
            }
            PDefs type_checked_p = new PDefs(defs);
            return type_checked_p;
        }
    }

    public class DefCheckerVisitor implements cmm.Absyn.Def.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.DFun fun, Void arg) { /* Code for DFun goes here */
            ArrayList<String> argNames = new ArrayList<>();

            // Check that no function names are repeated
            if (definitions.get(fun.id_) != null)
                throw new TypeException("Function name" + fun.id_ + " already exists");

            for (Arg a : fun.listarg_) {
                ADecl ad = (ADecl) a;
                if (argNames.contains(ad.id_)) {
                    throw new TypeException("Argument cannot be repeated");
                }

                if (ad.type_ instanceof Type_void) {
                    throw new TypeException("Argument cannot have void type");
                }
                argNames.add(ad.id_);
            }

            // add function name to list of definitions
            FunctionDefinition functionProperties = new FunctionDefinition(fun.type_, fun.listarg_);
            definitions.put(fun.id_, functionProperties);

            return null;
        }
    }

    public class DefVisitor implements cmm.Absyn.Def.Visitor<DFun, Void> {
        public DFun visit(cmm.Absyn.DFun p, Void arg) { /* Code for DFun goes here */
            returnType = p.type_;
            p.type_.accept(new TypeVisitor(), arg);
            // p.id_;
            newScope();
            for (cmm.Absyn.Arg x : p.listarg_) {
                x.accept(new ArgVisitor(), arg);
            }

            ListStm stms = new ListStm();
            for (cmm.Absyn.Stm x : p.liststm_) {
                stms.add(x.accept(new StmVisitor(), arg));
            }
            closeScope();

            return new DFun(p.type_, p.id_, p.listarg_, stms);
        }
    }

    public class ArgVisitor implements cmm.Absyn.Arg.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.ADecl p, Void arg) { /* Code for ADecl goes here */
            p.type_.accept(new TypeVisitor(), arg);
            addVarToContext(p.id_, p.type_);
            // p.id_;
            return null;
        }
    }

    public class StmVisitor implements cmm.Absyn.Stm.Visitor<Stm, Void> {
        public Stm visit(cmm.Absyn.SExp p, Void arg) { /* Code for SExp goes here */
            ETyped t = p.exp_.accept(new ExpVisitor(), arg);
            return new SExp(t);
        }

        public Stm visit(cmm.Absyn.SDecls p, Void arg) { /* Code for SDecls goes here */
            p.type_.accept(new TypeVisitor(), arg);
            if (isVoidType(p.type_)) {
                throw new TypeException("Cannot be of type void");
            }

            for (String x : p.listid_) {
                addVarToContext(x, p.type_);
            }
            return p;
        }

        public Stm visit(cmm.Absyn.SInit p, Void arg) { /* Code for SInit goes here */
            p.type_.accept(new TypeVisitor(), arg);
            if (isVoidType(p.type_)) {
                throw new TypeException("Cannot be of type void");
            }

            addVarToContext(p.id_, p.type_);
            ETyped exp = p.exp_.accept(new ExpVisitor(), arg);
            Type t = exp.type_;
            // Enable inits such as "double a = 345;" and "double b = 2*2.5"
            if (p.type_.equals(DOUBLE) && t.equals(INT)) {
                exp = (new EConv(DOUBLE, exp)).accept(new ExpVisitor(), arg);
                t = DOUBLE;
            }
            compareTypes(t, p.type_);

            if (!t.equals(exp.type_)) {
                // Type t may have been updated
                ETyped e = new ETyped(t, exp.exp_);
                return new SInit(t, p.id_, e);
            }

            return new SInit(t, p.id_, exp);
        }

        public Stm visit(cmm.Absyn.SReturn p, Void arg) { /* Code for SReturn goes here */
            ETyped t = p.exp_.accept(new ExpVisitor(), arg);
            if (returnType.equals(DOUBLE) && t.type_.equals(INT)) {
                t = new ETyped(DOUBLE, p.exp_);
            }
            compareTypes(t.type_, returnType);
            return new SReturn(t);
        }

        public Stm visit(cmm.Absyn.SWhile p, Void arg) { /* Code for SWhile goes here */
            newScope();
            ETyped t = p.exp_.accept(new ExpVisitor(), null);
            compareTypes(t.type_, BOOL);

            Stm s = p.stm_.accept(new StmVisitor(), arg);
            closeScope();
            return new SWhile(t, s);
        }

        public Stm visit(cmm.Absyn.SBlock p, Void arg) { /* Code for SBlock goes here */
            newScope();
            ListStm list_stm = new ListStm();
            for (cmm.Absyn.Stm x : p.liststm_) {
                list_stm.add(x.accept(new StmVisitor(), arg));
            }
            closeScope();
            return new SBlock(list_stm);
        }

        public Stm visit(cmm.Absyn.SIfElse p, Void arg) { /* Code for SIfElse goes here */
            ETyped t = p.exp_.accept(new ExpVisitor(), null);
            compareTypes(t.type_, BOOL);

            newScope();
            Stm stm1 = p.stm_1.accept(new StmVisitor(), arg);
            closeScope();

            newScope();
            Stm stm2 = p.stm_2.accept(new StmVisitor(), arg);
            closeScope();
            return new SIfElse(t, stm1, stm2);
        }
    }

    public class ExpVisitor implements cmm.Absyn.Exp.Visitor<ETyped, Void> {
        public ETyped visit(cmm.Absyn.EBool p, Void arg) { /* Code for EBool goes here */
            p.boollit_.accept(new BoolLitVisitor(), arg);
            return new ETyped(BOOL, p);
        }

        public ETyped visit(cmm.Absyn.EInt p, Void arg) { /* Code for EInt goes here */
            // p.integer_;
            return new ETyped(INT, p);
        }

        public ETyped visit(cmm.Absyn.EDouble p, Void arg) { /* Code for EDouble goes here */
            // p.double_;
            return new ETyped(DOUBLE, p);
        }

        public ETyped visit(cmm.Absyn.EId p, Void arg) { /* Code for EId goes here */
            // p.id_;
            return new ETyped(lookupVariableType(p.id_), p);
        }

        public ETyped visit(cmm.Absyn.EApp p, Void arg) { /* Code for EApp goes here */
            // Check if function is defined
            FunctionDefinition fd = definitions.get(p.id_);
            // Check function expressions
            ListExp listexp = new ListExp();
            for (cmm.Absyn.Exp x : p.listexp_) {
                listexp.add(x.accept(new ExpVisitor(), arg));
            }

            // Check number of arguments in function
            if (fd == null || p.listexp_.size() != fd.argumentsList.size()) {
                throw new TypeException("Function is not defined or is called with the wrong number of arguments");
            }
            checkArgTypes(p.listexp_, fd.argumentsList);
            return new ETyped(fd.returnType, new EApp(p.id_, listexp));
        }

        public ETyped visit(cmm.Absyn.EPost p, Void arg) { /* Code for EPost goes here */
            // p.id_;
            Type t = lookupVariableType(p.id_);
            boolean b = isIntOrDouble(t);
            if (!b) {
                throw new TypeException("Increment and decrement only callable on int or double");
            }
            p.incdecop_.accept(new IncDecOpVisitor(), arg);
            return new ETyped(t, p);
        }

        public ETyped visit(cmm.Absyn.EPre p, Void arg) { /* Code for EPre goes here */
            Type t = lookupVariableType(p.id_);
            boolean b = isIntOrDouble(t);
            if (!b) {
                throw new TypeException("Increment and decrement only callable on int or double");
            }
            p.incdecop_.accept(new IncDecOpVisitor(), arg);
            // p.id_;
            return new ETyped(t, p);
        }

        public ETyped visit(cmm.Absyn.EMul p, Void arg) { /* Code for EMul goes here */
            ETyped t1 = p.exp_1.accept(new ExpVisitor(), arg);
            p.mulop_.accept(new MulOpVisitor(), arg);
            ETyped t2 = p.exp_2.accept(new ExpVisitor(), arg);

            if (!(isIntOrDouble(t1.type_) && isIntOrDouble(t2.type_))) {
                throw new TypeException("Multiplication only callable on int or double");
            }

            if (!t1.type_.equals(t2.type_)) {
                ETyped tc1 = (new EConv(DOUBLE, t1)).accept(new ExpVisitor(), arg);
                ETyped tc2 = (new EConv(DOUBLE, t2)).accept(new ExpVisitor(), arg);
                return new ETyped(DOUBLE, new EMul(tc1, p.mulop_, tc2));
            }
            return new ETyped(t1.type_, new EMul(t1, p.mulop_, t2));
        }

        public ETyped visit(cmm.Absyn.EAdd p, Void arg) { /* Code for EAdd goes here */
            ETyped t1 = p.exp_1.accept(new ExpVisitor(), arg);
            p.addop_.accept(new AddOpVisitor(), arg);
            ETyped t2 = p.exp_2.accept(new ExpVisitor(), arg);

            if (!(isIntOrDouble(t1.type_) && isIntOrDouble(t2.type_))) {
                throw new TypeException("Addition only callable on int or double");
            }

            if (!t1.type_.equals(t2.type_)) {
                ETyped tc1 = (new EConv(DOUBLE, t1)).accept(new ExpVisitor(), arg);
                ETyped tc2 = (new EConv(DOUBLE, t2)).accept(new ExpVisitor(), arg);
                return new ETyped(DOUBLE, new EAdd(tc1, p.addop_, tc2));
            }

            return new ETyped(t1.type_, new EAdd(t1, p.addop_, t2));
        }

        public ETyped visit(cmm.Absyn.ECmp p, Void arg) { /* Code for ECmp goes here */
            ETyped t1 = p.exp_1.accept(new ExpVisitor(), arg);
            // Returns true if comparison is eq/neq, false otherwise
            boolean b = p.cmpop_.accept(new CmpOpVisitor(), arg);
            ETyped t2 = p.exp_2.accept(new ExpVisitor(), arg);

            if (b) {
                if (t1.type_.equals(VOID) || t2.type_.equals(VOID)) {
                    throw new TypeException("Eq/Neq not applicable to void type.");
                }
                if ((t1.equals(INT) && t2.equals(DOUBLE)) || (t1.type_.equals(DOUBLE) && t2.type_.equals(INT))) {
                    t1 = (new EConv(DOUBLE, t1)).accept(new ExpVisitor(), arg);
                    t2 = (new EConv(DOUBLE, t2)).accept(new ExpVisitor(), arg);
                }
                compareTypes(t1.type_, t2.type_);
            } else {
                if (!(isIntOrDouble(t1.type_) && isIntOrDouble(t2.type_))) {
                    throw new TypeException("Comparison only applies to numerical values.");
                }
            }

            return new ETyped(BOOL, new ECmp(t1, p.cmpop_, t2));
        }

        public ETyped visit(cmm.Absyn.EAnd p, Void arg) { /* Code for EAnd goes here */
            ETyped t1 = p.exp_1.accept(new ExpVisitor(), arg);
            ETyped t2 = p.exp_2.accept(new ExpVisitor(), arg);
            compareTypes(t1.type_, t2.type_);
            compareTypes(t1.type_, BOOL);

            return new ETyped(BOOL, new EAnd(t1, t2));
        }

        public ETyped visit(cmm.Absyn.EOr p, Void arg) { /* Code for EOr goes here */
            ETyped t1 = p.exp_1.accept(new ExpVisitor(), arg);
            ETyped t2 = p.exp_2.accept(new ExpVisitor(), arg);
            compareTypes(t1.type_, t2.type_);
            compareTypes(t1.type_, BOOL);
            return new ETyped(BOOL, new EOr(t1, t2));
        }

        public ETyped visit(cmm.Absyn.EAss p, Void arg) { /* Code for EAss goes here */
            ETyped t1 = p.exp_.accept(new ExpVisitor(), arg);
            Type t2 = lookupVariableType(p.id_);

            // Enable assignments such as "double a; a = 345;"
            if (t2.equals(DOUBLE) && t1.type_.equals(INT)) {
                // t1 = new ETyped(DOUBLE, p);
                t1 = (new EConv(DOUBLE, t1)).accept(new ExpVisitor(), arg);

            }
            compareTypes(t1.type_, t2);

            return new ETyped(t1.type_, new EAss(p.id_, t1));
        }

        public ETyped visit(cmm.Absyn.ETyped p, Void arg) { /* Code for ETyped goes here */
            p.type_.accept(new TypeVisitor(), arg);
            ETyped t = p.exp_.accept(new ExpVisitor(), arg);
            return new ETyped(t.type_, p);
        }

        public ETyped visit(cmm.Absyn.EConv p, Void arg) { /* Code for EConv goes here */
            p.type_.accept(new TypeVisitor(), arg);
            ETyped t = p.exp_.accept(new ExpVisitor(), arg);
            if (t.type_.equals(INT)) {
                Integer val = ((EInt) ((ETyped) t.exp_).exp_).integer_;
                Double dVal = Double.valueOf(val);
                return new ETyped(DOUBLE, new EDouble(dVal));
            }

            return new ETyped(DOUBLE, t);
        }
    }

    public class IncDecOpVisitor implements cmm.Absyn.IncDecOp.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.OInc p, Void arg) { /* Code for OInc goes here */
            return null;
        }

        public Void visit(cmm.Absyn.ODec p, Void arg) { /* Code for ODec goes here */
            return null;
        }
    }

    public class MulOpVisitor implements cmm.Absyn.MulOp.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.OTimes p, Void arg) { /* Code for OTimes goes here */
            return null;
        }

        public Void visit(cmm.Absyn.ODiv p, Void arg) { /* Code for ODiv goes here */
            return null;
        }
    }

    public class AddOpVisitor implements cmm.Absyn.AddOp.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.OPlus p, Void arg) { /* Code for OPlus goes here */
            return null;
        }

        public Void visit(cmm.Absyn.OMinus p, Void arg) { /* Code for OMinus goes here */
            return null;
        }
    }

    public class CmpOpVisitor implements cmm.Absyn.CmpOp.Visitor<Boolean, Void> {
        public Boolean visit(cmm.Absyn.OLt p, Void arg) { /* Code for OLt goes here */
            return false;
        }

        public Boolean visit(cmm.Absyn.OGt p, Void arg) { /* Code for OGt goes here */
            return false;
        }

        public Boolean visit(cmm.Absyn.OLtEq p, Void arg) { /* Code for OLtEq goes here */
            return false;
        }

        public Boolean visit(cmm.Absyn.OGtEq p, Void arg) { /* Code for OGtEq goes here */
            return false;
        }

        public Boolean visit(cmm.Absyn.OEq p, Void arg) { /* Code for OEq goes here */
            return true;
        }

        public Boolean visit(cmm.Absyn.ONEq p, Void arg) { /* Code for ONEq goes here */
            return true;
        }
    }

    public class BoolLitVisitor implements cmm.Absyn.BoolLit.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.LTrue p, Void arg) { /* Code for LTrue goes here */
            return null;
        }

        public Void visit(cmm.Absyn.LFalse p, Void arg) { /* Code for LFalse goes here */
            return null;
        }
    }

    public class TypeVisitor implements cmm.Absyn.Type.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.Type_bool p, Void arg) { /* Code for Type_bool goes here */
            return null;
        }

        public Void visit(cmm.Absyn.Type_int p, Void arg) { /* Code for Type_int goes here */
            return null;
        }

        public Void visit(cmm.Absyn.Type_double p, Void arg) { /* Code for Type_double goes here */
            return null;
        }

        public Void visit(cmm.Absyn.Type_void p, Void arg) { /* Code for Type_void goes here */
            return null;
        }
    }

    public boolean isVoidType(Type t) {
        return t instanceof Type_void;
    }

    private class FunctionDefinition {
        final Type returnType;
        final ListArg argumentsList;

        public FunctionDefinition(Type retType, ListArg argList) {
            returnType = retType;
            argumentsList = argList;
        }
    }

    public void newScope() {
        scopeList.add(0, new HashMap<String, Type>());
    }

    public void closeScope() {
        scopeList.remove(0);
    }

    public ListArg oneArgList(Type t) {
        ListArg l = new ListArg();
        l.add(new ADecl(t, "arg"));
        return l;
    }

    public void compareTypes(Type t1, Type t2) {
        if (t1 == null || t2 == null) {
            throw new TypeException("Expected type: " + t2 + ", but found type: " + t1);
        }
        if (!t1.equals(t2)) {
            throw new TypeException("Expected type: " + t2 + ", but found type: " + t1);
        }
    }

    public Type lookupVariableType(String x) {
        for (HashMap<String, Type> v : scopeList) {
            Type t = v.get(x);
            if (t != null)
                return t;
        }
        throw new TypeException("The variable " + x + " is not initialized ");
    }

    public void addVarToContext(String id, Type t) {
        // Get the top context block
        HashMap<String, Type> cxt = scopeList.get(0);

        // Check that the variable is not declared already
        if (cxt.containsKey(id))
            throw new TypeException("found a duplicate variable binding with name: " + id);
        // Add the binding
        cxt.put(id, t);
    }

    private void checkArgTypes(ListExp le, ListArg la) {
        for (int i = 0; i < le.size(); i++) {
            ETyped exp = le.get(i).accept(new ExpVisitor(), null);
            Type argType = ((ADecl) la.get(i)).type_;

            if (argType.equals(DOUBLE) && exp.type_.equals(INT))
                exp = new ETyped(DOUBLE, exp);
            compareTypes(exp.type_, argType);
        }
    }

    private boolean isIntOrDouble(Type t) {
        return t.equals(INT) || t.equals(DOUBLE);
    }
}
