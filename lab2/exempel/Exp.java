public abstract class Exp {
    public abstract <R,A> R accept(Exp.Visitor<R,A> v, A arg);
    public interface Visitor <R,A> {
        public R visit(Arithm.Absyn.EAdd p, A arg);
        public R visit(Arithm.Absyn.EMul p, A arg);
        public R visit(Arithm.Absyn.EInt p, A arg);
    }
}

public class EAdd extends Exp {
    public final Exp exp_1, exp_2;
    public <R,A> R accept(Arithm.Absyn.Exp.Visitor<R,A> v, A arg) {
        return v.visit(this, arg);
    }
}

public class EInt extends Exp {
    public final Integer integer_;
    public <R,A> R accept(Arithm.Absyn.Exp.Visitor<R,A> v, A arg) {
        return v.visit(this, arg);
    }
}