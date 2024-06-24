package lab;
import java.util.*;
import dataStructures.Chain; //B210910019 А.Эрхэмбаяр

public class MyChain extends Chain{
	
	public MyChain() {
		super();
	}
	public MyChain(int intialCapacity) {
		super(intialCapacity);
	}
	public Object[] toArray() {
		Object[] x = new Object[this.size()];
		for(int i=0; i<this.size(); i++)
			x[i] = get(i);
		return x;
	}	
	public void addRange(Object[] elements) {
		for(int i=0; i<elements.length; i++) {
			this.add(this.size(),(int)elements[i]);
		}
	}
	public MyChain intersection (MyChain chain) {
		MyChain  intersect=new MyChain();
		int q=0;
		for(int i=0; i<this.size(); i++) {
			for(int j=0; j<chain.size(); j++) {
				if((int)this.get(i)==(int)chain.get(j)) {
					intersect.add(q,this.get(i));
					q++;
					chain.remove(j);
					j=chain.size();
				}
			}
		}
		return intersect;
	}
	public MyChain union(MyChain chain) {
		MyChain  unions=new MyChain();
		int q=0;
		for(int i=0; i<this.size(); i++) {
			unions.add(i, this.get(i));
			q++;
		}
		for(int j=0; j<chain.size(); j++) {
			unions.add(q, chain.get(j));
			q++;			
		}
		MyChain in=this.intersection(chain);
		for(int i=0; i<in.size(); i++) {
			for(int j=0; j<unions.size(); j++) {
				if(in.get(i)==unions.get(j)) {
					unions.remove(j);
					j=unions.size();
				}
			}
		}
		return unions;
	}
	
	public static void main(String[] args) {
		MyChain x = new MyChain();
		x.add(0, new Integer(1));
		x.add(1, new Integer(2));
		x.add(2, new Integer(3));
		x.add(3, new Integer(4));
		int choice;
	    Scanner sc = new Scanner(System.in);
	    System.out.println("Ta сонголтоо оруулна уу:");
	    System.out.println("1.Main Chain\n2.toArray()\n3.addRAnge\n4.Intersection\n5.union\n6.Exit\n");
	    System.out.print("Таны сонголт:");
	    
	    try {
	    	choice = sc.nextInt();
	    	try {
		    	if(choice >0 && choice <7) {
			    	while(choice!=0) {
			    		int index=0;
			    		String input ="";
			    		switch(choice) {
			    		case 1:
			    			System.out.println("Main Chain" +x.toString());
			    			break;
			    		case 2:
							Object array[] = x.toArray();
			    			for(int i=0; i<x.size(); i++)
			    				System.out.print(array[i] + " ");
							break;
						case 3:
							System.out.println("Та жагсаалтын хэмжээг оруулна уу");
							index =sc.nextInt();
							System.out.println(input);
					    		Integer next[] = new Integer[index];
					    		System.out.println("Та элементүүдээ оруулна уу");
					    		for(int i=0; i<next.length; i++) {
					    			next[i] = sc.nextInt();
					    		}
					    		x.addRange(next);
					    		System.out.println(x);
					    		break;
						case 4:
							MyChain t2=new MyChain();
							System.out.println("t2 жагсаалтын хэмжээг оруулна уу\n");
							int hemjee1=sc.nextInt();
							System.out.println(" t2 жагсаалтын элементүүдээ оруулна уу");
							for(int i=0; i<hemjee1; i++) {
									t2.add(i, sc.nextInt());
							}
							MyChain intersect=x.intersection(t2);
							System.out.println("intersection "+intersect.toString());
							break;
						case 5:
							MyChain s2=new MyChain();
							System.out.println("s2 жагсаалтын хэмжээг оруулна уу\n");
							int s2Size=sc.nextInt();
							System.out.println(" s2 жагсаалтын элементүүдээ оруулна уу");
							for(int i=0; i<s2Size; i++) {
								s2.add(i, sc.nextInt());
							}
							MyChain un=x.union(s2);
							System.out.println("union "+un.toString());
							break;
						case 6:
								Runtime.getRuntime().exit(0);
						}
			    		System.out.println("\n Таны сонголт");
						choice = sc.nextInt();
					}
			    	sc.close();
		    	} else
					throw new NullPointerException();
		    }
	    	catch(NullPointerException e) {
		    	System.out.println("Та 1-6 тоо оруулна уу");
		    	main(args);
		    }
	    	
	    }
	    catch(Exception e) {
	    	System.out.println("Та сонголтыг тоогоор оруулна уу");
	    	main(args);
	    }
	}
}