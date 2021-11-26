import cmm.Absyn.*;
import java.util.LinkedList;
import java.util.HashMap;
import java.util.Scanner;

public class Interpreter {
    public HashMap<String,DFun> definitions = new HashMap<>();
    public LinkedList<HashMap<String,Value>> contexts = new LinkedList<>();
    public Scanner userInput = new Scanner(System.in);

    // Share type constants
    public final Type BOOL   = new Type_bool();
    public final Type INT    = new Type_int();
    public final Type DOUBLE = new Type_double();
    public final Type VOID   = new Type_void();

    public void interpret(Program p) {
        ProgramVisitor pv = new ProgramVisitor();
        p.accept(pv, null);
    }
    
    public class ProgramVisitor implements cmm.Absyn.Program.Visitor<Void, Void> {
        public Void visit(cmm.Absyn.PDefs p, Void arg) { /* Code for PDefs goes here */
            contexts.add(new HashMap<String,Value>());
            
            for (cmm.Absyn.Def d: p.listdef_) {
                d.accept(new DefVisitor(), arg);
            }

        
            for (Stm s: definitions.get("main").liststm_) {
                if (s.accept(new StmVisitor(), null) != null)
                    break;
            }
            return null;
        }
    }

    public class DefVisitor implements cmm.Absyn.Def.Visitor<Void,Void>
    {
        public Void visit(cmm.Absyn.DFun p, Void arg)
        { /* Code for DFun goes here */
            
            definitions.put(p.id_ , p);
            
            return null;
        }
    }

    public class StmVisitor implements cmm.Absyn.Stm.Visitor<Value,Void>
    {
        public Value visit(cmm.Absyn.SExp p, Void arg)
        { /* Code for SExp goes here */
            p.exp_.accept(new ExpVisitor(), arg);
            return null;
        }
        
        public Value visit(cmm.Absyn.SDecls p, Void arg)
        { /* Code for SDecls goes here */
            p.type_.accept(new TypeVisitor(), arg);
    
            for (String x: p.listid_) {
                addVarToContext(x, null);
            }
            return null;
        }
        
        public Value visit(cmm.Absyn.SInit p, Void arg)
        { /* Code for SInit goes here */
            Value val = p.exp_.accept(new ExpVisitor(), arg);
            addVarToContext(p.id_, val);

            return null;
        }

        public Value visit(cmm.Absyn.SReturn p, Void arg)
        { /* Code for SReturn goes here */
            return p.exp_.accept(new ExpVisitor(), arg);
        }

        public Value visit(cmm.Absyn.SWhile p, Void arg)
        { /* Code for SWhile goes here */
            newScope();
            Value condition = p.exp_.accept(new ExpVisitor(), null);

            while (((VBoolean) condition).value){
                Value ret_v = p.stm_.accept(new StmVisitor(), arg);
                if (ret_v != null) return ret_v;
                condition = p.exp_.accept(new ExpVisitor(), null);
            }
            closeScope();
            return null;
        }
        
        public Value visit(cmm.Absyn.SBlock p, Void arg)
        { /* Code for SBlock goes here */
            newScope();
            for (cmm.Absyn.Stm x: p.liststm_) {
                Value v = x.accept(new StmVisitor(), arg);
                if (v!=null) return v;
            }
            closeScope();
            return null;
        }
        
        public Value visit(cmm.Absyn.SIfElse p, Void arg)
        { /* Code for SIfElse goes here */
            Value t = p.exp_.accept(new ExpVisitor(), null);
            newScope();

            if (((VBoolean) t).value) {
                Value v1 = p.stm_1.accept(new StmVisitor(), arg);
                if (v1 != null){
                    closeScope();
                    return v1;
                }
            }
            else{
                Value v2 = p.stm_2.accept(new StmVisitor(), arg);
                if (v2 != null) {
                    closeScope();
                    return v2;
                }
                
            }
            closeScope();
            return null;
        }
    }

