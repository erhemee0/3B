public class lab3 {

    abstract class Expression {

    }

    abstract class VariableRef extends Expression {

    }

    class IntValue extends Expression {
        public int value;

        public IntValue(int n) {
            value = n;
        }
    }

    public class Variable extends VariableRef {
        String id;

        Variable(String id) {
            this.id = id;
        }

        public String toString() {
            return id;
        }
    }

    public class Value extends Expression {

    }

    public class Binary extends Expression {
        Operator op;
        Expression term1, term2;
    }

    class Unary extends Expression {
        UnaryOp op;
        Expression term;
    }

    public static void main(String[] args) {

    }

}