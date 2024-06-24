
public class Binary extends Expression{
	Operator op;
	Expression term1, term2;
	protected Binary(Operator o, Expression t1, Expression t2){
		this.term1 = t1;
		this.term2 = t2;
		this.op = o;
	}
	@Override
	public String toString() {
        return "[op='" + op.toString()+ "' term1=" + term1.toString() + " term2=" + term2.toString() + "]";
    }
	
}
