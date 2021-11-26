import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.HashMap;

import cmm.Absyn.*;

public class TypeChecker {
    public HashMap<String,FunctionDefinition> definitions = new HashMap<>();
    public LinkedList<HashMap<String,Type>> scopeList = new LinkedList<>();
    

    // Return type of function we are checking
    private Type returnType;

    // Share type constants
    public final Type BOOL   = new Type_bool();
    public final Type INT    = new Type_int();
    public final Type DOUBLE = new Type_double();
    public final Type VOID   = new Type_void();

    public void typecheck(Program p) {
        ProgramVisitor pv = new ProgramVisitor();
        p.accept(pv, null);
    }
    
    public class ProgramVisitor implements cmm.Absyn.Program.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.PDefs p, Void arg) { /* Code for PDefs goes here */
            scopeList.add(new HashMap<String,Type>());
            
            definitions.put("printInt"   , new FunctionDefinition(VOID, oneArgList(INT)));
            definitions.put("readInt"    , new FunctionDefinition(INT, new ListArg()));
            definitions.put("printDouble", new FunctionDefinition(VOID, oneArgList(DOUBLE)));
            definitions.put("readDouble" , new FunctionDefinition(DOUBLE, new ListArg()));
            
            
            for (cmm.Absyn.Def x: p.listdef_) {
                x.accept(new DefCheckerVisitor(), arg);
            }

            if (!definitions.containsKey("main")){
                throw new TypeException("There is no main function");
            }

            if (!(definitions.get("main").returnType instanceof Type_int)) {
                throw new TypeException("Main function is not of type int");
            }

            if (!(definitions.get("main").argumentsList.isEmpty())) {
                throw new TypeException("Main function cannot have arguments");
            }
            
            for (cmm.Absyn.Def x: p.listdef_) {
                x.accept(new DefVisitor(), arg); 
            }

            return null;
        }
    }
    
    public class DefCheckerVisitor implements cmm.Absyn.Def.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.DFun fun, Void arg)
        { /* Code for DFun goes here */
            ArrayList<String> argNames = new ArrayList<>();

            // Check that no function names are repeated
            if (definitions.get(fun.id_) != null)
                throw new TypeException ("Function name" + fun.id_ + " already exists");
            

            for (Arg a: fun.listarg_) {
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

    public class DefVisitor implements cmm.Absyn.Def.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.DFun p, Void arg)
        { /* Code for DFun goes here */
            returnType = p.type_;
            p.type_.accept(new TypeVisitor(), arg);
            //p.id_;
            newScope();
            for (cmm.Absyn.Arg x: p.listarg_) {
                x.accept(new ArgVisitor(), arg);
            }

            for (cmm.Absyn.Stm x: p.liststm_) {
                x.accept(new StmVisitor(), arg);
            }
            closeScope();
            return null;
        }
    }
    
    public class ArgVisitor implements cmm.Absyn.Arg.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.ADecl p, Void arg)
        { /* Code for ADecl goes here */
            p.type_.accept(new TypeVisitor(), arg);
            addVarToContext(p.id_, p.type_);
            //p.id_;
            return null;
        }
    }

    public class StmVisitor implements cmm.Absyn.Stm.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.SExp p, Void arg)
        { /* Code for SExp goes here */
            p.exp_.accept(new ExpVisitor(), arg);
            return null;
        }
        
        public Void visit(cmm.Absyn.SDecls p, Void arg)
        { /* Code for SDecls goes here */
            p.type_.accept(new TypeVisitor(), arg);
            if (isVoidType(p.type_)){
                throw new TypeException("Cannot be of type void");
            }

            for (String x: p.listid_) {
                addVarToContext(x, p.type_);
            }
            return null;
        }

        public Void visit(cmm.Absyn.SInit p, Void arg)
        { /* Code for SInit goes here */
            p.type_.accept(new TypeVisitor(), arg);
            if (isVoidType(p.type_)){
                throw new TypeException("Cannot be of type void");
            }
            addVarToContext(p.id_,p.type_);
            Type expType = p.exp_.accept(new ExpVisitor(), arg);

            // Enable inits such as "double a = 345;" and "double b = 2*2.5"
            if (p.type_.equals(DOUBLE) && expType.equals(INT)) {
                expType = DOUBLE;
            } 
            compareTypes(expType, p.type_);
            
            return null;
        }

        public Void visit(cmm.Absyn.SReturn p, Void arg)
        { /* Code for SReturn goes here */
            Type t = p.exp_.accept(new ExpVisitor(), arg);
            if (returnType.equals(DOUBLE) && t.equals(INT)) {
                t = new Type_double();
            }
            compareTypes(t, returnType);
            return null;
        }

        public Void visit(cmm.Absyn.SWhile p, Void arg)
        { /* Code for SWhile goes here */
            newScope();
            Type t = p.exp_.accept(new ExpVisitor(), null);
            compareTypes(t, BOOL);
            
            p.stm_.accept(new StmVisitor(), arg);
            closeScope();
            return null;
        }
        
        public Void visit(cmm.Absyn.SBlock p, Void arg)
        { /* Code for SBlock goes here */
            newScope();
            for (cmm.Absyn.Stm x: p.liststm_) {
                x.accept(new StmVisitor(), arg);
            }
            closeScope();
            return null;
        }
        
        public Void visit(cmm.Absyn.SIfElse p, Void arg)
        { /* Code for SIfElse goes here */
            Type t = p.exp_.accept(new ExpVisitor(), null);
            compareTypes(t, BOOL);
            
            newScope();
            p.stm_1.accept(new StmVisitor(), arg);
            closeScope();

            newScope();
            p.stm_2.accept(new StmVisitor(), arg);
            closeScope();
            return null;
        }
    }

    public class ExpVisitor implements cmm.Absyn.Exp.Visitor<Type,Void>
    {
        public Type visit(cmm.Absyn.EBool p, Void arg)
        { /* Code for EBool goes here */
            p.boollit_.accept(new BoolLitVisitor(), arg);
            return BOOL;
        }
        public Type visit(cmm.Absyn.EInt p, Void arg)
        { /* Code for EInt goes here */
            //p.integer_;
            return INT;
        }
        public Type visit(cmm.Absyn.EDouble p, Void arg)
        { /* Code for EDouble goes here */
            //p.double_;
            return DOUBLE;
        }
        public Type visit(cmm.Absyn.EId p, Void arg)
        { /* Code for EId goes here */
            //p.id_;
            return lookupVariableType(p.id_);
        }
        public Type visit(cmm.Absyn.EApp p, Void arg)
        { /* Code for EApp goes here */
            // Check if function is defined
            FunctionDefinition fd = definitions.get(p.id_);
            // Check function expressions
            for (cmm.Absyn.Exp x: p.listexp_) {
                x.accept(new ExpVisitor(), arg);
            }

            // Check number of arguments in function
            if (fd == null || p.listexp_.size() != fd.argumentsList.size()){
                throw new TypeException("Function is not defined or is called with the wrong number of arguments");
            }
            checkArgTypes(p.listexp_,fd.argumentsList);
            return fd.returnType;
        }
        public Type visit(cmm.Absyn.EPost p, Void arg)
        { /* Code for EPost goes here */
            //p.id_;
            Type t = lookupVariableType(p.id_);
            boolean b = isIntOrDouble(t);
            if (!b) {
                throw new TypeException("Increment and decrement only callable on int or double");
            }
            p.incdecop_.accept(new IncDecOpVisitor(), arg);
            return t;
        }
        public Type visit(cmm.Absyn.EPre p, Void arg)
        { /* Code for EPre goes here */
            Type t = lookupVariableType(p.id_);
            boolean b = isIntOrDouble(t);
            if (!b) {
                throw new TypeException("Increment and decrement only callable on int or double");
            }
            p.incdecop_.accept(new IncDecOpVisitor(), arg);
            //p.id_;
            return t;
        }
        public Type visit(cmm.Absyn.EMul p, Void arg)
        { /* Code for EMul goes here */
            Type t1 = p.exp_1.accept(new ExpVisitor(), arg);
            p.mulop_.accept(new MulOpVisitor(), arg);
            Type t2 = p.exp_2.accept(new ExpVisitor(), arg);
            
            if (!(isIntOrDouble(t1) && isIntOrDouble(t2))) {
                throw new TypeException("Multiplication only callable on int or double");
            }

            
            if (!t1.equals(t2)) return DOUBLE;
            return t1;
        }
        public Type visit(cmm.Absyn.EAdd p, Void arg)
        { /* Code for EAdd goes here */
            Type t1 = p.exp_1.accept(new ExpVisitor(), arg);
            p.addop_.accept(new AddOpVisitor(), arg);
            Type t2 = p.exp_2.accept(new ExpVisitor(), arg);

            if (!(isIntOrDouble(t1) && isIntOrDouble(t2))) {
                throw new TypeException("Addition only callable on int or double");
            }

            if (!t1.equals(t2)) return DOUBLE;
            return t1;
        }
        public Type visit(cmm.Absyn.ECmp p, Void arg)
        { /* Code for ECmp goes here */
            Type t1 = p.exp_1.accept(new ExpVisitor(), arg);
            // Returns true if comparison is eq/neq, false otherwise
            boolean b = p.cmpop_.accept(new CmpOpVisitor(), arg);
            Type t2 = p.exp_2.accept(new ExpVisitor(), arg);
            if (b) {
                if (t1.equals(VOID) || t2.equals(VOID)) {
                    throw new TypeException("Eq/Neq not applicable to void type.");
                }
                compareTypes(t1, t2);
            } else {
                if (!(isIntOrDouble(t1) && isIntOrDouble(t2))) {
                    throw new TypeException("Comparison only applies to numerical values.");
                }
            }
                        
            return BOOL;
        }
        public Type visit(cmm.Absyn.EAnd p, Void arg)
        { /* Code for EAnd goes here */
            Type t1 = p.exp_1.accept(new ExpVisitor(), arg);
            Type t2 = p.exp_2.accept(new ExpVisitor(), arg);
            compareTypes(t1, t2);
            compareTypes(t1, BOOL);

            return BOOL;
        } 
        public Type visit(cmm.Absyn.EOr p, Void arg)
        { /* Code for EOr goes here */
            Type t1 = p.exp_1.accept(new ExpVisitor(), arg);
            Type t2 = p.exp_2.accept(new ExpVisitor(), arg);
            compareTypes(t1, t2);
            compareTypes(t1, BOOL);
            return BOOL;
        }
        public Type visit(cmm.Absyn.EAss p, Void arg)
        { /* Code for EAss goes here */
            Type t1 = p.exp_.accept(new ExpVisitor(), arg);
            Type t2 = lookupVariableType(p.id_);

            // Enable assignments such as "double a; a = 345;"
            if (t2.equals(DOUBLE) && t1.equals(INT)) {
                t1 = DOUBLE;
            } 
            compareTypes(t1, t2);
            
            return t1;
        }
    }
    
    public class IncDecOpVisitor implements cmm.Absyn.IncDecOp.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.OInc p, Void arg)
        { /* Code for OInc goes here */
            return null;
        }
        public Void visit(cmm.Absyn.ODec p, Void arg)
        { /* Code for ODec goes here */
            return null;
        }
    }
    
    public class MulOpVisitor implements cmm.Absyn.MulOp.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.OTimes p, Void arg)
        { /* Code for OTimes goes here */
            return null;
        }
        public Void visit(cmm.Absyn.ODiv p, Void arg)
        { /* Code for ODiv goes here */
            return null;
        }
    }
    
    public class AddOpVisitor implements cmm.Absyn.AddOp.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.OPlus p, Void arg)
        { /* Code for OPlus goes here */
            return null;
        }
        public Void visit(cmm.Absyn.OMinus p, Void arg)
        { /* Code for OMinus goes here */
            return null;
        }
    }
    
    public class CmpOpVisitor implements cmm.Absyn.CmpOp.Visitor<Boolean,Void>
    {
        public Boolean visit(cmm.Absyn.OLt p, Void arg)
        { /* Code for OLt goes here */
            return false;
        }
        public Boolean visit(cmm.Absyn.OGt p, Void arg)
        { /* Code for OGt goes here */
            return false;
        }
        public Boolean visit(cmm.Absyn.OLtEq p, Void arg)
        { /* Code for OLtEq goes here */
            return false;
        }
        public Boolean visit(cmm.Absyn.OGtEq p, Void arg)
        { /* Code for OGtEq goes here */
            return false;
        }
        public Boolean visit(cmm.Absyn.OEq p, Void arg)
        { /* Code for OEq goes here */
            return true;
        }
        public Boolean visit(cmm.Absyn.ONEq p, Void arg)
        { /* Code for ONEq goes here */
            return true;
        }
    }
    
    public class BoolLitVisitor implements cmm.Absyn.BoolLit.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.LTrue p, Void arg)
        { /* Code for LTrue goes here */
            return null;
        }
        public Void visit(cmm.Absyn.LFalse p, Void arg)
        { /* Code for LFalse goes here */
            return null;
        }
    }
    
    public class TypeVisitor implements cmm.Absyn.Type.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.Type_bool p, Void arg)
        { /* Code for Type_bool goes here */
            return null;
        }
        public Void visit(cmm.Absyn.Type_int p, Void arg)
        { /* Code for Type_int goes here */
            return null;
        }
        public Void visit(cmm.Absyn.Type_double p, Void arg)
        { /* Code for Type_double goes here */
            return null;
        }
        public Void visit(cmm.Absyn.Type_void p, Void arg)
        { /* Code for Type_void goes here */
            return null;
        }
    }

    public boolean isVoidType(Type t) {
        return t instanceof Type_void;
    }

    private class FunctionDefinition {
        final Type returnType;
        final ListArg argumentsList;
        public FunctionDefinition (Type retType, ListArg argList) {
            returnType = retType;
            argumentsList = argList;
        }
    }
    
    public void newScope() { 
        scopeList.add(0, new HashMap<String,Type>());
    }

    public void closeScope() { 
        scopeList.remove(0);
    }

    public ListArg oneArgList (Type t) {
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
        for (HashMap<String, Type> v: scopeList) {
            Type t = v.get(x);
            if (t != null) return t;
        }
        throw new TypeException("The variable " + x + " is not initialized ");
    }

    public void addVarToContext(String id, Type t) {
        // Get the top context block
        HashMap<String,Type> cxt = scopeList.get(0);

        // Check that the variable is not declared already
        if (cxt.containsKey(id))
            throw new TypeException("found a duplicate variable binding with name: " + id);
        // Add the binding
        cxt.put(id, t);
    }

    private void checkArgTypes(ListExp le, ListArg la) {
        for (int i = 0;i< le.size();i++) {
            Type expType = le.get(i).accept(new ExpVisitor(), null);
            Type argType = ((ADecl) la.get(i)).type_;
            
            if (argType.equals(DOUBLE) && expType.equals(INT)) expType = new Type_double();
            compareTypes(expType, argType);
        }
    }

    private boolean isIntOrDouble(Type t) {
        return t.equals(INT) || t.equals(DOUBLE);
    }
}


