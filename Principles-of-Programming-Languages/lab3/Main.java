public class Main {
	public static void main(String[] args) {

		// z=x+2*y
		Expression term1 = new Variable("x");
		Expression term2a = new IntValue(2);
		Expression term2b = new Variable("y");
		Binary b2 = new Binary(new Operator('*'), term2a, term2b);
		Expression term_main = new Binary(new Operator('+'), term1, b2);

		Variable z = new Variable("int");
		Assignment assignment1	 = new Assignment(z, term_main);
		System.out.println(assignment1.toString());
	}
}