    public class ExpVisitor implements cmm.Absyn.Exp.Visitor<Value,Void>
    {
        public Value visit(cmm.Absyn.EBool p, Void arg)
        { /* Code for EBool goes here */
            Boolean b = p.boollit_.accept(new BoolLitVisitor(), arg);
            return new VBoolean(b);
        }
        public Value visit(cmm.Absyn.EInt p, Void arg)
        { /* Code for EInt goes here */
            //p.integer_;
            return new VInteger(p.integer_);
        }
        public Value visit(cmm.Absyn.EDouble p, Void arg)
        { /* Code for EDouble goes here */
            //p.double_;
            return new VDouble(p.double_);
        }
        public Value visit(cmm.Absyn.EId p, Void arg)
        { /* Code for EId goes here */
            //p.id_;
            return lookupVariable(p.id_);
        }
        public Value visit(cmm.Absyn.EApp p, Void arg)
        { /* Code for EApp goes here */
            if (p.id_.equals("printInt")) {
                VInteger v = (VInteger)p.listexp_.get(0).accept(new ExpVisitor(), null);
                System.out.println(v.value);
                return null;
            }

            if (p.id_.equals("printDouble")) {
                VDouble v = (VDouble)p.listexp_.get(0).accept(new ExpVisitor(), null);
                System.out.println(v.value);
                return null;
            }

            if (p.id_.equals("readInt")) {
                int x = userInput.nextInt();
                return new VInteger(x);
            }

            if (p.id_.equals("readDouble")) {
                double x = userInput.nextDouble();
                return new VDouble(x);
            }


            DFun fun = definitions.get(p.id_);
            newScope();
            for (int i = 0;i<p.listexp_.size();i++){
                String argName = ((ADecl) fun.listarg_.get(i)).id_;
                Value val = p.listexp_.get(i).accept(new ExpVisitor(), arg);
                addVarToContext(argName, val);
            }

            for (Stm stm : fun.liststm_) {
                Value r = stm.accept(new StmVisitor(), arg);
                if (r != null) {
                    closeScope();
                    return r;
                }
            }
            
            closeScope();
            return null;
        }
        public Value visit(cmm.Absyn.EPost p, Void arg)
        { /* Code for EPost goes here */
            //p.id_;
            int n = lookupContextNr(p.id_);
            Value t = lookupVariable(p.id_);
            Boolean b = p.incdecop_.accept(new IncDecOpVisitor(), arg);
            updateVarInContext(p.id_, valueAddition(t, new VInteger(1), b), n);

            return t;
        }
        public Value visit(cmm.Absyn.EPre p, Void arg)
        { /* Code for EPre goes here */
            int n = lookupContextNr(p.id_);
            Value t = lookupVariable(p.id_);
            Boolean b = p.incdecop_.accept(new IncDecOpVisitor(), arg);
            updateVarInContext(p.id_, valueAddition(t, new VInteger(1), b), n);

            return t;
        }
        public Value visit(cmm.Absyn.EMul p, Void arg)
        { /* Code for EMul goes here */
            Value v1 = p.exp_1.accept(new ExpVisitor(), arg);
            Boolean b = p.mulop_.accept(new MulOpVisitor(), arg);
            Value v2 = p.exp_2.accept(new ExpVisitor(), arg);

            return valueMultiplication(v1, v2, b);
        }
        public Value visit(cmm.Absyn.EAdd p, Void arg)
        { /* Code for EAdd goes here */
            Value v1 = p.exp_1.accept(new ExpVisitor(), arg);
            Boolean b = p.addop_.accept(new AddOpVisitor(), arg);
            Value v2 = p.exp_2.accept(new ExpVisitor(), arg);

            return valueAddition(v1, v2, b);
        }

        public Value visit(cmm.Absyn.ECmp p, Void arg)
        { /* Code for ECmp goes here */
            Value t1 = p.exp_1.accept(new ExpVisitor(), arg);
            // Returns true if comparison is eq/neq, false otherwise
            CmpOp operator = p.cmpop_.accept(new CmpOpVisitor(), arg);
            Value t2 = p.exp_2.accept(new ExpVisitor(), arg);
                        
            return resolveComparison(t1, t2, operator);
        }

        public Value visit(cmm.Absyn.EAnd p, Void arg)
        { /* Code for EAnd goes here */
            Value t1 =  p.exp_1.accept(new ExpVisitor(), arg);
            if (!isVBoolean(t1)) {
                throw new RuntimeException("&& Operator only accepts booleans");
            }

            if (((VBoolean) t1).value) {
                Value t2 =  p.exp_2.accept(new ExpVisitor(), arg);

                if (!isVBoolean(t2)) {
                    throw new RuntimeException("&& Operator only accepts booleans");
                }

                if (((VBoolean) t2).value) {
                    return new VBoolean(true);
                }
            } 
            return new VBoolean(false);
        } 

        public Value visit(cmm.Absyn.EOr p, Void arg)
        { /* Code for EOr goes here */
            Value t1 =  p.exp_1.accept(new ExpVisitor(), arg);

            if (!isVBoolean(t1)) {
                throw new RuntimeException("|| Operator only accepts booleans");
            }
            if (((VBoolean) t1).value) {
                return new VBoolean(true);
            } else {
                Value t2 =  p.exp_2.accept(new ExpVisitor(), arg);
                if (!isVBoolean(t2)) {
                    throw new RuntimeException("|| Operator only accepts booleans");
                }
                if (((VBoolean) t2).value) {
                    return new VBoolean(true);
                }
            }
            return new VBoolean(false);
        }

