
public class CharValue extends Value{
	private char value;

    public CharValue(char value) {
        this.value = value;
    }

    public String toString() {
        return " (CharValue)"+String.valueOf(value);
    }
}
