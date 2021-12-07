
// Code.java
// Created by github.com/andreasabel/java-adt

abstract class SFun {
    public abstract <R> R accept (FunVisitor<R> v);
}

class Fun extends SFun {
    public  id;
    public FunType funType;
    public Fun (Id id, FunType funType) {
        this.id = id;
        this.funType = funType;
    }
    public <R> R accept (FunVisitor<R> v) {
        return v.visit (this);
    }
}

interface FunVisitor<R> {
    public R visit (Fun f);
}

abstract class Code {
    public abstract <R> R accept (CodeVisitor<R> v);
}

class Store extends Code {
    public Type type;
    public Integer addr;
    public Store (Type type, Integer addr) {
        this.type = type;
        this.addr = addr;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Load extends Code {
    public Type type;
    public Integer addr;
    public Load (Type type, Integer addr) {
        this.type = type;
        this.addr = addr;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IConst extends Code {
    public Integer immed;
    public IConst (Integer immed) {
        this.immed = immed;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class DConst extends Code {
    public Double immed;
    public DConst (Double immed) {
        this.immed = immed;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Dup extends Code {
    public Type type;
    public Dup (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Pop extends Code {
    public Type type;
    public Pop (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Return extends Code {
    public Type type;
    public Return (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Call extends Code {
    public Fun fun;
    public Call (Fun fun) {
        this.fun = fun;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Label extends Code {
    public Label label;
    public Label (Label label) {
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Goto extends Code {
    public Label label;
    public Goto (Label label) {
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfZ extends Code {
    public Label label;
    public IfZ (Label label) {
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfNZ extends Code {
    public Label label;
    public IfNZ (Label label) {
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfEq extends Code {
    public Type type;
    public Label label;
    public IfEq (Type type, Label label) {
        this.type = type;
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfNe extends Code {
    public Type type;
    public Label label;
    public IfNe (Type type, Label label) {
        this.type = type;
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfLt extends Code {
    public Type type;
    public Label label;
    public IfLt (Type type, Label label) {
        this.type = type;
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfGt extends Code {
    public Type type;
    public Label label;
    public IfGt (Type type, Label label) {
        this.type = type;
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfLe extends Code {
    public Type type;
    public Label label;
    public IfLe (Type type, Label label) {
        this.type = type;
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class IfGe extends Code {
    public Type type;
    public Label label;
    public IfGe (Type type, Label label) {
        this.type = type;
        this.label = label;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class DCmp extends Code {
    public DCmp () {
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Inc extends Code {
    public Type type;
    public Integer addr;
    public Integer delta;
    public Inc (Type type, Integer addr, Integer delta) {
        this.type = type;
        this.addr = addr;
        this.delta = delta;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Add extends Code {
    public Type type;
    public Add (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Sub extends Code {
    public Type type;
    public Sub (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Mul extends Code {
    public Type type;
    public Mul (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

class Div extends Code {
    public Type type;
    public Div (Type type) {
        this.type = type;
    }
    public <R> R accept (CodeVisitor<R> v) {
        return v.visit (this);
    }
}

interface CodeVisitor<R> {
    public R visit (Store c);
    public R visit (Load c);
    public R visit (IConst c);
    public R visit (DConst c);
    public R visit (Dup c);
    public R visit (Pop c);
    public R visit (Return c);
    public R visit (Call c);
    public R visit (Label c);
    public R visit (Goto c);
    public R visit (IfZ c);
    public R visit (IfNZ c);
    public R visit (IfEq c);
    public R visit (IfNe c);
    public R visit (IfLt c);
    public R visit (IfGt c);
    public R visit (IfLe c);
    public R visit (IfGe c);
    public R visit (DCmp c);
    public R visit (Inc c);
    public R visit (Add c);
    public R visit (Sub c);
    public R visit (Mul c);
    public R visit (Div c);
}

class CodeToJVM implements CodeVisitor<String> { //CodeToJVM은 visitor가 뭘하는지 function
    public String visit (Inc c) {
        return "Inc string";
    }

    public String visit (DCmp c) {
        return "DCmp string";
    }

    public String visit (Label c) {
        return "Label string";
    }
 
    public String visit (Target c) {
          return "L" + c.label.label + ":" + "\n" ;
      }
    
    public String visit (Comment c) {
        return "\n  ;; " + c.comment;
      }
  
    public String visit (Store c) {
        if(c.type instanceof Type_int||c.type instanceof Type_void||c.type instanceof Type_bool)
          return (c.addr >=0 && c.addr <=3)? "istore_"+ c.addr + "\n": "istore " + c.addr+ "\n";
        else if (c.type instanceof Type_double)
          return (c.addr >=0 && c.addr <=3)? "dstore_"+ c.addr + "\n": "dstore " + c.addr+ "\n";
        throw new RuntimeException("Wrong Type for store!");
      }
  
    public String visit (Load c) {
        if(c.type instanceof Type_int||c.type instanceof Type_void||c.type instanceof Type_bool)
          return (c.addr >=0 && c.addr <=3)? "iload_"+ c.addr + "\n": "iload " + c.addr+ "\n";
        else if (c.type instanceof Type_double)
          return (c.addr >=0 && c.addr <=3)? "dload_"+ c.addr+ "\n" : "dload " + c.addr+ "\n";
        throw new RuntimeException("Wrong Type for load!");
      }
  
    public String visit (IConst c) {
        int i = c.immed.intValue();
        if (i == -1) return "iconst_m1"+ "\n";
        if (i >= 0 && i <= 5) return "iconst_" + i+ "\n";
        if (i >= -128 && i < 128) return "bipush " + i+ "\n";
        return "ldc " + c.immed.toString()+ "\n";
      }
  
    public String visit (DConst c) {
          return "";
      }
  
    public String visit (Dup c) {
        if(c.type instanceof Type_int||c.type instanceof Type_void)
          return "dup"+ "\n";
        else if (c.type instanceof Type_double)
          return "dup2"+ "\n";
        return ""; // "nop"?????
      } 
  
    public String visit (Pop c) {
        if(c.type instanceof Type_int||c.type instanceof Type_bool)
          return "pop"+ "\n";
        else if (c.type instanceof Type_void)
          return "nop"+ "\n";
        return ""; 
      }    
  
    public String visit (Call c) {
        return "invokestatic " + c.fun.toJVM()+ "\n";
      } 
  
    public String visit (Goto c) {
        return "goto" +" "+ "L" + c.label.label+ "\n";
      } 
  
    public String visit (Return c) {
        if(c.type instanceof Type_int||c.type instanceof Type_bool)
          return "ireturn\n";
        else if (c.type instanceof Type_double)
          return "dreturn\n";
        else if (c.type instanceof Type_void)
          return "return\n"; 
        throw new RuntimeException("Wrong Type for return!");
      }
  
    public String visit (IfEq c) {
        if(c.type instanceof Type_int)
          return "if_icmpeq " +" "+ "L" + c.label.label+ "\n";
        else
          throw new RuntimeException("type must be int1!");
      }
    
    public String visit (IfNe c) {
        if(c.type instanceof Type_int)
          return "if_icmpne " +" "+ "L" + c.label.label+ "\n";
        else
          throw new RuntimeException("type must be int!2");
      }
  
    public String visit (IfLt c) {
        if(c.type instanceof Type_int)
          return "if_icmplt " +" "+ "L" + c.label.label+ "\n";
        else
          throw new RuntimeException("type must be int!3");
      }
  
    public String visit (IfGe c) {
        if(c.type instanceof Type_int)
          return "if_icmpge " +" "+ "L" + c.label.label+ "\n";
        else
          throw new RuntimeException("type must be int!4");
      }
  
    public String visit (IfGt c) {
        if(c.type instanceof Type_int)
          return "if_icmpgt " +" "+ "L" + c.label.label+ "\n";
        else
          throw new RuntimeException("type must be int!5");
      }
  
    public String visit (IfLe c) {
        if(c.type instanceof Type_int)
          return "if_icmple " +" "+ "L" + c.label.label+ "\n";
        else
          throw new RuntimeException("type must be int!6");
      }
  
    public String visit (IfZ c) {
        return "ifeq" +" "+ "L" + c.label.label+ "\n";
      } 
  
    public String visit (IfNZ c) {
        return "ifne" +" "+ "L" + c.label.label+ "\n";
      } 
  
    public String visit (Incr c) {
        if(c.type instanceof Type_int)
          return "iinc " + c.addr + " " +c.increment+ "\n";
        throw new RuntimeException("Internal error: type must be int to incr");
      }
    public String visit (Add c) {
        if(c.type instanceof Type_int)
          return "iadd"+ "\n";
        else if (c.type instanceof Type_double)
          return "dadd"+ "\n";
        throw new RuntimeException("Internal error: type must be numeric to add");
      }
  
    public String visit (Sub c) {
        if(c.type instanceof Type_int)
          return "isub"+ "\n";
        else if (c.type instanceof Type_double)
          return "dsub"+ "\n";
        throw new RuntimeException("Internal error: type must be numeric to sub");
      }
  
    public String visit (Mul c) {
        if(c.type instanceof Type_int)
          return "imul"+ "\n";
        else if (c.type instanceof Type_double)
          return "dmul"+ "\n";
        throw new RuntimeException("Internal error: type must be numeric to mul");
      }
  
    public String visit (Div c) {
        if(c.type instanceof Type_int)
          return "idiv"+ "\n";
        else if (c.type instanceof Type_double)
          return "ddiv"+ "\n";
        throw new RuntimeException("Internal error: type must be numeric to div");
      }
  
  }

