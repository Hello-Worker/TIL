
public class var2 {

	public static void main(String[] args) {
		int x = 10, y = 20;
		int tmp = 0;
		
		tmp = x;
		x = y;
		y = tmp;
		
		System.out.println("x:" + x + " y:" + y);
	}

}
