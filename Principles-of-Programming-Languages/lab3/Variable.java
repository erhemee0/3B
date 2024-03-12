
public class Variable extends VariableRef{
	private String name;

    public Variable(String name) {
        this.name = name;
    }

    public String toString() {
        return name;
    }
}
