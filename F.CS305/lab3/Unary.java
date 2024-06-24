
public class Unary extends Expression{
	private UnaryOp op;
    private Expression expr;

    public Unary(UnaryOp op, Expression expr) {
        this.op = op;
        this.expr = expr;
    }

    public UnaryOp getOp() {
        return op;
    }

    public Expression getExpr() {
        return expr;
    }

    public String toString() {
        return op.toString() + expr.toString();
    }
}

