package lab;

import java.util.*;
import dataStructures.*;

public class MyStack extends DerivedArrayStack{
	
	public int maxsize;
	public Object[] stackArray;
	public int top;
	
	public MyStack(int size) {
		maxsize = size;
		stackArray = new Object[maxsize];
		top = -1;
	}
	
	public boolean full() {
		return(top==maxsize-1);
	}
	
	public boolean empty() {
		return(top==-1);
	}
	
	public Object peek() {
		return stackArray[top];
	}
	
	public void push(Object theObject) {
		if(!full()) {
			top++;
			stackArray[top] = theObject;
		}
	}
	
	public Object pop() {
		if(!empty()) {
			return stackArray[top--];
		}
		else 
			return "The Stack is empty ";
	}
	
	public MyStack unique() {
		int a=top+1;
		Object []array = new Object[a];
		for(int i=0; i<a;i++) {
			array[i]=stackArray[i];
		}
		MyStack uniqueStack = new MyStack(a);
		uniqueStack.push(array[0]);
		
		for(int i=1;i<a;i++) {
			int k=0;
			for(int j=0; j<i;j++) {
				if(array[i].equals(array[j])) {
					k++;
				}
			}
			if(k==0) {
				uniqueStack.push(array[i]);
			}
		}
		return uniqueStack;
	}
	
	public Object[] toArray() {
		int j=0;
		Object[] array = new Object[top+1];
		for(int i=top; i>=0; i--) {
			array[j] = stackArray[i];
			j++;
		}
		return array;
	}
	
	public MyStack rand() {
		int a = top+1;
		Object [] array = new Object[a];
		Object [] array1 = new Object[a];
		
		for(int i=0;i<a;i++) {
			array[i] = stackArray[i];
		}
		
		for(int i=0;i<a;i++) {
			int x = (int)(Math.random()*(a-1-i));
			array1[i] = array[x];
			array[x] = array[a-1-i];
		}
		MyStack randStack = new MyStack(a);
		for(int i=0;i<a;i++) {
			randStack.push(array1[i]);
		}
		return randStack;
	}
	
	public void addRange(Object[] elements) {
		for(int i=0;i<elements.length;i++) {
			this.push(elements[i]);
		}
	}
	
	public boolean exist(Object element) {
		Object[] arr = this.toArray();
		for(int i=0;i<arr.length;i++) {
			if(arr[i].equals(element))
				return true;
		}
		return false;
	}
	
	public static void main(String[] args) {
		MyStack s = new MyStack(10);
		s.push(1);
		s.push(2);
		s.push(3);
		s.push(2);
		s.push(5);
		
		int choice,index;
		Scanner sc = new Scanner(System.in);
		System.out.println("Та сонголтоо хийнэ үү");
		System.out.println("1.toArray()\n2.rand()\n3.unique()\n4.addRange()\n5.exist()\n");
		System.out.println("Таны сонголт");
		
		try {
			choice = sc.nextInt();
			while(choice!=0) {
				switch(choice) {
				case 1:
					Object[] array = s.toArray();
					System.out.println("toArray: ");
					for(int i=0; i<array.length;i++) {
						System.out.print(array[i] + " ");
					}
					break;
				case 2:
					MyStack randStack = s.rand();
					System.out.println("rand(): ");
					while(!randStack.empty()) {
						System.out.print(randStack.pop() + " ");
					}
					break;
				case 3:
					MyStack uniStack = s.unique();
					while(!uniStack.empty()) {
						System.out.print(uniStack.pop() + " ");
					}
					break;
				case 4:
					System.out.println("Та массивийн хэмжээг оруулна уу");
					index = sc.nextInt();
	    			Integer next[] = new Integer[index];
	    			System.out.println("Та элементүүдээ оруулна уу");
	    			for(int i=0; i<next.length; i++) {
	    				next[i] = sc.nextInt();
	    			}
	    			s.addRange(next);
					break;
				case 5:
					System.out.println("Та элементээ оруулна уу");
					index = sc.nextInt();
					if(s.exist(index))
						System.out.println("Энэ элемент нь стак дотор байна");
					else
						System.out.println("Энэ элемент нь стак дотор байхгүй");
					break;
				case 9:
					System.out.println("Сонголтууд: \n"+ "1.toArray()\n2.rand()\n3.unique()\n4.addRange()\n5.exist()\\n");
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