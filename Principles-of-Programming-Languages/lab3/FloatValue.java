
public class FloatValue extends Value{
	
	private float value;

    public FloatValue(float value) {
        this.value = value;
    }

    public String toString() {
        return " (FloatValue)"+ Float.toString(value);
    }
}
