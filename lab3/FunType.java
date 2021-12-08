import cmm.Absyn.*;

public class FunType {
  final Type returnType;
  final ListArg argumentsList;

  public FunType(Type t, ListArg l) {
    returnType = t;
    argumentsList = l;
  }

  public String toJVM() {
    String argTypes = "";
    for (Arg a : argumentsList) {
      ADecl decl = (ADecl) a;
      argTypes = argTypes + decl.type_.accept(new TypeVisitor(), null);
    }
    return "(" + argTypes + ")" + returnType.accept(new TypeVisitor(), null);
  }
}

class TypeVisitor implements Type.Visitor<String, Void> {
  public String visit(cmm.Absyn.Type_bool p, Void arg) {
    return "Z";
  }

  public String visit(cmm.Absyn.Type_int p, Void arg) {
    return "I";
  }

  public String visit(cmm.Absyn.Type_double p, Void arg) {
    return "D";
  }

  public String visit(cmm.Absyn.Type_void p, Void arg) {
    return "V";
  }
}