package bd1;
import java.io.*;
import java.util.*;
import dataStructures.*;
public class Registration extends ArrayLinearList{
	public ArrayLinearList studentList;
	public ArrayLinearList majorList;
	public ArrayLinearList subjectList;
	
	public Registration() {
		studentList = new ArrayLinearList();
		subjectList = new ArrayLinearList();
		majorList = new ArrayLinearList();
	}
	public void readSubjectList() {
		try {
			File file = new File("src/bd1/Subjects.txt");
			Scanner sc = new Scanner(file);
			int k = 0;
			while(sc.hasNext()) {
				Subject sj = new Subject(sc.nextLine());
				subjectList.add(k++, sj);
			}
			sc.close();
		}
		catch(FileNotFoundException ex){
			System.out.println("Error: " + ex.getMessage());
			System.exit(0);
		}
	}
	public void printSubjects() {
		Subject.displayHead();
		for(int i = 0; i < subjectList.size(); i++) {
			((Subject)subjectList.get(i)).display();
		}
	}
	public void readMajorList() {
		try {
			File file = new File("src/bd1/Professions.txt");
			Scanner sca = new Scanner(file);
			int k = 0;
			while(sca.hasNext()) {
				Major mj = new Major(sca.nextLine());
				majorList.add(k++, mj);
			}
			sca.close();
		}
		catch(FileNotFoundException ex){
			System.out.println("Error: " + ex.getMessage());
			System.exit(0);
		}
	}
	public void printMajors() {
		Major.displayHead();
		for(int i = 0; i < majorList.size(); i++) {
			((Major)majorList.get(i)).display();
		}
	}
	public int checkStudent(String sc) {
		int ind = -1;
		for(int i = 0; i < this.studentList.size(); i++) {
			if(((Student)this.studentList.get(i)).getStudentCode().equals(sc))
				ind = i;
		}
		return ind;
	}
	public Major getMajor(String mc) {
		Major mj = new Major();
		Major mj1 = new Major();
		for(int i = 0; i < majorList.size(); i++) {
			mj1 = ((Major)majorList.get(i));
			if(mj1.getMajorCode()==mc) {
				mj=mj1;
			}
		}
		return mj;
	}
	public int getSubject(String sc) {
		int ind = -1;
		for(int i = 0; i < subjectList.size(); i++) {
			if(((Subject)subjectList.get(i)).getSubjectCode().equals(sc))
				ind = i;
		}
		return ind;
	}
	public void readStudentList() {
		studentList = new ArrayLinearList();
		try {
			File file = new File("src/bd1/Exams.txt");
			Scanner scanner = new Scanner(file);
			int k = 0; 
			while(scanner.hasNext()) {
				String ss = scanner.nextLine();
				String [] strArr = ss.split("/");
				if(checkStudent(strArr[0])==-1) {
					Student stdnt = new Student(strArr[0]);
					if(this.getSubject(strArr[1])!=-1)
						stdnt.addLesson((Subject)this.subjectList.get(this.getSubject(strArr[1])), Integer.parseInt(strArr[2]));
					studentList.add(k++, stdnt);
				}
				else {
					((Student)this.studentList.get(checkStudent(strArr[0]))).addLesson((Subject)this.subjectList.get(this.getSubject(strArr[1])), Integer.parseInt(strArr[2]));
				}
			}
			scanner.close();
		}
		catch(FileNotFoundException ex) {
			System.out.println("Error: " + ex.getMessage());
		}
	}
	public void displayStudensGPA() {
		Student.displayHeader();
		for(int i = 0; i < studentList.size(); i++) {
			((Student)studentList.get(i)).displayGpa();
		}
	}
	public void printRemovedStudents() {
		Student.removedDisplayHeader();
		for(int i = 0; i < studentList.size(); i++) {
			((Student)studentList.get(i)).removedDisplay();		
		}
	}
	public void printSubjectScore() {
		for(int i = 0; i < subjectList.size(); i++) {
			System.out.println(((Subject)subjectList.get(i)).getSubjectCode() + " kodtoi " + ((Subject)subjectList.get(i)).getSubjectName() + " hicheel deer oyutnuudin avsan dun");
			for( int j = 0; j < studentList.size(); j++) {
				((Student)studentList.get(j)).scorePerSubjects((Subject)subjectList.get(i));
			}
		}
	}	
	public void printMajorScore() {
		for(int i = 0; i < majorList.size(); i++) {
			System.out.println(((Major)majorList.get(i)).getMajorCode() + " kodtoi " + ((Major)majorList.get(i)).getMajorName() + " mergejliin  oyutnuudin dun");
			for( int j = 0; j < studentList.size(); j++) {
				((Student)studentList.get(j)).scorePerMajor((Major)majorList.get(i));
			}
		}
	}	
	public static void main(String [] args) {
		Registration rr = new Registration();
		rr.readSubjectList();
		rr.readMajorList();
		rr.readStudentList();
		System.out.println("1. Niit hicheeluudiin jagsaalt.\n2. Niit mergejluudiin jagsaalt.\n3. Oyutan buriin golch dung haruulah.\n4. 3-aas deesh hicheel deer unasan hasagsdah oyutnii jagsaalt.\n5. Hicheel bureer oyutnuudiin dung haruulah.\n6. Mergejil bureer oyutnuudiin dung haruulah.\n\n");
		System.out.println("Ta songoltoo oruulna uu!\n");
		Scanner scanner = new Scanner(System.in);
		
		try {
			int choice = scanner.nextInt();
			while(choice!=0) {
				switch(choice)
				{
				case 1:
					rr.printSubjects();
					break;
				case 2:
					rr.printMajors();
					break;
				case 3:
					rr.displayStudensGPA();
					break;
				case 4:
					rr.printRemovedStudents();
					break;
				case 5:
					rr.printSubjectScore();
					break;
				case 6:
					rr.printMajorScore();
					break;
				case 9:
					System.out.println("1. Niit hicheeluudiin jagsaalt.\n2. Niit mergejluudiin jagsaalt.\n3. Oyutan buriin golch dung haruulah.\n4. 3-aas deesh hicheel deer unasan hasagsdah oyutnii jagsaalt.\n5. Hicheel bureer oyutnuudiin dung haruulah.\n6. Mergejil bureer oyutnuudiin dung haruulah.\n\n");
					break;
				default:
					System.out.println("То сонголтоо зөв оруулна уу\n"+"Сонголтуудыг харах бол 9-г сонгоно уу");
				}
				System.out.println("Ta songoltoo oruulna uu!\n");
				choice = scanner.nextInt();
				}
			System.out.println("Программ дууслаа");
			Runtime.getRuntime().exit(0);
			}
		catch(InputMismatchException e) {
			System.out.println("Та тоо оруулна уу");
			main(args);
		}
		catch(Exception e){
			System.out.println("Алдаа гарлаа");
			main(args);
		}
	}
}
