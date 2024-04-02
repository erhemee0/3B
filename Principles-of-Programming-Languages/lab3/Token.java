
public class Token<A, B> {
    public final A type;
    public final B value;

    public Token(A type, B value) {
        this.type = type;
        this.value = value;
    }

    @Override
    public String toString() {
        return "Token{" +
                "type=" + type +
                ", value=" + value +
                '}';
    }
}