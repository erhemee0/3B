
public class Assignment extends Expression{
	Variable target;
	Expression source;
	Assignment (Variable tar, Expression s){
		this.target = tar;
		this.source = s;
	}
	@Override
	public String toString() {
		return "target = "+ target.toString() + ", " + "source = "+  source.toString();
	}
	
	
}
