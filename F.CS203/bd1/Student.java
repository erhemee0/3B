package bd1;
import dataStructures.*;
public class Student {
	private String studentCode;
	private float GPA;
	private Chain lessons;
	public Student() {
		studentCode = null;

		lessons = null;
	}
	public Student(String sCode) {
		studentCode = sCode;
		lessons = new Chain();
	}
	public String getStudentCode() {
		return studentCode;
	}
	public float getGPA() {
		float sumcr = 0, sumch = 0;
		for(int i = 0; i < lessons.size(); i++) {
			sumcr += ((Lesson)lessons.get(i)).learned.getCredit();
			sumch += ((Lesson)lessons.get(i)).calGPA()*((Lesson)lessons.get(i)).learned.getCredit();
		}
		GPA = sumch/sumcr;
		
		return GPA;
	}
	public int removedStudentPassedLessons() {
		int count = 0;
		for(int i = 0; i < lessons.size(); i++) {
			if(((Lesson)lessons.get(i)).score<61) {
				count++;
			}
		}
		return count;
	}
	public void scorePerSubjects(Subject a) {
		for(int i = 0; i < lessons.size(); i++) {
			if(((Lesson)lessons.get(i)).learned.getSubjectCode()==a.getSubjectCode()) {
				 System.out.println(this.studentCode + "  " + ((Lesson)lessons.get(i)).score);
			}
		}
	}
	public void scorePerMajor(Major a) {
		
		for(int i = 0; i < lessons.size(); i++) {
			if(this.MajorCodeReturn() == Integer.parseInt(a.getMajorCode())) {
				System.out.println(this.studentCode + "  " +((Lesson)lessons.get(i)).score);
			}
		}
	}
 public int MajorCodeReturn() {
		String first;
		first = Character.toString(this.getStudentCode().charAt(5)) + Character.toString(this.getStudentCode().charAt(6));
		return Integer.parseInt(first);
	}
	public void addLesson(Subject l , int sc) {
		Lesson al = new Lesson(l,sc);
		if(lessons.indexOf(al)==-1)
			lessons.add(lessons.size(), al);
	}
	public static void displayHeader() {
		String titleTemplate = "%-20s %10s %10s\n";
		System.out.println("****Hicheeluudiin jagsaalt****");
		System.out.printf(titleTemplate, "Oyutniii code", "uzsen h/too", "golch onoo");
	}
	public void displayGpa() {
		String titleTemplate = "%-20s %10s %10.2f\n";
		System.out.printf(titleTemplate, this.studentCode, this.lessons.size(), this.getGPA());
	}
	public static void removedDisplayHeader() {
		String titleTemplate = "%-20s %10s\n";
		System.out.println("****Hasagdah oyutnii jagsaalt****");
		System.out.printf(titleTemplate, "Oyutniii code", "unasan hiceeliin too");
	}
	public void removedDisplay() {
		String titleTemplate = "%-20s %10s \n";
		if(this.removedStudentPassedLessons()>=3)
		System.out.printf(titleTemplate, this.studentCode, this.removedStudentPassedLessons());
	}
}
