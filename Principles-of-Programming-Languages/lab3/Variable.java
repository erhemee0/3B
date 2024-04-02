public class Variable extends VariableRef {
    private String name;
    private Token<String, String> key;
    private Token<String, String> id;

    public Variable(String name) {
        this.name = name;
    }

    public Variable(Token<String, String> key1, Token<String, String> id1) {
        this.key = key1;
        this.id = id1;
    }

    public String toString() {
        return "Key: " + key + " id: " + id;
    }
}
