
public class ArrayEx1 {

	public static void main(String[] args) {
		int[] score = new int[5];
		int k = 1;
		
		score[0] = 50;
		score[1] = 60;
		score[k+1] = 70; // score[2] = 70
		score[3] = 80;
		score[4] = 90;
		
		for (int i=0; i<5; i++) {
			
			System.out.println(score[i]);
		}

	}

}
