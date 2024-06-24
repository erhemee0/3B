
public class BoolValue extends Value{

	private boolean value;

    public BoolValue(boolean value) {
        this.value = value;
    }

    public String toString() {
        return " (BoolValue)"+Boolean.toString(value);
    }

}
