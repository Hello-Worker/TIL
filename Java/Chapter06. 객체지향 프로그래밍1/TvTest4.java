
public class TvTest4 {

	public static void main(String[] args) {
		TV[] TVArr = new TV[3];
		
		// TV��ü�� �����ؼ� TV��ü �迭�� �� ��ҿ� ����
		for(int i=0; i < TVArr.length; i++) {
			TVArr[i] = new TV();
			TVArr[i].channel = i+10; // TVArr[i]�� channel�� i+10�� ����
		}
		
		for (int i=0; i <TVArr.length; i++) {
			TVArr[i].channelUp(); // TVArr[i]�� �޼��带 ȣ��. ä���� 1����
			System.out.printf("TVArr[%d].channel=%d%n",i,TVArr[i].channel);
			
		}

	}

}

//class TV{
//	String color;
//	boolean power;
//	int channel;
//	
//	void power() { power = !power; } // TV�� �Ѱų� ���� ����� �ϴ� �޼���
//	void channelUp() { ++channel; }  // TV�� ä���� ���̴� ����� �ϴ� �޼���
//	void channelDown() { --channel;} // TV�� ä���� ���ߴ� ����� �ϴ� �޼���
//}