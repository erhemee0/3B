package bd1;

public class Major {
	private String majorCode;
	private String majorName;
	public Major() {
		majorCode = null;
		majorName = null;
	}
	public Major(String ss) {
		String [] strval;
		strval = ss.split("/");
		majorCode = strval[0];
		majorName = strval[1];
	}
	public Major(Major mj) {
		majorCode = mj.majorCode;
		majorName = mj.majorName;
	}
	public void setMajorCode(String mC) {
		majorCode = mC;
	}
	public void setMajorName(String mN) {
		majorName = mN;
	}
	public String getMajorCode() {
		return majorCode;
	}
	public String getMajorName() {
		return majorName;
	}
	public static void displayHead() {
		String titletemp = "%-15s %-45s\n";
		System.out.println("****Mergejluudiin jagsaalt****");
		System.out.printf(titletemp, "Mergejliin code", "Mergejliin ner");
	}
	public void display() {
		String titletemp = "%-15s %-45s\n";
		System.out.printf(titletemp, majorCode, majorName);
	}
}
