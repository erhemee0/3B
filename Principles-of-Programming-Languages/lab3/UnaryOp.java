
public class UnaryOp extends Unary{
	
	private char opChar;

    public UnaryOp(char opChar, Expression expr) {
        super(null, expr);
        this.opChar = opChar;
    }

    public String toString() {
        return Character.toString(opChar);
    }
}
