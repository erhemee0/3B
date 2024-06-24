package lab;
import java.util.Scanner;

import dataStructures.*; //B210910019 А.Эрхэмбаяр
public class MyHashTable extends HashTable{
	
	public MyHashTable(int theDivisor) {
		super(theDivisor);
	}
	
	
	public Object updateElement(Object theKey, Object theElement) {
		Object elementToUpdate = this.put(theKey, theElement);
		return elementToUpdate;
	}
	
	public Object updateKey(Object theKey, Object theNewKey) {
		this.put(theNewKey, this.get(theKey));
		Object el1 = this.get(theKey);
		this.delete(theKey);
		return el1;
	}
	
	public void delete(Object theKey)
	{
		Object element = this.get(theKey);
	    if(element!=null) {
	    	int x= this.search(theKey);
	    	table[x]= null;
	    	this.size--;		  
	   }
	}
	
	public static void main(String[] args) {
		MyHashTable ht = new MyHashTable(11);
		ht.put(new Integer(10), new Integer(11));
		ht.put(new Integer(20), new Integer(21));
		ht.put(new Integer(30), new Integer(31));
		ht.put(new Integer(40), new Integer(41));
		int choice,key,element,newKey;
		Scanner sc = new Scanner(System.in);
		ht.output();
		System.out.println("Та сонголтоо хийнэ үү");
		System.out.println("1.updateElement()\n2.updateKey\n3.delete()");
		System.out.println("Таны сонголт");
		try {
			choice = sc.nextInt();
			while(choice!=0) {
				switch(choice) {
				case 1:
					System.out.println("Та түлхүүр болон шинэ утгыг оруулна уу");
					key = sc.nextInt();
					element = sc.nextInt();
					ht.updateElement(key, element);
					System.out.println("-----------------------------------------");
					ht.output();
					break;
				case 2:
					System.out.println("Та хуучин түлхүүр болон шинэ түлхүүрийг оруулна уу");
					key = sc.nextInt();
					newKey = sc.nextInt();
					ht.updateKey(key, newKey);
					ht.output();
					break;
				case 3:
					System.out.println("Та түлхүүр оруулна уу");
					key = sc.nextInt();
					ht.delete(key);
					ht.output();
					break;
				case 9:
					System.out.println("Сонголтууд: \n"+ "1.updateElement()\\n2.updateKey\\n3.delete()\n");
					break;
				default:
					System.out.println("То сонголтоо зөв оруулна уу\n"+"Сонголтуудыг харах бол 9-г сонгоно уу");
				}
				System.out.println("\nТаны сонголт:");
				choice = sc.nextInt();
			}
			System.out.println("Програм дууслаа");
			sc.close();
		}
		catch(Exception e){
			System.out.println("Алдаа гарлаа!");
			main(args);
		}
	}

}
