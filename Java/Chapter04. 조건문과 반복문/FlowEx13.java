
public class FlowEx13 {

	public static void main(String[] args) {
		int sum = 0;
		int i = 0;
		
		while(true) {
			if(sum > 100)
				break; // break문이 실행되면 아래 두 줄을 수행하지 않고 while문을 완전히 벗어난다.
			++i;
			sum += i;
		} // end of while
		
		System.out.println("i=" + i);
		System.out.println("sum=" +sum);
	}

}
