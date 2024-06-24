package bd1;

public class Subject {
	private String subjectCode;
	private String subjectName;
	private float credit;
	
	public Subject() {
		subjectCode = null;
		subjectName = null;
		credit = 0.0f;
	}
	public Subject(Subject sb) {
		subjectCode = sb.subjectCode;
		subjectName = sb.subjectName;
		credit = sb.credit;
	}
	public Subject(String ss) {
		String [] strval;
		strval = ss.split("/");
		subjectCode = strval[0];
		subjectName = strval[1];
		credit = Float.parseFloat(strval[2]);
	}
	public void setSubjectCode(String sC) {
		subjectCode = sC;
	}
	public void setSubjectName(String sN) {
		subjectName = sN;
	}
	public void setCredit(float cr) {
		credit = cr;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public float getCredit() {
		return credit;
	}
	public static void displayHead() {
		String titleTemplate = "%-20s %-40s %10s\n";
		System.out.println("****Hicheeluudiin jagsaalt****");
		System.out.printf(titleTemplate, "Hicheeliin code", "Hicheeliin ner", "credit");
	}
	public void display() {
		String titleTemplate = "%-20s %-40s %10s\n";
		System.out.printf(titleTemplate, subjectCode, subjectName, credit);
	}
}