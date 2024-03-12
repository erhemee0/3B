
public class IntValue extends Value{
	private int value;

    public IntValue(int value) {
        this.value = value;
    }

    public String toString() {
        return Integer.toString(value);
    }
}