        public Value visit(cmm.Absyn.EAss p, Void arg)
        { /* Code for EAss goes here */
            Value t1 = p.exp_.accept(new ExpVisitor(), arg);
            int contextNr = lookupContextNr(p.id_);
            updateVarInContext(p.id_, t1, contextNr);
           
            return t1;
        }
    }
    
    public class IncDecOpVisitor implements cmm.Absyn.IncDecOp.Visitor<Boolean,Void>
    {
        public Boolean visit(cmm.Absyn.OInc p, Void arg)
        { /* Code for OInc goes here */
            return true;
        }
        public Boolean visit(cmm.Absyn.ODec p, Void arg)
        { /* Code for ODec goes here */
            return false;
        }
    }
    
    public class MulOpVisitor implements cmm.Absyn.MulOp.Visitor<Boolean,Void>
    {
        public Boolean visit(cmm.Absyn.OTimes p, Void arg)
        { /* Code for OTimes goes here */
            return true;
        }
        public Boolean visit(cmm.Absyn.ODiv p, Void arg)
        { /* Code for ODiv goes here */
            return false;
        }
    }
    
    public class AddOpVisitor implements cmm.Absyn.AddOp.Visitor<Boolean,Void>
    {
        public Boolean visit(cmm.Absyn.OPlus p, Void arg)
        { /* Code for OPlus goes here */
            return true;
        }
        public Boolean visit(cmm.Absyn.OMinus p, Void arg)
        { /* Code for OMinus goes here */
            return false;
        }
    }
    
    public class CmpOpVisitor implements cmm.Absyn.CmpOp.Visitor<CmpOp,Void>
    {
        public CmpOp visit(cmm.Absyn.OLt p, Void arg)
        { /* Code for OLt goes here */
            return new OLt();
        }
        public CmpOp visit(cmm.Absyn.OGt p, Void arg)
        { /* Code for OGt goes here */
            return new OGt();
        }
        public CmpOp visit(cmm.Absyn.OLtEq p, Void arg)
        { /* Code for OLtEq goes here */
            return new OLtEq();
        }
        public CmpOp visit(cmm.Absyn.OGtEq p, Void arg)
        { /* Code for OGtEq goes here */
            return new OGtEq();
        }
        public CmpOp visit(cmm.Absyn.OEq p, Void arg)
        { /* Code for OEq goes here */
            return new OEq();
        }
        public CmpOp visit(cmm.Absyn.ONEq p, Void arg)
        { /* Code for ONEq goes here */
            return new ONEq();
        }
    }
    
