
public class FlowEx14 {

	public static void main(String[] args) {
		for(int i=0; i<=10; i++) {
			if(i%3==0)
				continue; // 조건이 참이되어 continue문이 실행되면 블럭의 끝으로 이동
			System.out.println(i);
		} // 여기가 블럭의 끝 

	}

}
