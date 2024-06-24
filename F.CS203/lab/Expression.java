package lab;  //B210910019 А.Эрхэмбаяр
import java.util.*;
import java.util.Stack;

import dataStructures.*;

public class Expression extends LinkedBinaryTree{
	
	static Scanner sc = new Scanner(System.in);
	
	public static int input() {
		int abc;
		do {
			try {
				String aa = sc.nextLine();
				abc = Integer.parseInt(aa);
				break;
			}
			catch(Exception e){
				System.out.println("Ta utgaa zov oruulna uu");
			}
		}while(true);
		return abc;
	}
	
	public static boolean isOperator(char c) {
		return (!(c >= 'a' && c <= 'z') && !(c >= '0' && c <= '9') && !(c >= 'A' && c <= 'Z'));

	}
	
	public static int getPriority (char C) {
		if(C == '-' || C == '+')
			return 1;
		else if(C == '*' || C == '/') 
			return 2;		
		return 0;
	}
	
	public static String InfixToPrefix (String exp){
		Stack<Character> operators = new Stack <Character>();
		Stack<String> operands = new Stack<String>();
		
		for(int i=0; i<exp.length(); i++) {
			if(exp.charAt(i)=='(') 
				operators.push(exp.charAt(i));
			else if (exp.charAt(i)==')') {
				while(!operators.empty()&&operators.peek()!='(') {
					String op1 = operands.peek();
					operands.pop();
					
					String op2 = operands.peek();
					operands.pop();
					
					char op = operators.peek();
					operators.pop();
					
					String tmp = op + op2 + op1;
					operands.push(tmp);
				}
				operators.pop();		
			}
			else if(!isOperator(exp.charAt(i))) {
				operands.push(exp.charAt(i) + "");			
			}
			else {
				while(!operators.empty() && getPriority(exp.charAt(i))<=getPriority(operators.peek())) {
					String op1 = operands.peek();
					operands.pop();
					
					String op2 = operands.peek();
					operands.pop();
					
					char op = operators.peek();
					operators.pop();
					
					String tmp = op + op2 + op1;
					operands.push(tmp);
				}
				operators.push(exp.charAt(i));		
			}
			
		}
		while(!operators.empty()) {
			String op1 = operands.peek();
			operands.pop();
			
			String op2 = operands.peek();
			operands.pop();
			
			char op = operators.peek();
			operators.pop();
			
			String tmp = op + op2 + op1;
			operands.push(tmp);
		}
		return operands.peek();
	}
	
	static String InfixToPostfix(String exp) {			
		String postfix = InfixToPrefix(exp);
		postfix = PrefixToPostfix(postfix);
		return postfix;
	}
	
	static String PrefixToInfix(String exp) {
		Stack<String> stack = new Stack<>();
		int l = exp.length();
		
		for(int i=l-1; i>=0; i--) {
			char c = exp.charAt(i);
			if(isOperator(c)) {
				String op1 = stack.pop();
				String op2 = stack.pop();
				
			String temp = "(" + op1 + c + op2 + ")";
			stack.push(temp);
			}else {
				stack.push(c +"");
			}
		}
		return stack.pop();
	}
	
	static String PrefixToPostfix(String pre_exp){
        Stack<String> s = new Stack<String>();	 
        int length = pre_exp.length();	 
        for (int i = length - 1; i >= 0; i--){	            
            if (isOperator(pre_exp.charAt(i))) {
                
                String op1 = s.peek();
                s.pop();
                String op2 = s.peek();
                s.pop();
 
                String temp = op1 + op2 + pre_exp.charAt(i);
 
                s.push(temp);
            }	 	           
            else {	               
                s.push(pre_exp.charAt(i) + "");
            }
        }	 
        return s.peek();
	}
	
	static String PostfixToInfix(String exp)
	{
	    Stack<String> s = new Stack<String>();
	 
	    for (int i = 0; i < exp.length(); i++)
	    {
	        if (!isOperator(exp.charAt(i))){
	        	s.push(exp.charAt(i) + "");
	        }		 
	        else{
	            String op1 = s.peek();
	            s.pop();
	            String op2 = s.peek();
	            s.pop();
	            s.push("(" + op2 + exp.charAt(i) + op1 + ")");
	        }
	    }		 
	    return s.peek();
	}
	
	static String PostfixToPrefix(String post_exp)
    {
        Stack<String> s = new Stack<String>();	        
        int length = post_exp.length();
 
        for (int i = 0; i < length; i++) {
 
            if (isOperator(post_exp.charAt(i))) {
 
                String op1 = s.peek();
                s.pop();
                String op2 = s.peek();
                s.pop();
 
                String temp = post_exp.charAt(i) + op2 + op1;
 
                s.push(temp);
            }	 
            else {
                s.push(post_exp.charAt(i) + "");
            }
        }	 	    
        return s.peek();
    }
	