    public class BoolLitVisitor implements cmm.Absyn.BoolLit.Visitor<Boolean,Void>
    {
        public Boolean visit(cmm.Absyn.LTrue p, Void arg)
        { /* Code for LTrue goes here */
            return true;
        }
        public Boolean visit(cmm.Absyn.LFalse p, Void arg)
        { /* Code for LFalse goes here */
            return false;
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


    // ======================== Value class ========================
    private abstract class Value {}
    public class VInteger extends Value {
        public final Integer value;
        public VInteger (Integer v) { value = v; }
        public boolean equals(Value val) {
            return (val instanceof VInteger) && this.value.equals(((VInteger) val).value);
        }
    }

    public class VBoolean extends Value {
        public final boolean value;
        public VBoolean (boolean v) { value = v; }
        public boolean equals(Value val) {
            return (val instanceof VBoolean) && this.value == (((VBoolean) val).value);
        }
    }

    public class VDouble extends Value {
        public final Double value;
        public VDouble (Double v) { value = v; }
        public boolean equals(Value val) {
            return (val instanceof VDouble) && this.value.equals(((VDouble) val).value);
        }
    }

    public class VVoid extends Value {
        public boolean equals(Value o) {
        return (o instanceof VVoid);
        }
    }

    // ======================== Utility methods ========================
    public boolean isVoidType(Type t) {
        return t instanceof Type_void;
    }
    
    public void newScope() { 
        contexts.add(0, new HashMap<String,Value>());
    }

    public void closeScope() { 
        contexts.remove(0);
    }

    public ListArg oneArgList (Type t) {
        ListArg l = new ListArg();
        l.add(new ADecl(t, "arg"));
        return l;
    }

    public void compareTypes(Type t1, Type t2) {
        if (!t1.equals(t2)) {
            throw new TypeException("Expected type: " + t2 + ", but found type: " + t1);
        }
    }

    public Value lookupVariable(String x) {
        for (HashMap<String, Value> v: contexts) {
            Value t = v.get(x);
            if (t != null) return t;
        }
        throw new RuntimeException("The variable " + x + " is not initialized ");
    }

    public int lookupContextNr(String x) {
        int i = 0;
        for (HashMap<String, Value> v: contexts) {
            Value t = v.get(x);
            if (t != null) return i;
            i++;
        }
        throw new RuntimeException("The variable " + x + " is not initialized ");
    }

    public void addVarToContext(String id, Value t) {
        // Get the top context block
        HashMap<String,Value> cxt = contexts.get(0);

        // Check that the variable is not declared already
        if (cxt.containsKey(id))
            throw new TypeException("found a duplicate variable binding with name: " + id);
        // Add the binding
        cxt.put(id, t);
    }

    public void updateVarInContext(String id, Value t, int contextNr) {
        // Get the top context block
        HashMap<String,Value> cxt = contexts.get(contextNr);
        cxt.put(id, t);
    }


    private Value valueAddition(Value v1, Value v2, boolean b) {
        if (b){
            if (v1 instanceof VInteger && v2 instanceof VInteger){
                return new VInteger(((VInteger)v1).value + ((VInteger)v2).value);
            }
            return new VDouble(((VDouble) v1).value + ((VDouble) v2).value);
        }
        else{
            if (v1 instanceof VInteger && v2 instanceof VInteger){
                return new VInteger(((VInteger)v1).value - ((VInteger)v2).value);
            }
            return new VDouble(((VDouble) v1).value - ((VDouble) v2).value);
        }
    }

    private Value valueMultiplication(Value v1, Value v2, boolean b) {
        if (b) {
            if (v1 instanceof VInteger && v2 instanceof VInteger){
                return new VInteger(((VInteger)v1).value * ((VInteger)v2).value);
            }
            return new VDouble(((VDouble) v1).value * ((VDouble) v2).value);
        }
        else {
            if (v1 instanceof VInteger && v2 instanceof VInteger){
                return new VInteger(((VInteger)v1).value / ((VInteger)v2).value);
            }
            return new VDouble(((VDouble) v1).value / ((VDouble) v2).value);
        }
    }

    public Value resolveComparison(Value v1, Value v2, CmpOp operator) {
        if (v1 instanceof VBoolean && v2 instanceof VBoolean) {
            return resolveBooleanComparison((VBoolean) v1, (VBoolean) v2, operator);
        } else if (v1 instanceof VInteger && v2 instanceof VInteger) {
            return resolveNumericalComparison((VInteger) v1, (VInteger) v2, operator);
        } else {
            return resolveNumericalComparison(castToVDouble(v1), castToVDouble(v2), operator);
        }
    }

    private VDouble castToVDouble(Value v) {
        if (v instanceof VInteger) {
            VInteger vi = (VInteger) v;
            return new VDouble(vi.value * 1.0);
        } else {
            VDouble vi = (VDouble) v;
            return new VDouble(vi.value * 1.0);
        }
        
    }
    
    public VBoolean resolveBooleanComparison(VBoolean v1, VBoolean v2,CmpOp operator){
        if (operator.equals(new OEq())) {
            return new VBoolean(v1.value == v2.value);
        }
       
        if (operator.equals(new ONEq())) {
            return new VBoolean(v1.value != v2.value);
        }
        return null;
    }

    public VBoolean resolveNumericalComparison(VInteger v1, VInteger v2,CmpOp operator){
        VDouble vd1 = new VDouble(v1.value * 1.0);
        VDouble vd2 = new VDouble(v2.value * 1.0);
        return resolveNumericalComparison(vd1,vd2,operator);
    }

    public VBoolean resolveNumericalComparison(VDouble v1, VDouble v2,CmpOp operator){
        if (operator.equals(new OEq())) {
            return new VBoolean(v1.value == v2.value);
        }
       
        if (operator.equals(new ONEq())) {
            return new VBoolean(v1.value != v2.value);
        }

        if (operator.equals(new OLt())) {
            return new VBoolean(v1.value < v2.value);
        }

        if (operator.equals(new OGt())) {
            return new VBoolean(v1.value > v2.value);
        }

        if (operator.equals(new OLtEq())) {
            return new VBoolean(v1.value <= v2.value);
        }

        if (operator.equals(new OGtEq())) {
            return new VBoolean(v1.value >= v2.value);
        }
        return null;
    }

    boolean isVBoolean(Value b) {
        return b instanceof VBoolean;
    }
}
