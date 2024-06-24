package bd2;

import java.io.*;
import java.util.*;
import lab.MyStack;
public class CarParking{

	public MyStack park = new MyStack(10);
	public Car car;
	public String line;
	public MyStack temp = new MyStack(10);
	public void input() {
		try {
			File file = new File("src/bie_daalt2/cars.txt");
			Scanner sc = new Scanner(file);
			while(sc.hasNext()) {
				line = sc.nextLine();
				String input[] = line.split(" ");
				car = new Car(input[1]);
				process(input[0],car);
			}
			sc.close();
			
		}
		catch(FileNotFoundException ex){
			System.out.println("Error: " + ex.getMessage());
			System.exit(0);
		}
	}
	public void process(String action,Car car) {
		int count =0;
		if(action.equals("A")) {//hiih uildel A ued
			if(!park.full()) {//stack duureegui ued stack-nd nemne
				output("Arrival " + car.number + " -> There is room.");
				park.push(car.number);
			}else {//stack duursen ued duuren gedgig hewlene
				output("Arrival " + car.number + " -> Garage full, this car cannot enter.");
			}
		}else {//hih uildel D ued
			if(park.exist(car.number)) {//stack dtr mashin ni orshdog bol

				while(!park.peek().equals(car.number)) {//mashin stack-iin oroi deer ireh hurtel stack-in oroigoos ustgana
					temp.push(park.pop());
				}
				
				park.pop(); 
				while(!temp.empty()) {//tur zuurin stack-aas undsen luu hiine
					park.push(temp.pop());
					count++;
				}
				output("Departure " + car.number + " -> " + count + " cars moved out.");//heden mashin hodolsnig hwlene
				count = 0;
				
			} else
				output("Departure "+car.number+ "-> This car not in the garage.");//mashin stackd orshdoggui bol helne
		}
	}
	
	public void output(String text) {	
		System.out.println(text);
	}
	
	public static void main(String[] args) {
		CarParking parking = new CarParking();
		parking.input();
		int count = 0;
		while(!parking.park.empty()) {
			parking.park.pop();
			count +=1;
		}
		System.out.println(count);
	}

}
