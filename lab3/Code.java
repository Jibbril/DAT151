import cmm.Absyn.*;
// Code.java
// Created by github.com/andreasabel/java-adt

abstract class SFun {
    public abstract <R> R accept(FunVisitor<R> v);
}

// =====================================================================
// ================================ Fun ================================
// =====================================================================
class Fun extends SFun {
    public String id;
    public FunType funDef;

    public Fun(String id, FunType funDef) {
        this.id = id;
        this.funDef = funDef;
    }

    public String toJVM() {
        return id + funDef.toJVM();
    }

    public <R> R accept(FunVisitor<R> v) {
        return v.visit(this);
    }
}

interface FunVisitor<R> {
    public R visit(Fun f);
}

// =====================================================================
// ================================ Code ===============================
// =====================================================================
abstract class Code {
    public abstract <R> R accept(CodeVisitor<R> v);
}

class Comment extends Code { // extends Code call visitor with accept
    public String comment;

    public Comment(String c) {
        comment = c;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Store extends Code {
    public Type type;
    public Integer addr;

    public Store(Type type, Integer addr) {
        this.type = type;
        this.addr = addr;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Load extends Code {
    public Type type;
    public Integer addr;

    public Load(Type type, Integer addr) {
        this.type = type;
        this.addr = addr;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IConst extends Code {
    public Integer immed;

    public IConst(Integer immed) {
        this.immed = immed;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class DConst extends Code {
    public Double immed;

    public DConst(Double immed) {
        this.immed = immed;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Dup extends Code {
    public Type type;

    public Dup(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Pop extends Code {
    public Type type;

    public Pop(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Return extends Code {
    public Type type;

    public Return(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Call extends Code {
    public Fun fun;

    public Call(Fun fun) {
        this.fun = fun;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Target extends Code {
    public Label label;

    public Target(Label label) {
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Label extends Code {
    public int label;

    public Label(int label) {
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Goto extends Code {
    public Label label;

    public Goto(Label label) {
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfZ extends Code {
    public Label label;

    public IfZ(Label label) {
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfNZ extends Code {
    public Label label;

    public IfNZ(Label label) {
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfEq extends Code {
    public Type type;
    public Label label;

    public IfEq(Type type, Label label) {
        this.type = type;
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfNe extends Code {
    public Type type;
    public Label label;

    public IfNe(Type type, Label label) {
        this.type = type;
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfLt extends Code {
    public Type type;
    public Label label;

    public IfLt(Type type, Label label) {
        this.type = type;
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfGt extends Code {
    public Type type;
    public Label label;

    public IfGt(Type type, Label label) {
        this.type = type;
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfLe extends Code {
    public Type type;
    public Label label;

    public IfLe(Type type, Label label) {
        this.type = type;
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Incr extends Code {
    public Type type;
    public Integer addr;
    public Integer increment;

    public Incr(Type type, Integer addr, Integer increment) {
        this.type = type;
        this.addr = addr;
        this.increment = increment;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class IfGe extends Code {
    public Type type;
    public Label label;

    public IfGe(Type type, Label label) {
        this.type = type;
        this.label = label;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class DCmp extends Code {
    public DCmp() {
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Inc extends Code {
    public Type type;
    public Integer addr;
    public Integer delta;

    public Inc(Type type, Integer addr, Integer delta) {
        this.type = type;
        this.addr = addr;
        this.delta = delta;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Add extends Code {
    public Type type;

    public Add(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Sub extends Code {
    public Type type;

    public Sub(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Mul extends Code {
    public Type type;

    public Mul(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

class Div extends Code {
    public Type type;

    public Div(Type type) {
        this.type = type;
    }

    public <R> R accept(CodeVisitor<R> v) {
        return v.visit(this);
    }
}

// =====================================================================
// ============================ CodeVisitor ============================
// =====================================================================
interface CodeVisitor<R> {
    public R visit(Incr c);

    public R visit(Comment c);

    public R visit(Target c);

    public R visit(Store c);

    public R visit(Load c);

    public R visit(IConst c);

    public R visit(DConst c);

    public R visit(Dup c);

    public R visit(Pop c);

    public R visit(Return c);

    public R visit(Call c);

    public R visit(Label c);

    public R visit(Goto c);

    public R visit(IfZ c);

    public R visit(IfNZ c);

    public R visit(IfEq c);

    public R visit(IfNe c);

    public R visit(IfLt c);

    public R visit(IfGt c);

    public R visit(IfLe c);

    public R visit(IfGe c);

    public R visit(DCmp c);

    public R visit(Inc c);

    public R visit(Add c);

    public R visit(Sub c);

    public R visit(Mul c);

    public R visit(Div c);
}

// =====================================================================
// ============================= CodeToJvm =============================
// =====================================================================
class CodeToJVM implements CodeVisitor<String> {
    private String print(String str) {
        return str + "\n";
    }

    public String visit(Inc c) {
        return "Inc string";
    }

    public String visit(DCmp c) {
        return print("dcmpg");
    }

    public String visit(Label c) {
        return "Label string";
    }

    public String visit(Target c) {
        return print("L" + c.label.label + ":");
    }

    public String visit(Comment c) {
        return "\n        ;; " + c.comment;
    }

    public String visit(Store c) {
        if (c.type instanceof Type_int || c.type instanceof Type_void || c.type instanceof Type_bool)
            return (c.addr >= 0 && c.addr <= 3) ? print("istore_" + c.addr) : print("istore " + c.addr);
        else if (c.type instanceof Type_double)
            return (c.addr >= 0 && c.addr <= 3) ? print("dstore_" + c.addr) : print("dstore " + c.addr);
        throw new RuntimeException("The type: " + c.type + " is not correct for the store method");
    }

    public String visit(Load c) {
        if (c.type instanceof Type_int || c.type instanceof Type_void || c.type instanceof Type_bool)
            return (c.addr >= 0 && c.addr <= 3) ? print("iload_" + c.addr) : print("iload " + c.addr);
        else if (c.type instanceof Type_double)
            return (c.addr >= 0 && c.addr <= 3) ? print("dload_" + c.addr) : print("dload " + c.addr);
        throw new RuntimeException("The type: " + c.type + " is not correct for the load method");
    }

    public String visit(IConst c) {
        int i = c.immed.intValue();
        if (i == -1)
            return print("iconst_m1");
        if (i >= 0 && i <= 5)
            return print("iconst_" + i);
        if (i >= -128 && i < 128)
            return print("bipush " + i);
        return print("ldc " + c.immed.toString());
    }

    public String visit(DConst c) {
        double i = c.immed.doubleValue();
        if (i == 0.0)
            return print("dconst_0");
        if (i == 1.0)
            return print("dconst_1");
        else
            return print("ldc2_w " + i);
    }

    public String visit(Dup c) {
        if (c.type instanceof Type_int || c.type instanceof Type_void)
            return print("dup");
        else if (c.type instanceof Type_double)
            return print("dup2");
        return "";
    }

    public String visit(Pop c) {
        if (c.type instanceof Type_int || c.type instanceof Type_bool)
            return print("pop");
        else if (c.type instanceof Type_void) {
            return print("nop");
        }
        return "";
    }

    public String visit(Call c) {
        return print("invokestatic " + c.fun.toJVM());
    }

    public String visit(Goto c) {
        return print("goto" + " " + "L" + c.label.label);
    }

    public String visit(Return c) {
        if (c.type instanceof Type_int || c.type instanceof Type_bool)
            return print("ireturn");
        else if (c.type instanceof Type_double)
            return print("dreturn");
        else if (c.type instanceof Type_void)
            return print("return");
        throw new RuntimeException("The type: " + c.type + " is not correct for the return method");
    }

    public String visit(IfEq c) {
        // TODO: Add logic for doubles
        if (c.type instanceof Type_int)
            return print("if_icmpeq " + " " + "L" + c.label.label);
        else
            throw new RuntimeException("Expected type int1 but receiced type: " + c.type);
    }

    public String visit(IfNe c) {
        // TODO: Add logic for doubles
        if (c.type instanceof Type_int)
            return print("if_icmpne " + " " + "L" + c.label.label);
        else
            throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(IfLt c) {
        // TODO: Add logic for doubles
        if (c.type instanceof Type_int)
            return print("if_icmplt " + " " + "L" + c.label.label);
        else
            throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(IfGe c) {
        // TODO: Add logic for doubles
        if (c.type instanceof Type_int)
            return print("if_icmpge " + " " + "L" + c.label.label);
        else
            throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(IfGt c) {
        // TODO: Add logic for doubles
        if (c.type instanceof Type_int)
            return print("if_icmpgt " + " " + "L" + c.label.label);
        else
            throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(IfLe c) {
        // TODO: Add logic for doubles
        if (c.type instanceof Type_int)
            return print("if_icmple " + " " + "L" + c.label.label);
        else
            throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(IfZ c) {
        return print("ifeq" + " " + "L" + c.label.label);
    }

    public String visit(IfNZ c) {
        return print("ifne" + " " + "L" + c.label.label);
    }

    public String visit(Incr c) {
        if (c.type instanceof Type_int)
            return print("iinc " + c.addr + " " + c.increment);
        throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(Add c) {
        if (c.type instanceof Type_int)
            return print("iadd");
        else if (c.type instanceof Type_double)
            return print("dadd");
        throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(Sub c) {
        if (c.type instanceof Type_int)
            return print("isub");
        else if (c.type instanceof Type_double)
            return print("dsub");
        throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(Mul c) {
        if (c.type instanceof Type_int)
            return print("imul");
        else if (c.type instanceof Type_double)
            return print("dmul");
        throw new RuntimeException("Expected numeric value, found " + c.type);
    }

    public String visit(Div c) {
        if (c.type instanceof Type_int)
            return print("idiv");
        else if (c.type instanceof Type_double)
            return print("ddiv");
        throw new RuntimeException("Expected numeric value, found " + c.type);
    }

}