	public static boolean isLeaf(BinaryTreeNode node) {
        return node.leftChild == null && node.rightChild == null;
    }
	
	public static double process(String op, double x, double y)
    {
		if (op.equals("+")) { return x + y; }
        if (op.equals("-")) { return x - y; }
        if (op.equals("*")) { return x * y; }
        if (op.equals("/")) { return x / y; }
 
        return 0;
    }
	
	public static double Bodoh(BinaryTreeNode  node)
    {
		//undes hooson bwl 0 butsna
        if (node == null) {
            return 0;
        }
 
        //navch uguig shalgana
        if (isLeaf(node)) {
            return Double.valueOf(String.valueOf(node.getElement()));
        }
        //recursive-aar bodno
        double x = Bodoh(node.leftChild);
        double y = Bodoh(node.rightChild);

        return process(String.valueOf(node.getElement()), x, y);
    }
	
	public void ExpressionTreeFromPostfix(String elems) {
		   ArrayStack stN=new ArrayStack();
		   Expression t1,t2,temp;
		   
		   for(int i=0; i<elems.length(); i++) {
			   if(Character.isLetterOrDigit(elems.charAt(i))) {
				 temp=new Expression();
				 temp.makeTree(elems.charAt(i), temp, temp);
				 stN.push(temp);
			   }
			   else {
				   temp=new Expression();
				   t1=(Expression)stN.pop();
				   t2=(Expression)stN.pop();
	            temp.makeTree(elems.charAt(i), t2,t1);
	            stN.push(temp);
			   }}
			 		 	   
	   	temp=(Expression)stN.pop();
	   	this.root=temp.root;
	   }
	
	public static void main(String[] args) {
		Expression build = new Expression();
		System.out.println("Ilerhiilel oruulah torloo songono uu: \n 1. infix\n 2. prefix\n 3. postfix");
		String tmp[] = new String[4];
		int a;
		while(true) {
			a = input();
			if(a>3||a<1) {
				System.out.println("Buruu utga oruulsan baina.");
				System.out.println("Ilerhiilel oruulah torloo songono uu: \n 1. infix\n 2. prefix\n 3. postfix");
			}
			else{
				break;
			}
		}
		
		System.out.println("Ilerhiillee oruulna uu");
		tmp[a] = sc.nextLine();
		if(a==1) {
			tmp[2]=InfixToPrefix(tmp[1]);	
			tmp[3]=InfixToPostfix(tmp[1]);
		}
		else if(a==2) {
			tmp[1]=PrefixToInfix(tmp[2]);
			tmp[3]=InfixToPostfix(tmp[1]);
		}
		else if(a==3) {
			tmp[1]=PrefixToInfix(tmp[2]);
			tmp[2]=InfixToPrefix(tmp[1]);
		}
		build.ExpressionTreeFromPostfix(tmp[3]);
		
		int choice;
		try {
			System.out.println("Hiih uildliin torloo songono uu: \n 1. toInfix\n 2. toPrefix\n 3. toPostfix\n 4. bodoh");
			choice = sc.nextInt();
			while(choice!=0) {
	    		switch(choice) {
	    		   case 1:
		    		   System.out.println("Infix " + tmp[1]);
		    		   break;
	    		   case 2:
	    			   System.out.println("Prefix " + tmp[2]);
		    		   break;
	    		   case 3:
	    			   System.out.println("Postfix " + tmp[3]);
		    		   break;
	    		   case 4:
	    			   System.out.println("Hariu: "+Bodoh(build.root));
	    		   case 9:
	    			   System.out.println("Hiih uildliin torloo songono uu: \n 1. toInfix\n 2. toPrefix\n 3. toPostfix\n 4. bodoh");
	    			   break;
	    		   default:
	    			   System.out.println("Ta zov songolt oruulna uu \n Songoltuudiig harah bol 9 iig darna uu");
	    			  
	    		   System.out.println("Таны сонголт\n");
	    		   choice=sc.nextInt();
	    		   }

	    		   choice = sc.nextInt();
			}
	    	System.out.println("Программ дууслаа");
	       
		}
		catch(Exception e) {
			 System.out.println("Aldaa garlaa");
	    	  main(args);
		}
		System.out.println("Number of nodes = " + build.size());

	    System.out.println("Height = " + build.height());
	
	}
}