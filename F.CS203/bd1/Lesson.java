package bd1;

import dataStructures.Chain;

public class Lesson {
	public Subject learned;
	public int score;
	public Lesson(Subject l, int sc) {
		learned = new Subject(l);
		score = sc;	
	}
	
	public float calGPA(){
		float a=0;
		if(score>=96) {
			a=4.0f;
		}
		else if(score>90&&score<96) {
			a = 3.7f;
		}
		else if(score>87&&score<=90) {
			a = 3.4f;
		}
		else if(score>83&&score<=87) {
			a = 3.0f;
		}
		else if(score>80&&score<=83) {
			a = 2.7f;
		}
		else if(score>77&&score<=80) {
			a = 2.4f;
		}
		else if(score>73&&score<=77) {
			a = 2.0f;
		}
		else if(score>70&&score<=73) {
			a = 1.7f;
		}
		else if(score>67&&score<=70) {
			a = 1.3f;
		}
		else if(score>63&&score<=67) {
			a = 1.0f;
		}
		else if(score>60&&score<=63) {
			a = 0.7f;
		}
		else {
			a = 0.0f;
		}
		return a;
	}
}
