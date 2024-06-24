package bie_daalt3;  //B210910019 А.Эрхэмбаяр

public class ShortestPath {
		
		protected static final int vertex = 9;
		
		public void printDistances(int[] distance) { 
			
			System.out.println("0 - ээс бусад зангилаа руу хүртэлх хамгийн богино зай:");
			for(int i = 0; i < vertex; i++) {
				System.out.println("0 ээс " + i + " хүртэлх хамгийн бага зай бол - " + distance[i]);
			}
			
		}
		
		//hamgiin baga zaig oloh functs
		public int minimumDistance(int[] distance, boolean[] spSet) {
			int indexOfMinimum = -1, minimum = Integer.MAX_VALUE;//hamgiin baga zaitai utgiin index
			
			for(int i = 0; i < vertex; i++) {
				if(!spSet[i] && distance[i] <= minimum) { 
					minimum = distance[i];
					indexOfMinimum = i;
				}
			}
			return indexOfMinimum; 
			
		}
		
		public void dijkstra(int[][] graph, int start) {
			
			int[] distance = new int[vertex]; // tuhain vertex hvrtelh zai
			boolean[] spSet = new boolean[vertex]; // tuhain vertex hvrtel hamgiin baga zai olson eseh
			
			for(int i = 0; i < vertex; i++) {
				distance[i] = Integer.MAX_VALUE; // anhnii vertex bvrt ochih zaig hamgiin ih utgaar awsan
				spSet[i] = false; // hamgiin baga zai oldoogvi uchir bvgd false baina
			}
			
			distance[start] = 0; // ehleh vertex hodlohgvi uchir vertex 0 iin distance
			
			for(int i = 0; i < vertex -1; i++) {
				// chiglel bvriig shalgana 
				
				int iocmd = minimumDistance(distance, spSet); // iocmd = Index of current minimum distance
				                                              // odoogiin hamgiin baga urttai zam
				
				spSet[iocmd] = true; //hamgiin baga zam n oldson vertex iig true bolgono
				
				for(int j = 0; j < vertex; j++) {
					if(!spSet[j] && graph[iocmd][j] != -1 && distance[iocmd] != Integer.MAX_VALUE && distance[iocmd] + graph[iocmd][j] < distance[j]) {
						//hamgiin baga zai oldoogui index bol
						//iocmd - iin daraagiin vertex ruu chigelsen zamtai bol
						//iocmd iin zai n anh awsan hamgiin ih utga bish bol
						//iocmd hurtelh urt deer iocmd-ees daraagiin vertex hvrtel zaig nemhed daraagiin vertex deerh zainaas baga baiwal
						
						distance[j] = distance[iocmd] + graph[iocmd][j];
					}
				}
				
			}
			printDistances(distance);
		} 

		public static void main(String[] args) { 
			
			ShortestPath obj = new ShortestPath();
			int graph[][] = new int[][] 
				{ 
					{ -1,  3, -1, -1, -1, -1, -1,  7, -1 },  
					{  3, -1,  7, -1, -1, -1, -1, 10,  4 },  
					{ -1,  7, -1,  6, -1,  2, -1, -1,  1 },  
					{ -1, -1,  6, -1,  8, 13, -1, -1,  3 },  
					{ -1, -1, -1,  8, -1,  9, -1, -1, -1 },  
					{ -1, -1,  2, 13,  9, -1,  4, -1,  5 },  
					{ -1, -1, -1, -1, -1,  4, -1,  2,  5 },  
					{  7, 10, -1, -1, -1, -1,  2, -1,  6 },  
					{ -1,  4,  1,  3, -1,  5,  5,  6, -1 } 
				
				};  
				
			obj.dijkstra(graph, 0);
						
		}
}